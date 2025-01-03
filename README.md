# Daily `fortune` delivered by a random `cow`

`gen_cowsay.sh` is a bash script that runs on a server somewhere.

We have DNS records that say http://cowsay.today is that server.

## What does it do?

It makes HTML and TXT files for your browser or HTTP client.

## How about curl?

Yep, just do this for plain text :)

```shell
curl -sL https://cowsay.today/txt
```

## How does it run?

On the daily using [cron](https://en.wikipedia.org/wiki/Cron).

```
0 1 * * * env USER=$LOGNAME /home/$USER/src/cowsay-today/gen_cowsay.sh
```

It runs errday on Linux (a debian server).

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
