---
description: Guide on basic formatting available in RTFM.
tags:
    - style
    - formatting
---
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
| subscript     | `sub~script~`       | sub~script~       |
| superscript   | `super^script^`     | super^script^     |
| keyboard      | `++enter++`         | ++enter++         |

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

* [Admonitions](Admonitions) - [mkdocs-material documentation](https://squidfunk.github.io/mkdocs-material/reference/admonitions/)
* [Grids](Grids) - [mkdocs-material documentation](https://squidfunk.github.io/mkdocs-material/reference/grids/)
