Sinatra Project Outline

First and Best idea - Game and Developer Content Management System

We'll require both game and developer objects and sql tables for our db.

Instead of admins or users, Developers could be the user class, and they can't edit other devs games.  

Game
belongs_to Developer
-^developer
-title
-genre
-price

Developer
has_many Games
-^games
-location
-employees (estimate)


REQUIREMENTS
-Build an MVC Sinatra Application.
-Use ActiveRecord with Sinatra.
-Use Multiple Models.
-Use at least one has_many relationship
-Must have user accounts. The user that created a given piece of content should be the only person who can modify that content
-Must have the abilty to create, read, update and destroy the resource that belongs to a user and only that user is able to edit it.
-You should also have validations for user input to ensure that bad data isn't added to the database. The fields in your signup form should be required and the user attribute that is used to login a user should be a unique value in the DB before creating the user.
