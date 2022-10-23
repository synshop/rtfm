# rtfm
![image](https://user-images.githubusercontent.com/8253488/197417157-4953dbc2-caf4-4c98-b270-8e1e24d2bd37.png)

Source code for https://rtfm.synshop.org/ [![Build Status](https://travis-ci.org/synshop/rtfm.svg?branch=master)](https://travis-ci.org/synshop/rtfm)

##### If you'd like to improve this web-site, please submit a pull-request to https://github.com/synshop/rtfm

## Technical Overview

Static web-site source code, builds using [mkdocs](http://www.mkdocs.org/) with content in markdown files.

Builds and deployments are initiated by [GH Actions](./.github/workflows/ci.yml) watching for changes to the master branch of this repo.

Generated website is pushed to [rtfm-generated](https://github.com/synshop/rtfm-generated) and visible at https://rtfm.synshop.org/

