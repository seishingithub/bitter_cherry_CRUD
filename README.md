#README

Welcome to the most amazing repo of all time.

# What is happening with the Build?

[![Build Status](https://travis-ci.org/seishingithub/bitter_cherry_CRUD.svg?branch=master)](https://travis-ci.org/seishingithub/bitter_cherry_CRUD)

# URLS of SIGNIFICANCE

* pivotal tracker [https://www.pivotaltracker.com/n/projects/1069196](https://www.pivotaltracker.com/n/projects/1069196)
* github [https://github.com/seishingithub/bitter_cherry_CRUD](https://github.com/seishingithub/bitter_cherry_CRUD)
* staging [http://bitter-cherry.herokuapp.com/](http://bitter-cherry.herokuapp.com/)
* production []()

# Humans involved in this wonder

* Peggy - anchor
* Emily
* Cory
* Zach
* Lori
* Gerard

# Get this App up and running on a local machine

To create your local databases and run table migrations:

1. fork and clone this repository
1. `bundle install`
1. get databases up and running
  1. `rake db:create db:migrate`
  1. `RACK_ENV=test rake db:create`
  1. `RACK_ENV=test rake db:migrate`
1. `rails server`
1. go to `http://localhost:3000/` and have fun!

