---
tags:
  - STUB
  - equipment
  - print
  - and
  - office
  - print
  - fabric
  - ink
---
# iehk A4 DTG Printer A4 Garment Printer

## WARNINGS
This machine is not fully functional yet. 
We currently need a printhead to replace the current one.

## Manuals 
The manuals for this machine are on the printroom compute.
Please note that these manuals are not comprehensive.

## Firmware, Drivers, and Software
The required and optional software are installed on the print room laptop.
The DTG Software requires a physical encryption key.
Therefore it is only available on the print room lap top.
DO NOT INSTALL ANY OF THE REQUIRED SOFTWARE OR DRIVERS ON YOUR OWN DEVICE.
The final print must be done on the print computer.

### Required
<<<<<<< HEAD
|----------------------------------|------------------------------------------------------------------|
=======
|---|---|
>>>>>>> 6d9e5ac97afaa3917612588cdd8380e2720f6b5c
| [DTGRIP](/users/Software/DTGRIP) | The software that lets you tweak the DTG settings prior to print |
| EPSON Driver                     | The driver is preinstalled on the computer.                      |
|                                  | DO NOT UPDATE THIS DRIVER. THE DTG WILL BE BRICKED.              |

### Optional
<<<<<<< HEAD
|------------------------------------------------------------------|---------------------------------------------------------------------|
| [Image Manipulation Program](/users/Software/Image Manipulation) | Software that lets you alter images. GIMP, Photoshop, Krita         |
| [Vector Graphics Program](/users/Software/Vector Graphics)       | Software that edits vectorized graphics. Size independent software. |
=======
|---|---|
| [Image Manipulation Program](/users/Software/Image Manipulation) | Software that lets you alter images. GIMP, Photoshop, Krita |
| [Vector Graphics Program](/users/Software/Vector Graphics)       | Software that edits vectorized graphics. Size independent software.                                                            |
>>>>>>> 6d9e5ac97afaa3917612588cdd8380e2720f6b5c

## Cost and Consumables 
This machine uses fabric and printer ink.
The fabric is expected to be personally supplied, while the shop will supply the ink.
Ink Costs TBD.

## Function
This machine prints CMYK(W) images directly to fabrics and garments.
It can print on both light and dark garments, although darker garments will require additional procedures.
    
### Specifications
This machine can print images up to A4 papers size.
It may be able to print more with additional adjustments.

## Usage
Please note different fabrics will have different qualities and issues.
### Preparation
#### General
* Please see [DTGRIP](/users/Software/DTGRIP) for a comprehensive guide to software settings.
* Shake ink bottles.
* Load fabric.
   * The top of the software will print on the side closest to the front of the machine. 
   1. Flatten shirt on panel.
   2. Place frame to hold it in place.
   3. Tug shirt taught.
   4. Press the arrow pointing toward the back of the machine on rocker switch marked "in and out stop".
    - If the shirt is not in the back of the machine, it will throw an out of paper error.

#### Colored Shirts
##### Optional Image Armour ULTRA Dark Shirt Formula
1. Spray down shirt with Image Armour ULTRA Dark Shirt Formula.
2. Heat shirt at 330F for 30 seconds (follow instructions on main bottle).
##### Check Black Handling
1. In DTGRIP go to the `White` tab.
2. Set `Black Handling`
   * Color Shirts - If printing color set it to 100%. 
   * Black/Dark Shirts - If on color check the `white` and `preview` views, and set threshold to desired level.

### Print
#### White Shirt
1. `File` drop down, then `Print...`
2. Make sure it is on the correct port `USB002 <EPSON L805 Series T-shirt DTG>`. Otherwise close and change it in the printer tab.
3. Make sure `WHITE+COLOR` is **NOT** checked.
4. `Print`

#### Colored Shirt
1. `File` drop down, then `Print...`
2. Make sure it is on the correct port `USB002 <EPSON L805 Series T-shirt DTG>`. Otherwise close and change it in the printer tab.
3. Check the `WHITE+COLOR` Option.
4. `Print`

## Maintenance
| Task             | Description                                                                                        | Frequency                         |
|------------------|----------------------------------------------------------------------------------------------------|-----------------------------------|
| Nozzle Cleaning  | The Nozzles must be cleaned daily, or ink could dryout and clog the lines, dampers, and printhead. | Daily                             |
| Bottle Shaking   | The inks must be agitated or the pigments will settle                                              | Daily                             |
| Dump Wastebottle | Empty waste bottle into sink                                                                       | when waste bottle is 2/3rds full. |
|                  |                                                                                                    |                                   |

### Nozzle Cleaning
#### Computer
1. Open DTGRIP.
2. `File` drop down, `Nozzle Cleaning` (`F12`)
3. Repeat step 2.

#### Manual
1. Place silicone tube on syringe.
2. Run printhead.
3. Unplug printer while the head is running.
4. load a rag into t-shirt printer.
5. move rag under printhead/printhead over rag.
6. Remove ink dampers.
7. Place other end of silicone tube on printhead nozzle.
8. Slowly squeeze syringe.
   * DO NOT FORCE. If syringe does not go, let it sit for a longer period and try squeezing again.
9. Repeat 7 and 8 for all 6 nozzles.
10. Replace dampers.
11. Plug printer back in.
12. Power on.

### Bottle Shaking.
1. Shake each ink bottle.
2. Repeat step 1 for all bottles of ink.
3. Run the clean nozzle function until all settled ink is gone in the lines. (eg. when the white ink is transparent, run `clean nozzles` until the lines are white again.)

### Dump Waste Bottle 
The waste bottle is in the back of the machine.

### Maintenance log
To be checked on discord.

## Troubleshooting
