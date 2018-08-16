# Working with Adobe Illustrator and RetinaEngrave

Adobe Illustrator is a fairly common vector art tool, but its not available at SynShop.  The computer hooked up to the laser cutter has both CorelDraw and Inkscape on it if you are familiar with either, though as an Illustrator user I found both to be lacking in features I needed and confusing.  Both of those programs seem to print reasonably well into RetinaEngrave via the Full Spectrum driver, but AI seems to have issues.

Helpful Tips and Useful Info:

* Make cut lines as thin as it will let you, try 0.001 width stroke lines with no fill
* Raster lines get weird, you can experiment with width, but double check how it looks in RetinaEngrave, at a certain thickness it decides its not one line, but instead gives you the outline of the space your line took up.
* If you plan on doing a raster engrave then vector cut, make your cut lines a lighter color than your raster lines, something like a light blue or green is visible, and will be easier to cut out later.
* Text....is a pain.  No matter what I do, I can't seem to get RetinaEngrave to understand solid letters.  Fortunately for my project, it was a small enough gap that the end result looks like a single engrave line
* The saddest truth about using Illustrator is that the safest, most correct way to get it into RetinaEngrave is to print your .ai file without scale adjustment to a PDF.  Don't ask, I don't know, but it makes my head hurt too.
* Once you have a .pdf, you can open it and use the PDF reader to print via the Full Spectrum driver
* <b>MAKE SURE TO SET A PAPER SIZE BIG ENOUGH</b>.  I believe its Foxit Reader on the computer hooked up to the laser cutter, and it will happily ignore the contents of the document when the checkbox 'Choose paper source by PDF page size' is checked.  Instead uncheck that and go to the Properties of the Full Spectrum driver and find something larger than the measurement of your design, for instance to get my 12 x 12 design into RetinaEngrave I had to select C size sheet
* Printing this way will import the design into RetinaEngrave