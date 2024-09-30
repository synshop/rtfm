# Front Kiosk Display

While it's a work in progress, as of Nov 2019, it looks like this:

![](../images/front.kiosk3.jpg)

And the mini-display and computer looks like this:

<img style="width: 50%;" src="../../images/kiosk.rasbperry.pi.jpeg">

So what is all this stuff and how does it work?!  The large top display
is simply a TV.  This one happens to be an industrial one normally used in a 
commercial setting.  Unlike a TV you might have at home, it has no tuner
built in to it, so only works with HDMI inputs like you might have on your
DVD player or streaming device (eg Roku).

The device below is where all the magic happens though.  This is a
[Raspberry Pi computer](https://en.wikipedia.org/wiki/Raspberry_Pi).  While
tiny, it has the ability to power the larger monitor using HDMI. What you're
 seeing on the screen is a web browser, but it has no menus or scroll bars showing.
The Raspberry Pi also has a WiFi radio so it can get on our shop network and out to the internet.
As well, it has 
[General purpose input-output (GPIO)](https://en.wikipedia.org/wiki/Raspberry_Pi#General_purpose_input-output_(GPIO)_connector) 
connectors so it can power things like the very small display as well as the
temperature sensor.

If you want to build your own version of these, all the software is online 
and open source:

  * Forecast and temperature software is called [YANPIWS](https://github.com/Ths2-9Y-LqJt6/YANPIWS).
  * The display of upcoming events is from our MeetUp page and is displayed
    using [MeetupEvents](https://github.com/Ths2-9Y-LqJt6/MeetupScraper).
  * The spinning shop logo is just an SVG image and you can download it from 
    [this wiki](Logos). To read more about CSS animations, 
    check out [getflywheel's site](https://getflywheel.com/layout/svg-animations-css-how-to/ )!
  * The list of members who have recently used their fob to unlock the front door, comes 
    from our security system.  Read more about on the [fobber project](https://github.com/Ths2-9Y-LqJt6/fobber)!
