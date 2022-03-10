# rtfm

rtfm site is built with [MkDocs](https://www.mkdocs.org/).  


## Content changes

* [Fork](https://help.github.com/en/github/getting-started-with-github/fork-a-repo) the [rtfm](https://github.com/synshop/rtfm) repo to your user on github
* Go to your copy of the repo (eg https://github/USERNAME/rtfm) and clone it
* if you haven't already, install [mkdocs](https://www.mkdocs.org/#installation) on your local machine.
* create a branch, make your edits
* run "mkdocs build" and verify that the changes look good locally.
* commit your changes them and push the branch up to your github rtfm repo
* create a [pull request](https://help.github.com/en/github/collaborating-with-issues-and-pull-requests/creating-a-pull-request) for your branch against master on the main [rtfm](https://github.com/synshop/rtfm) repo

A SYN Shop member will review and merge your request if it all looks good!

## How content is pushed live

There are two repos to house content.  One repo, [rtfm](https://github.com/synshop/rtfm) houses the raw, unprocessed markdown files. Another repo [rtfm-generated](https://github.com/synshop/rtfm-generated) hosts the processed files that mkdocs generates.  Every time a commit is merged to the `master` branch in `rtfm` the following happens:

1. A [GitHub Action](https://github.com/features/actions) is fired based off of [the ci.yml file](https://github.com/synshop/rtfm/blob/master/.github/workflows/ci.yml). All actions are executed in VMs called runners.  GitHub gives a certain amount of runner hours for free to non-profits.
2. Following the `ci.yml` file, the runner  checks out `master branch`, installs `mkdocs` and generates the HTML for the site in the runner's VM. The site is checked out using a robot account (` monitoring-synshop-bot`) that only has access to push to `rtfm-generated`
3. The runner then pushes the site from `rtfm` repo to the `rtfm-generated` repo. This is destructive, so any pages not on `rtfm` will be deleted. 
4. The [GitHub Pages](https://pages.github.com/) for `rtfm-generated` are configured so that the contents of the repo are served up under `rtfm.synshop.org`
5. `rtfm.synshop.org` is a CNAME for `synshop.github.io` which is set at an org level to show the contents of `rtfm-generated`