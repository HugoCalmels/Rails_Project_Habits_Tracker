# Habits Tracker 

## summary

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

### Issues
* Stats are not displayed since last 4 days, can't see what'ive changed to break it.



##  to install locally :
- bundle install
- bundle exec rails webpacker:install
- rails db:create db:migrate db:seed && rails s

##  available online at :
https://habits-tracker-plus.herokuapp.com/

