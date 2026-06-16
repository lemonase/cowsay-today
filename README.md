# Daily `fortune` delivered by a random `cow`

<!--toc:start-->
- [Daily `fortune` delivered by a random `cow`](#daily-fortune-delivered-by-a-random-cow)
  - [What does it do?](#what-does-it-do)
  - [How about curl?](#how-about-curl)
  - [Directory Structure](#directory-structure)
  - [How does it run?](#how-does-it-run)
  - [Notable sightings](#notable-sightings)
    - [Thanksgiving 2024](#thanksgiving-2024)
  - [Suggestions](#suggestions)
  - [Fin](#fin)
<!--toc:end-->

`gen_cowsay.sh` is a bash script that runs on a server.

We have DNS records that say http://cowsay.today runs on a server *somewhere*
on the internet (hopefully).

## What does it do?

It makes HTML and TXT files for your browser or HTTP client.

## How about curl?

Yep, just do this for plain text :)

```shell
curl -sL https://cowsay.today/today.txt
```

## Directory Structure

```
/ (https://cowsay.today/)
├── all -> days
├── days
│   ├── conv_html.sh
│   ├── html
│   └── txt
├── today.html -> /var/www/daily-cowsays/days/html/2026-06-16-cowsay.html
└── today.txt -> /var/www/daily-cowsays/days/txt/2026-06-16-cowsay.txt
```

So if you wanted to get a previous day - you would do so like this

```
curl -sL https://cowsay.today/days/txt/2026-05-15-cowsay.txt
```

or the equivalent HTTP: https://cowsay.today/days/html/2026-05-15-cowsay.html

## How does it run?

On the daily using [cron](https://en.wikipedia.org/wiki/Cron).

```
0 1 * * * /path/to/gen_cowsay.sh
```

It runs errday on a Linux (Debian) server hosted *somewhere*.


## Notable sightings

Here are some things that went down... so far

### Thanksgiving 2024

On Thanksgiving 2024, the script ran with the turkey cowfile.

```
~ % curl https://cowsay.today/all/txt/2024-11-28-cowsay.txt
Today is 11/28/24.
Here is your daily fortune from "turkey".
 _________________________________________
/ Your object is to save the world, while \
\ still leading a pleasant life.          /
 -----------------------------------------
  \                                  ,+*^^*+___+++_
   \                           ,*^^^^              )
    \                       _+*                     ^**+_
     \                    +^       _ _++*+_+++_,         )
              _+^^*+_    (     ,+*^ ^          \+_        )
             {       )  (    ,(    ,_+--+--,      ^)      ^\
            { (@)    } f   ,(  ,+-^ __*_*_  ^^\_   ^\       )
           {:;-/    (_+*-+^^^^^+*+*<_ _++_)_    )    )      /
          ( /  (    (        ,___    ^*+_+* )   <    <      \
           U _/     )    *--<  ) ^\-----++__)   )    )       )
            (      )  _(^)^^))  )  )\^^^^^))^*+/    /       /
          (      /  (_))_^)) )  )  ))^^^^^))^^^)__/     +^^
         (     ,/    (^))^))  )  ) ))^^^^^^^))^^)       _)
          *+__+*       (_))^)  ) ) ))^^^^^^))^^^^^)____*^
          \             \_)^)_)) ))^^^^^^^^^^))^^^^)
           (_             ^\__^^^^^^^^^^^^))^^^^^^^)
             ^\___            ^\__^^^^^^))^^^^^^^^)\\
                  ^^^^^\uuu/^^\uuu/^^^^\^\^\^\^\^\^\^\
                     ___) >____) >___   ^\_\_\_\_\_\_\)
                    ^^^//\\_^^//\\_^       ^(\_\_\_\)
                      ^^^ ^^ ^^^ ^
```

This was a monumental moment for the season. Truly prophetic words.
We may learn much from the wise turkey.

## Suggestions

Reach out here on GitHub. Make an Issue or shoot me an email.

## Fin

That's it. That's all there is.
