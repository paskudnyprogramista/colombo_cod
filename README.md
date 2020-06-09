# Colombo Cod App

## Database

To start your PostgreSQL database:

* Install docker (https://docs.docker.com/get-docker/)
* Install docker-compose (https://docs.docker.com/compose/install/)
* Run `docker-compose up`

To create database, run pending migrations and populate sample data:
* Run `mix ecto.setup`

## Server 

To start your Phoenix server:

* Install dependencies with `mix deps.get`
* Create and migrate your database with `mix ecto.setup`
* Start Phoenix endpoint with `mix phx.server`

Now you can visit [`localhost:4000`](http://localhost:4000) from your browser.

## Test

To run tests:

* Run `mix test`
