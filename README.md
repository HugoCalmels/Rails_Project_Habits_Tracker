# Habits Tracker 

## Summary

I started this project back in december 2021, I wanted to build a good & fast back-end application.
At that time, I didn't knew much about CSS & JS. It also was a great oppurtiny to train those skills.
There is no animations, the back-end is not perfect, but it is working and thats what matter the most.

## Libraries
* Devise, connected to Gmail API for email validation.

### Features

* A user can create/read/update/destroy an habit.
* Habit must have a type good/bad.
* Habit must have a cycle daily/weekly/monthly.
* Each habit has checkpoints (one checkpoint belongs to one habit).
* Those checkpoints are reset daily if the habit is associated to daily cycle.
* Each habit has a calendar.
* Each cycle, checkpoints will be converted to stats, those stats will be put into the calendar that belongs to the habit.
* There is a sleep/day mode if we want to stop the process, for exemple during hollydays.
* There is alerts popping for UX experience all along.
* There is one admin, with a table for each user and his number of checkpoints ( there is not any checkpoint limit atm). The admin can destroy any user from the db.

## To install locally :
- bundle install
- bundle exec rails webpacker:install
- rails db:create db:migrate db:seed && rails s

## Available online at :
https://habits-tracker-plus.herokuapp.com/

