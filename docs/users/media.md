# Media

## About

Media (media.synshop.org aka 10.0.40.19) is a server that houses files.  It is only accessible when
you're in the shop and using our WiFi.

## FTP

To access the site via FTP, use anonymous FTP which might be supported by your browser via this
link: [ftp://media.synshop.org](ftp://media.synshop.org). 
(or it [may not](https://www.bleepingcomputer.com/news/google/chrome-and-firefox-developers-aim-to-remove-support-for-ftp/)!)

## HTTP

To access the site via a browser, click this link: [http://media.synshop.org](http://media.synshop.org).


## rsync (on a mac/linux client)

To access the site via rsync

1. First find the folder(s) you want to download via FTP or HTTP (see above).
  For example, if you wanted to download all of the 
presentations from HOPE 2018, you would find this URL: 
[http://media.synshop.org/pub/infocon.org/cons/2600/The%20Circle%20of%20HOPE%20(2018)/](http://media.synshop.org/pub/infocon.org/cons/2600/The%20Circle%20of%20HOPE%20(2018)/)
1. Grab the path from the end of the ULR and preface it with a period. Replace any `%20` with `\ ` (escpaced space)
 and escape any "odd" characters (eg. `(` -> `\(`. Using the above example 
that'd be: `./pub/infocon.org/cons/2600/The\ Circle\ of\ HOPE\ \(2018\)/`
1. To sync all these to the current directory you're in, you'd run this command and enter the password `media` when
prompted: `rsync -avz  -e ssh --progress "media@10.0.40.19:./pub/infocon.org/cons/2600/The\ Circle\ of\ HOPE\ \(2018\)/" .`