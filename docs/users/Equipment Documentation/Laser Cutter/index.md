# Laser Cutter

The laser cutter is from Full Spectrum Engineering, and has a useable cutting area of 24" by 18".  
It is driven by the RetinaEngrave software(version to be added) which is available as a free download from FSE or the RetinaEngrave printer driver.

##RetinaEngrave

The cardinal rule of RetinaEngrave is that it's stupid.  If, at any point, you are doing something and the thought occurs that 'the software should know', stop right there because it probably does not. Some things that might save others some headache, frustration, and wasted time/materials:

* Double check your design between the program you started in, and RetinaEngrave.  The print driver is not smart, and cuts off sections if it resets to the standard letter size, can scale things when you need exact sizes, and most annoyingly renders solid lines into multiple ones at seemingly random.  That last one is just a loooot of trial and error to make lines thinner before printing to RetinaEngrave, or cleaning it up inside RE.
* It's good to follow the Laser Cutter checklist, but make note of your settings before you start, and be prepared to fix them all right before you start(press G).  A particular annoyance, the dropdown between Vector, Raster, or Raster then Vector.  It likes to reset that after doing a perimeter trace.
* Be prepared for experimentation on power vs speed.  Two passes at higher speed and lower power may cut better, take less time, and have less burn than one at lower speed and higher power.

## Subpages
* [Working With Adobe Illustrator and RetinaEngrave](./AI.md)
* [Double Sided Laser Engraving and RetinaEngrave](./DoubleSidedEngraving.md)