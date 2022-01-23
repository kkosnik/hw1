-- In this assignment, you'll be building the domain model, database 
-- structure, and data for "KMDB" (the Kellogg Movie Database).
-- The end product will be a report that prints the movies and the 
-- top-billed cast for each movie in the database.

-- Requirements/assumptions
--
-- - There will only be three movies in the database – the three films
--   that make up Christopher Nolan's Batman trilogy
-- - Movie data includes the movie title, year released, MPAA rating,
--   and director
-- - A movie has a single director
-- - A person can be the director of and/or play a role in a movie
-- - Everything you need to do in this assignment is marked with TODO!

-- Rubric
-- 
-- There are three deliverables for this assignment, all delivered via
-- this file and submitted via GitHub and Canvas:
-- - A domain model, implemented via CREATE TABLE statements for each
--   model/table. Also, include DROP TABLE IF EXISTS statements for each
--   table, so that each run of this script starts with a blank database.
--   (10 points)
-- - Insertion of "Batman" sample data into tables (5 points)
-- - Selection of data, so that something similar to the following sample
--   "report" can be achieved (5 points)

-- Submission
-- 
-- - "Use this template" to create a brand-new "hw1" repository in your
--   personal GitHub account, e.g. https://github.com/<USERNAME>/hw1
-- - Do the assignment, committing and syncing often
-- - When done, commit and sync a final time, before submitting the GitHub
--   URL for the finished "hw1" repository as the "Website URL" for the 
--   Homework 1 assignment in Canvas

-- Successful sample output is as shown:

-- Movies
-- ======

-- Batman Begins          2005           PG-13  Christopher Nolan
-- The Dark Knight        2008           PG-13  Christopher Nolan
-- The Dark Knight Rises  2012           PG-13  Christopher Nolan

-- Top Cast
-- ========

-- Batman Begins          Christian Bale        Bruce Wayne
-- Batman Begins          Michael Caine         Alfred
-- Batman Begins          Liam Neeson           Ra's Al Ghul
-- Batman Begins          Katie Holmes          Rachel Dawes
-- Batman Begins          Gary Oldman           Commissioner Gordon
-- The Dark Knight        Christian Bale        Bruce Wayne
-- The Dark Knight        Heath Ledger          Joker
-- The Dark Knight        Aaron Eckhart         Harvey Dent
-- The Dark Knight        Michael Caine         Alfred
-- The Dark Knight        Maggie Gyllenhaal     Rachel Dawes
-- The Dark Knight Rises  Christian Bale        Bruce Wayne
-- The Dark Knight Rises  Gary Oldman           Commissioner Gordon
-- The Dark Knight Rises  Tom Hardy             Bane
-- The Dark Knight Rises  Joseph Gordon-Levitt  John Blake
-- The Dark Knight Rises  Anne Hathaway         Selina Kyle

-- Turns column mode on but headers off
.mode column
.headers off

-- Drop existing tables, so you'll start fresh each time this script is run.
-- TODO!

DROP TABLE IF EXISTS movies;
DROP TABLE IF EXISTS actors;
DROP TABLE IF EXISTS castings;

-- Create new tables, according to your domain model
-- TODO!

CREATE TABLE movies (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  movie_title TEXT,
  year_released TEXT,
  mpaa_rating TEXT,
  director TEXT
);

CREATE TABLE actors (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  actor TEXT,
  character TEXT
);

CREATE TABLE castings (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  movie_id INTEGER,
  actor_id INTEGER
);


--could also add another table with actor information and actor_ids if we had more information on them (e.g. how much they're paid, where they're from)

-- Insert data into your database that reflects the sample data shown above
-- Use hard-coded foreign key IDs when necessary
-- TODO!

--Movies Table
INSERT INTO movies (movie_title, year_released, mpaa_rating, director)
VALUES("Batman Begins","2005","PG-13","Christopher Nolan")
,("The Dark Knight","2008","PG-13","Christopher Nolan")
,("The Dark Knight Rises","2012","PG-13","Christopher Nolan");

--Actors Table
INSERT INTO actors (actor,character)
VALUES ("Christian Bale","Bruce Wayne")
,("Michael Caine","Alfred")
,("Liam Neeson","Ra's Al Ghul")
,("Katie Holmes","Rachel Dawes")
,("Gary Oldman","Commissioner Gordon")
,("Heath Ledger","Joker")
,("Aaron Eckhart","Harvey Dent")
,("Michael Caine","Alfred")
,("Maggie Gyllenhaal","Rachel Dawes")
,("Tom Hardy","Bane")
,("Joseph Gordon-Levitt","John Blake")
,("Anne Hathaway","Selina Kyle"); 

INSERT INTO castings (movie_id, actor_id)
VALUES (1,1)
,(1,2)
,(1,3)
,(1,4)
,(1,5)
,(2,1)
,(2,6)
,(2,7)
,(2,2)
,(2,9)
,(3,1)
,(3,5)
,(3,10)
,(3,11)
,(3,12);

-- Prints a header for the movies output
.print "Movies"
.print "======"
.print ""

-- The SQL statement for the movies output
-- TODO!

SELECT * FROM movies;

-- Prints a header for the cast output
.print ""
.print "Top Cast"
.print "========"
.print ""


-- The SQL statement for the cast output
-- TODO!

SELECT movies.movie_title, actors.actor, actors.character
FROM movies
JOIN castings
  ON movies.id=castings.movie_id
JOIN actors
  ON castings.actor_id=actors.id;