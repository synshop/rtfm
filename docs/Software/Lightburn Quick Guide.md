# 🛠️ Getting Started with LightBurn: A Quick Guide for First-Time Users

LightBurn is a powerful design and control software for laser cutters. Whether you're engraving wood, cutting acrylic, or marking metal, this guide will help you launch your first project with confidence.

## 🔌 Connectors
  - You'll need to use a USB drive to get files to Lightburn computer
  - If you have a USB-C only USB drive, bring an adapter for USB-A.

## 🔌 Setup & Device Connection
- Turn on the computer attached to the laser cutter. 
- First Child's computer is mounted on the wall - find the power button here when using First Child.)
- Launch LightBurn (type "LightBurn" into the search bar)
- Confirm your **workspace size** matches your laser bed dimensions.
- If the laser cutter isn't responding to Lightburn,  use "Find My Laser" if connected via USB, or manually enter specs for networked machines.

## 🖼️ Workspace Overview
- **Left Toolbar**: Basic drawing tools—rectangle, circle, line, text.
- **Center Canvas**: Your design area. Drag, resize, and position elements here.
- **Right Panels**:
  - **Laser**: Controls for starting/stopping jobs.
  - **Cuts/Layers**: Assign power, speed, and mode (cut/engrave) to each design element.
  - **Console**: View G-code and send manual commands.

## ✏️ Creating Your First Design
- Use shape tools to draw or import a file (`.SVG`, `.DXF`, `.AI`, `.PNG`). Prefer vectors such as .svg
- Assign each object to a **layer** and configure settings:
  - **Speed**: How fast the laser moves. Try: 4 for cardboard, 1 for ply, 0.7 for 1/8 MDF.
  - **Power**: Laser intensity (as a percentage). Try: 15% for cardboard. 40% for 1/8" wood. 60% MDF 1/8".
  - **Mode**: Line (cut), Fill (engrave), or Offset Fill.
- If you don't care about burned-looking edges, you can increase the power a bit, to make sure you make it through the stock.

## 📐 Positioning & Preview
- Suggestion: For Line (cut) mode, try on cardboard first (light medium requires only Speed:4 and Power ~15%)
- Different printers have different effective areas, even within the working space. For example, on First Child, the light 'Power' may need to be increased to effect cuts in the bottom 1/5. 
- Use the **Frame** button to test that the shapes will fit on the medium in the machine.
- Click **Preview** to simulate the job and estimate time.

## 🚀 Sending the Job
- Double-check your material placement.
- Double-check that the machine is on (some machines need to be 'on' at the Power Strip) and that Lightburn sees it. You might need to restart Lightburn.
- Double-check that the air is on (it should come on automatically.
  - Don't mess with the wall switch unless you know what you are doing. The wall-switch is 'off by default' when switched to the right. Ask someone if you are unsure.
- Double-check the 'Focal length' using the little orange tool (hang it on the arm). Other projects may have had a thicker project material; you will need to move the bed up or down until the orange arm rests exactly.
- Click **Start** to begin the job.
- Monitor progress and pause if needed.

## 🧰 Tips & Safety
- Always wear safety glasses.
- Ventilate your workspace.
- Use scrap material to test settings before final runs.
- For Line (cut) mode: Look for smoke coming from the underside of the project. This indicates it has successfully cut all the way.
- Re-running a cut twice is fine, but you do not move the stock. It is near impossible to get back in the exact same position after moving it.
- First child sometimes needs a support bar to keep the top lid open 

## 🧰 Advanced Considerations
- Does  project need [fiducials](https://en.wikipedia.org/wiki/Fiducial_marker)? Design time is the best time to add them.
- Does your project have lots of small bits and bobs? Consider adding numbering on the back-side of the bits before you cut.

## 🧰 Cleanup and Shutdown
- Leave it cleaner than you found it
- Turn off power
- Shop vac any small pieces you see left in laser cutter   
- Unwanted larger scrap can be put in the labeled  "scrap" bin so other members may use it


---
