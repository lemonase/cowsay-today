#!/usr/bin/env bash

# Generate a new `fortune | cowsay` with a rando cow
# **          **
# \m/ errday \m/

# crontab -l
# m h  dom mon dow   command
# 0 1 * * * env USER=$LOGNAME /home/$USER/src/cowsay-today/gen_cowsay.sh
# ---
# NOTE: $USER env var is unset with script executed from cron, but we
# can fix this by setting USER to $LOGNAME in our crontab so we don't have
# to check in the script (nice default variable from cron, very cool)

DAILY_COWSAY_DIR="/home/$USER/www/daily-cowsays"
DAILY_COWSAY_TXT="$DAILY_COWSAY_DIR/days/txt/$(date -I)-cowsay.txt"
DAILY_COWSAY_HTML="$DAILY_COWSAY_DIR/days/html/$(date -I)-cowsay.html"

TODAY_COWSAY_TXT="$DAILY_COWSAY_DIR/today.txt"
TODAY_COWSAY_HTML="$DAILY_COWSAY_DIR/today.html"

if [ ! -d "$DAILY_COWSAY_DIR/days" ]; then
  mkdir -p "$DAILY_COWSAY_DIR/days"
fi

if [ ! -f "$TODAY_COWSAY_TXT" ]; then
  touch "$TODAY_COWSAY_TXT"
fi

# sample only current cowfiles
COW_FILES="$(/usr/games/cowsay -l | sed '1d' | xargs)"
read -a COW_FILE_ARR <<< "$COW_FILES"
CUR_COWFILE="${COW_FILE_ARR[ $RANDOM % ${#COW_FILE_ARR[@]} ]}"

# write the daily txt file
echo "Today is $(date +'%D').
Here is your daily fortune from \"$CUR_COWFILE\"." > $DAILY_COWSAY_TXT
(/usr/games/fortune | /usr/games/cowsay -f $CUR_COWFILE) >> $DAILY_COWSAY_TXT

# write the daily html file
prev_date=$(date -I --date=-1day)
next_date=$(date -I --date=+1day)
echo "<html>" > "$DAILY_COWSAY_HTML"
echo "<a href="/all/html/$prev_date-cowsay.html">&lt prev day</a> || " >> "$DAILY_COWSAY_HTML"
echo "<a href="/all/html/$next_date-cowsay.html">next day &gt</a>" >> "$DAILY_COWSAY_HTML"
echo "<pre>" >> "$DAILY_COWSAY_HTML"
cat $DAILY_COWSAY_TXT >> "$DAILY_COWSAY_HTML"
echo "</pre>" >> "$DAILY_COWSAY_HTML"

rm "$TODAY_COWSAY_TXT"
rm "$TODAY_COWSAY_HTML"

ln -s "$DAILY_COWSAY_TXT" "$TODAY_COWSAY_TXT"
ln -s "$DAILY_COWSAY_HTML" "$TODAY_COWSAY_HTML"
