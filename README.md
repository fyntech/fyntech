# Fyntech.dk
[![Build Status](https://travis-ci.org/fyntech/fyntech.svg?branch=master)](https://travis-ci.org/fyntech/fyntech) [![Maintainability](https://api.codeclimate.com/v1/badges/8f371b40ab2fda789abf/maintainability)](https://codeclimate.com/github/fyntech/fyntech/maintainability)

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
organizer: "PROSA UNG"
category: "prosa"
---
Short event description
```

### Meetup.com deprecated
Unfortunately we can't no longer get events directly from meetup.com.
We are trying to find a solution to this.

## Building the project locally
Dependencies
* [Ruby](https://www.ruby-lang.org/en/)
* [Jekyll](https://jekyllrb.com/)
* [Meetup.com Api Key](www.meetup.com/meetup_api/key/) (can be omitted)(The key should be placed in plaintext in a file called "meetup_api_key" in the projects root directory)

## Setup
Install gems through Bundler  
`bundle install`

Build the site on the preview server  
`bundle exec jekyll serve`

_Windows does not include zoneinfo files, so bundle the tzinfo-data gem_  
`gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]`

## …or just use Docker-compose
1. Install Docker
2. open a terminal in this directory and run `docker-compose up`