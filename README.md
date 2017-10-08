# fyntech.github.io
[![Build Status](https://travis-ci.org/fyntech/fyntech.svg?branch=master)](https://travis-ci.org/fyntech/fyntech)
This is the GitHub pages site for http://fyntech.dk which we aim to update frequently, with new and exciting tech events. A number of events from meetup.com groups are being automatically imported every day. If you want to add your meetup group, please get in touch with one of the maintainers.
This is a collaboration between members of [PROSA](http://prosa.dk) and the tech enthusiasts on Fyn, Denmark.  

## Adding an Event
To generate a new event, create a new file in the _events directory. 
Name the event file with the date and then the event name, format: y-m-d-title.md

Be sure to at least add a title, a date, and an organizer.
Events will be colored according to which category you choose, currently available categories:
codeodense, code-u-odense, eal, flug, ida, prosa, vuc & eal-prosa

Here's a sample event file, with all available fields:
```yaml
---
title: "Event title"
dateStart: 2017-01-01 00:00:00 Europe/Copenhagen
dateEnd: 2017-01-01 00:00:00 Europe/Copenhagen
location: "Location name <br> Adress"
link: "http://example.com/signup"
organizer: "PROSA U35"
category: "prosa"
---
Short event description
```

## Building the project locally
Dependencies
* [Ruby](https://www.ruby-lang.org/en/)
* [Jekyll](https://jekyllrb.com/)
* [Meetup.com Api Key](www.meetup.com/meetup_api/key/) (The key should be placed in plaintext in a file called "meetup_api_key" in the projects root directory)

If the dependencies are met, it should be as easy as opening a terminal in the root folder and running `bundle exec jekyll serve`