# Drupal Admin Info

## Hours/Address in header

If you need to change the address or hours in the header,  go to the 
[Site Info page](https://synshop.org/admin/config/system/site-information) and change the 
"slogan" to the text you want.  Normally it says:

```
1075 American Pacific, Suite C, Henderson, NV 89074
Monday - Friday 6pm - 10pm | Saturday 3pm - 10pm
```

## Traffic light in header

See [stand alone page](https://rtfm.synshop.org/admins/Traffic-Light/)


## Homepage

If you need to change the home page to point to a new page for any reason,  go to the 
[Site Info page](https://synshop.org/admin/config/system/site-information) and change the 
"Default Home Page" to a new or existing page.  


## Homepage Meetup Events

Currently the homepage uses a page that has not-Drupal normal PHP inline on the page.  It uses
[MeetupEvents](https://github.com/Ths2-9Y-LqJt6/MeetupScraper) to show cached
Meetup Events.  

A cron job is run by root every minute to ensure users don't fire the caching:

```
# every minute hit the home page so the cache for this is fresh and users aren't refreshing them
* *     *   *  *        /usr/bin/curl --silent -o /dev/null https://synshop.org/Past-Events
* *     *   *  *        /usr/bin/curl --silent -o /dev/null https://synshop.org/
```

And the page's PHP/CSS/HTML looks like this:

```
<style>
    #address-text a {background-color:red; color:white; text-decoration: none;
font-size: 25px;}
    #breadcrumb {
        display: none;
    }
    /* DANGER!! This CSS assumes the first node-article will be the wrapper "future events" and should be hidden.
    It might hide a real event if you're not careful! */
    /* Thanks  https://stackoverflow.com/a/8539107 */
    .node-header, .comment_forbidden {
        display: none;
    }
    .meetup-date  {
        display: block !important;
    }
</style>
<div class="node-header clearfix">

    <div class="date">
        <span class="day">23</span>
        <span class="month">Jan</span>
        <span class="year">2020</span>
    </div>

    <div class="title-and-meta">
        <h1 class="node-title"><a href="/2020-01-23/future-events">future events</a></h1>
        <span property="dc:title" content="future events" class="rdf-meta element-hidden"></span><span property="sioc:num_replies" content="0" datatype="xsd:integer" class="rdf-meta element-hidden"></span>
        <div class="meta">
                      <span class="submitted">
              By <span rel="sioc:has_creator"><a href="/user/admin" title="View user profile." class="username" xml:lang="" about="/user/admin" typeof="sioc:UserAccount" property="foaf:name" datatype="">Administrator</a></span>            </span>
        </div>
    </div> <!-- /.title-and-menta -->

</div>
<?php

// HACKY SOLUTION! - be sure to update past events which uses identical code except get_past_meetup_events() instead

$path = '/srv/http/synshop';
set_include_path(get_include_path() . PATH_SEPARATOR . $path);

require_once('MeetupEvents.php');
$meetup = new MeetupEvents();

$eventHtml = '
<div class="node meetup-event node-feed-item node-promoted node-teaser clearfix" typeof="sioc:Item foaf:Document">
    <div class="node-header meetup-date clearfix">
        <div class="date">
            <span class="day">%s<!--day--></span>
            <span class="month">%s<!--month--></span>
            <span class="year">%s<!--year--></span>
        </div>

        <div class="title-and-meta">
            <h2 class="node-title"><a href="%s"><!--link-->%s<!--title--></a></h2>
            <div class="meta">
                <span class="submitted">
                    By <span rel="sioc:has_creator"><a href="https://github.com/Ths2-9Y-LqJt6/MeetupScraper"
                         title="View github project." class="username"
                         xml:lang=""
                         property="foaf:name" datatype="">MeetupScraper</a></span>
                </span>
            </div>
        </div> <!-- /.title-and-menta -->

    </div> <!-- /.node-header -->

    <div class="content">
        <div class="field field-name-field-feed-item-description field-type-text-with-summary field-label-hidden">
            <div class="field-items">
                <div class="field-item even"><h4>%s<!--long date--></h4>
                    <p></p>
                    <p>%s<!--description--></p>
                </div>
            </div>
        </div>
    </div>
</div>
 ';


$events = $meetup->get_future_meetup_events('synshop');
$count = 1;
$eventsHtml = '';
foreach ( $events as $event){
    $epoch = substr($event['epoch'], 0, -3);
    $month = date('M',$epoch);
    $day = date('d',$epoch);
    $year = date('Y',$epoch);
    $description = nl2br($event['description']);
    $eventsHtml .= sprintf($eventHtml, $day, $month, $year, $event['link'], $event['title'], $event['human_date'], $description);
    $count++;
    if ($count > 6) break;
}


print $eventsHtml;


?>
<p><a href="https://www.meetup.com/synshop/events">See More Upcoming Events</a></p>
```
