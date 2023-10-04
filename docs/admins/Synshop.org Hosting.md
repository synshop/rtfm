# Synshop.org Hosting 

## Intro 

The main [shop website](https://synshop.org) is hosted on new lagos (`new-lagos.synshop.org`) via [Certbot](https://certbot.eff.org/). A script 
pulls from the  [main repo on github](https://github.com/synshop/synshop.org) and then uses [Jekyll](https://jekyllrb.com/) to build the site into the directy 
where [Caddy](https://caddyserver.com/) serves the static files from.  There is a script that runs every 5 minutes to check for a new version on Github.

## Updating the website

1. Edit the  [main repo on github](https://github.com/synshop/synshop.org) with some content changes.  Merge these to `main`
2. Go to [the "New Release" page](https://github.com/synshop/synshop.org/releases/new).
3. In the "Choose a tag" button, enter the next logical version. If you're on `1.1.0`, use `1.2.0`. Click "Create new tag: 1.2.0" 
4. For "Release title" enter the same value (eg `1.2.0`)
5. Optionally, in the "Describe this issue" cite the issue numbers or PRs in this release
6. click "Publish Release"

With in 5 minutes your content will be live based on continuious deplyment scripts below.

## Setup on Lagos New

This is only a one time task that's already been done, but just in case it needs to be done again:


### Web files and server

1. create a `synshop-org` user
1. as `synshop-org` user, `git clone` the  [main repo on github](https://github.com/synshop/synshop.org) into `/home/synshop-org/synshop.org`
1. as `root`, create `/srv/synshop.org`
1. as `root`,  copy `/home/synshop-org/synshop.org/_site/*` to  `/srv/synshop.org/.` and make it all 
owned by `synshop-org` user: `chown synshop-org:synshop-org -R /srv/synshop.org/`
1. as `root`, install  [Caddy](https://caddyserver.com/)
1. as `root`, Create a file called `/etc/caddy/Caddyfile` with this contents:
   ```
    synshop.org {

            root * /srv/synshop.org
            file_server

            handle_errors {
                    @404 {
                            expression {http.error.status_code} == 404
                    }
                    handle @404 {
                            rewrite * /404.html
                            file_server
                    }
            }

    }
    www.synshop.org {
            redir https://synshop.org{uri}
    }
    wiki.synshop.org {
            redir https://rtfm.synshop.org
    }
    dev.synshop.org {
            redir https://synshop.org
    }
   ```
   
1. make sure Caddy is started and enabled with `systemctl start caddy` and `systemctl start caddy`

### Continuous deployment scripts

1. as `root`, install [Jekyll](https://jekyllrb.com/)
1. as `synshop-org` user, ensure that you can build the site with this command:
```
cd /home/synshop-org/synshop.org
bundle config set --local path 'vendor/bundle'
bundle exec jekyll build -d /srv/synshop.org
```
1. as `synshop-org` user, create a file called `/home/synshop-org/build-site.sh` with this contents:
```
cd /home/synshop-org/synshop.org
bundle config set --local path 'vendor/bundle'
bundle exec jekyll build -d /srv/synshop.org
```
1. as `synshop-org` user, make the file executable: `chmod +x /home/synshop-org/build-site.sh`
1. as `synshop-org` user, make the file executable: `chmod +x /home/synshop-org/check-for-updates-and-push.sh`
1. as `synshop-org` user, Add a cron job for every 5 minutes to run `check-for-updates-and-push.sh`
1. as `synshop-org` user, make another file called `/home/synshop-org/check-for-updates-and-push.sh` with this contents:
```bash
# Checks for local version (current) and then remote version on GH (latest)

# and if they're not the same, run update script
#
# uses lasttversion:  https://github.com/dvershinin/lastversion
# see: https://blog.plip.com/2023/09/17/dead-simple-continuous-deployment/

current=$(cd /home/synshop-org/synshop.org;/usr/bin/git describe --tags)
latest=$(/usr/local/bin/lastversion https://github.com/synshop/synshop.org)

update(){
        cd /home/synshop-org/synshop.org
        git fetch
        git -c advice.detachedHead=false checkout "$latest"
        /home/synshop-org/build-site.sh
}

# todo - put in production discord webhook address instead plip placeholder
announce(){
        /usr/bin/curl -i -H "Accept: application/json" -H "Content-Type:application/json" -X POST --data "{\"content\": \"Website has been updated from "$current" to "$latest". Check it out at https://synshop.org .  See changes at https://github.com/synshop/synshop.org/releases/tag/"$latest"\"}" https://plip.com/synshop
}

if [ ! "$current" = "$latest" ];then
        $(update)
        # $(announce)
        echo "New version found, upgraded from $current to $latest"
else
        echo "No new version found, staying on $current."
fi
```

