---
description: RTFM guidelines on writing articles in general. Specific types of articles have their own pages.
tags:
    - editors
    - style
    - articles
---
# Articles
This article along with more specific articles describes the structure of specific pages. 

## Front Matter
Pages should have a front matter placed before the first heading.
Front matter is a snippet of yaml that is usually intended to add meta data to a `.md` document.
It is a block of yaml variables wrapped with two `---`.

Every page should have tags listed in its front matter.
A brief description can also be provided.

```yaml
---
description: A brief description that will be displayed when the article is linked to a social media site.
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

## Headings
There should only be 1 level one heading per article.
mkdocs does will not render a table of contents if more than 1 level 1 heading exists.
 
## Equipment
A detail description of the structure of equipment articles can be found at [Equipment](/editors/Style/Equipment Articles.md)

## Software
A detail description of the structure of software articles can be found at [Software](/editors/Style/Software Articles.md)
