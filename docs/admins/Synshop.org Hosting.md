# Synshop.org Hosting 

## Intro 

The main [shop website](https://synshop.org) is hosted on [Cloudflare](https://www.cloudflare.com/plans/free/) . GitHub Actions 
pulls from the [main repo on github](https://github.com/synshop/synshop.org) and then uses [Jekyll](https://jekyllrb.com/) to build the site so we can push static files to Cloudflare's servers.

## Updating the website

1. Create a Pull Request of the [main repo on github](https://github.com/synshop/synshop.org) with some content changes.  These will be published to their own ephemeral site [like this](https://github.com/synshop/synshop.org/pull/32#issuecomment-1741900656):
> Deploying with  Cloudflare Pages  Cloudflare Pages
>
> Latest commit: 	4492789
>
> Status:	 ✅  Deploy successful!
>
> Preview URL:	https://6ca0cb6a.synshop-org.pages.dev
>
> Branch Preview URL:	https://29-favicon-logo-refactor.synshop-org.pages.dev

2. Get the Pull Request Approved
3. When the Pull Request is merged to `main`, GitHub Actions will publish it to Cloudflare and be live on synshop.org

