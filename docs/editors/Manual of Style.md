---
tags:
    - rtfm
    - editors
    - style
---
# Manual of Style
# Purpose

This manual of style provides editors with guidelines that will help readers use RTFM more intuitively.

# Formatting
## Paragraphs
Text not separated by a blank line will be grouped together as if they were a single paragraph.
an

For ease of editing for future editors, please put each sentence on a separate line when writing a document.

source:

```
This is a sentence.
This sentence follows that sentence.
This sentence is also part of the same paragraph.

This sentence is starts new paragraph.
There is a blank line between this paragraph and the previous one.
This sentence concludes the paragraph.
```

result:

This is a sentence.
This sentence follows that sentence.
This sentence is also part of the same paragraph.

This sentence is starts new paragraph.
There is a blank line between this paragraph and the previous one.
This sentence concludes the paragraph.
## Headings
| element         | syntax                 |
|-----------------|------------------------|
| level 1 heading | `# level 1 heading`    |
| level 2 heading | `## level 2 heading`   |
| level 3 heading | `### level 3 heading`  |
| level 4 heading | `#### level 4 heading` |
| etc.            | ...                    |

## Basic Formatting

| element                         | syntax              | result            |
|---------------------------------|---------------------|-------------------|
| bold                            | `**bold**`          | **bold**          |
| italic                          | `*italic**`         | *italic*          |
| verbatim (inline code)          | `` `code` ``        | `code`            |

### pythhon-markdown Extended Syntax
| element       | syntax              | result            |
|---------------|---------------------|-------------------|
| highlight     | `==highlight==`     | ==highlight==     |
| underline     | `^^underline^^`     | ^^underline^^     |
| strikethrough | `~~strikethrough~~` | ~~strikethrough~~ |
| subscript     | `sub~script`        | sub~script        |
| superscript   | `super^script`      | super^script      |
| keyboard      | `++keyboard++`      | ++keyboard++      |

## Lists
### ordered lists
ordered lists are denoted by a group of lines where each line starts out with a number and a period.
markdown will automatically publish the correct number order even if the raw input is out of order.

syntax:
```
1. item 1
8. item 2
3. item 3
```

result:
1. item 1
8. item 2
3. item 3

### unordered list

syntax:
```
- an item
- another item
- an other item
- another other item
```
result:
- an item
- another item
- an other item
- another other item

## mkdocs-material Extensions
### Admonitions
### Grids
# Front Matter
Pages should have a front matter placed before the first heading.
Front matter is a snippet of yaml that is usually intended to add meta data to a `.md` document.
It is a block of yaml variables wrapped with two `---`.

Every page should have tags listed in its front matter.
A brief description can also be provided.

```yaml
---
description: A brief description can be provided here.
tags:
    - tag
---
```

There should be a few tags to help readers understand what kind of page it is.
Tags should be all lowercase and tags should be ordered from general to more specific.
If there is insufficient information, the top tag should be `STUB` in capital letters.
`STUB` should be the only tag that uses capital letters.

for example:

```yaml
---
description: This machine prints things
tags:
    - STUB
    - equipment
    - print and office
    - print
    - paper
---
# A Print Machine
```

# Equipment
## Titles and file names
### Filenames
File names should be .md files using a common name. 
The name of the file is the name of the page's url link (rtfm.sysshop.org/users/Equipment/[filename]) This is different from the title of the page.

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
For new equipment entries copy equipment_template.md and rename it to the appropriate file name.

A template for equipment pages is provided at:

### Manuals
Links to the equipment's full manual should be provided under this heading.

### Firmware, Drivers, and Software
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
This section should express to a reader what the machine does, and why someone would use it.

#### Specifications
List information about the sizes of material it can take under this heading.

### Cost and Consumables 
This section should describe any additional costs past a membership to use this machine.
It should articulate what materials are potentially consumed during usage.

### Usage
This section should describe the specific usage of a machine and provide adequate instructions on how to use that machine.

### Maintenance
This section should list maintenance tasks. This ideally should be summarized with a markdown table with the name description and frequency of the task. 
A detail set of instructions can be provided in subheadings.

| task   | description                           | frequency       |
|--------|---------------------------------------|-----------------|
| task 1 | This is a task that needs to be done. | hourly      |
| task 2 | This task also needs to be done       | every few years |
|        |                                       |                 |

#### Maintenance Log
Any notable issues should be posted under this heading.

### Troubleshooting
This provides a list of common issues and steps to fixing them.


# Software
Software pages on RTFM should provide information relevant to using it at the shop.
The do not need to be comprehensive restatements of the original documentation.
Additional features can refer to the original software's documentation.
