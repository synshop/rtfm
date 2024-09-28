---
description: RTFM Guidelines on editing equipment articles. Remember it's like answering questions!
tags:
    - editors
    - style
    - equipment
---
# Equipment Articles
## Titles and file names
### Filenames
File names should be .md files using a common name. 
The name of the file is the name of the page's url link (rtfm.sysshop.org/Equipment/[filename]) This is different from the title of the page.

### Titles
Level 1 headings should be reserved exclusively for naming individual pieces of equipment or The page in general.
All headings in Contents will be level 2 headings or lower in priority.

The first level 1 heading will be recognized as a page title.
The title of a page depends on whether the page lists a single machine or multiple machines of different models.
If the page is only about 1 model of machine the title should have the following format:
`Manufacturer Model Maximum size Common name`

If the page contains multiple machines then the 1st primary heading should be the common name of the machine. Each subsequent primary subheading should have the following format:
`Manufacturer Model number Maximum size`

## Contents
!!! tip "Answering Questions"
    When filling out the contents of a template, treat each heading like you are answering someone's question about a piece of equipment.
    The following section provides questions for each heading.
    
For new equipment entries copy [equipment_template.md](https://raw.githubusercontent.com/synshop/rtfm/refs/heads/master/docs/editors/Templates/equipment_template.md) and rename it to the appropriate file name.

### Manuals
!!! question "Where can I get more information about this equipment?"

Links to the equipment's full manual should be provided under this heading.

### Firmware, Drivers, and Software
!!! question "Will I need to use any computer programs? What do I need to download?"
    If the answer to the first question is no, you can remove this heading and its subheadings.
    
Relevant programs related to the equipment should get listed here.
Information about whether the software is already available on SYN Shop computers should also be indicated under this heading.
Distinguish between necessary and optional firmware in the subheadings below.
A sentence describing the software should be provided after each link.
A more detailed description of each software should be provided in a separate page for each individual software.

#### Required
Firmware, drivers, and software necessary to operate the equipment should be listed under this heading.
For example:
Firmware - The firmware that is installed on the equipment, please ask a board member if you believe the firmware should be updated.
Driver - The driver that needs to be installed on computers that interact with this equipment.
Software - The software necessary to operate this equipment.

#### Optional
Software that is relevant, but optional can be listed under this heading.
If there are multiple programs that serve the same function, consider making subheadings.

### Function
!!! question "Why would I need to use this equipment? What can it do?"

This section should express to a reader what the machine does, and why someone would use it.

#### Specifications
!!! question "How big, how much?"

List information about the sizes of material it can take under this heading.

### Cost and Consumables 
!!! question "Does this equipment consume any materials?"
    Does the shop provide any materials?
    What is a fair donation to the shop if it does?

This section should describe any additional costs past a membership to use this machine,
what is a fair donation if it uses shop provided consumables,
and also what of the member's material will be consumed.
It should articulate what materials are potentially consumed during usage.

### Usage
!!! question "How do I use this?"

This section should describe the specific usage of a machine and provide adequate instructions on how to use that machine.

### Maintenance
!!! question "What should be regularly checked on this equipment?"

This section should list maintenance tasks. This ideally should be summarized with a markdown table with the name description and frequency of the task. 
A detail set of instructions can be provided in subheadings.

| task   | description                           | frequency       |
|--------|---------------------------------------|-----------------|
| task 1 | This is a task that needs to be done. | hourly          |
| task 2 | This task also needs to be done       | every few years |
|        |                                       |                 |

#### Maintenance Log
Any notable issues should be posted under this heading.

### Troubleshooting
!!! question "Why isn't it working!?"

This provides a list of common issues and steps to fixing them.

