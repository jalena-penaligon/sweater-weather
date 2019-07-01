# Project: Sweater Weather

Welcome to Sweater Weather, a JSON API designed to expose endpoints to display weather for different cities, create and login users, and to create and display favorited cities.

## Intent

This project was completed in 7 days as a requirement for Module 3.

The project was built using Ruby on Rails which implements the following:

* Object oriented programming principles
* Database management with ActiveRecord
* External API calls to Google Geocoding and DarkSky

## Tech Stack

* Rails 5.2.3
* Ruby 2.4.1
* PostgreSQL

## Instructions
  ### How to setup:
      git clone git@github.com:jalena-penaligon/sweater-weather.git
      cd sweater-weather
      bundle
      rake db:{create,migrate,seed}
      rake forecast:generate
      rails s

  ### Available Endpoints:
   #### POST /api/v1/users
        **Headers:**
        Content-Type: application/json
        Accept: application/json

        **Body:**
        {
          "email": "my_email@example.com",
          "password": "password"
          "password_confirmation": "password"
        }

   #### POST /api/v1/sessions
       Headers:
        Content-Type: application/json
        Accept: application/json

       Body:
        {
          "email": "my_email@example.com",
          "password": "password"
        }

   #### GET /api/v1/forecast?location=denver,co
       Headers:
        Content-Type: application/json
        Accept: application/json
       
        
   #### GET /api/v1/backgrounds?location=denver,co
       Headers:
        Content-Type: application/json
        Accept: application/json


   #### POST /api/v1/favorites
        **Headers:**
        Content-Type: application/json
        Accept: application/json

        **Body:**
        {
          "location": "Denver, CO",
          "api_key": "jgn983hy48thw9begh98h4539h4"
        }
        * substitute a valid api_key after posting to /users

   #### GET /api/v1/favorites
        __Headers:__
        Content-Type: application/json
        Accept: application/json

        **Body:**
        {
          "api_key": "jgn983hy48thw9begh98h4539h4"
        }
        * substitute a valid api_key after posting to /users

   #### DELETE /api/v1/favorites
        **Headers:**
        Content-Type: application/json
        Accept: application/json

        **Body:**
        {
          "location": "Denver, CO",
          "api_key": "jgn983hy48thw9begh98h4539h4"
        }
        * substitute a valid api_key after posting to /users

  ### Running Tests:
    Run tests with rspec:
        $ rspec

  ## Core Contributors:
  Jalena Taylor: https://github.com/jalena-penaligon/

  ## How to Contribute:
  - Fork & clone this repository. Make the desired changes and open a pull request, tagging @jalena-penaligon
