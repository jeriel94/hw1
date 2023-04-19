-- Requirements/assumptions
-- - There will only be three movies in the database – the three films
--   that make up Christopher Nolan's Batman trilogy.
-- - Movie data includes the movie title, year released, MPAA rating,
--   and studio. CHECK
-- - There are many studios, and each studio produces many movies, but
--   a movie belongs to a single studio.
-- - An actor can be in multiple movies.

-- User stories
-- - As a guest, I want to see a list of movies with the title, year released,
--   MPAA rating, and studio information. SET UP
-- - As a guest, I want to see the movies which a single studio has produced.
-- - As a guest, I want to see each movie's cast including each actor's
--   name and the name of the character they portray.
-- - As a guest, I want to see the movies which a single actor has acted in.

-- Deliverables
-- - A domain model, implemented via CREATE TABLE statements for each
--   model/table. Also, include DROP TABLE IF EXISTS statements for each
--   table, so that each run of this script starts with a blank database. CHECK

-- - Insertion of "Batman" sample data into tables.

-- - Selection of data, so that something similar to the sample "report"
--   below can be achieved.

-- Rubric
-- 1. Domain model - 6 points
-- - Think about how the domain model needs to reflect the
--   "real world" entities and the relationships with each other. 

-- 3. Insertion of data (INSERT statements) - 4 points
-- - Insert data into all the tables you've created

-- 4. "The report" (SELECT statements) - 6 points
-- - Write 2 `SELECT` statements to produce something similar to the
--   sample output below - 1 for movies and 1 for cast. You will need
--   to read data from multiple tables in each `SELECT` statement.
--   Formatting does not matter.

-- Successful sample output is as shown:

-- Movies
-- ======

-- Batman Begins          2005           PG-13  Warner Bros.
-- The Dark Knight        2008           PG-13  Warner Bros.
-- The Dark Knight Rises  2012           PG-13  Warner Bros.

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
DROP TABLE IF EXISTS studios;
DROP TABLE IF EXISTS roles;
DROP TABLE IF EXISTS actors;

-- Create new tables, according to your domain model
-- TODO!
CREATE TABLE movies (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  title TEXT,
  year INTEGER,
  rating TEXT,
  studio TEXT
);

CREATE TABLE studios (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    name TEXT
);

CREATE TABLE roles (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    character TEXT,
    movie_id INTEGER,
    actor_id INTEGER
);

CREATE TABLE actors (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    name TEXT
);

-- Insert data into your database that reflects the sample data shown above
-- Use hard-coded foreign key IDs when necessary
-- TODO!
INSERT INTO movies (
  title, 
  year, 
  rating, 
  studio
  ) 
  VALUES
  ("Batman Begins", 2005, "PG-13", "Warner Bros."),
  ("The Dark Knight", 2008, "PG-13', 'Warner Bros."),
  ("The Dark Knight Rises", 2012, "PG-13", "Warner Bros.");

INSERT INTO actors (
  name
  ) 
  VALUES
  ("Christian Bale"),
  ("Michael Caine"),
  ("Liam Neeson"),
  ("Katie Holmes"),
  ("Gary Oldman"),
  ("Heath Ledger"),
  ("Aaron Eckhart"),
  ("Maggie Gyllenhaal"),
  ("Tom Hardy"),
  ("Joseph Gordon-Levitt"),
  ("Anne Hathaway");

  INSERT INTO roles (
    movie_id, 
    actor_id, 
    character
    ) 
    VALUES
  (1, 1, "Bruce Wayne"),
  (1, 2, "Alfred"),
  (1, 3, "Ra's Al Ghul"),
  (1, 4, "Rachel Dawes"),
  (1, 5, "Commissioner Gordon"),
  (2, 1, "Bruce Wayne"),
  (2, 6, "Joker"),
  (2, 7, "Harvey Dent"),
  (2, 8, "Rachel Dawes"),
  (3, 1, "Bruce Wayne"),
  (3, 5, "Commissioner Gordon"),
  (3, 9, "Bane"),
  (3, 10, "John Blake"),
  (3, 11, "Selina Kyle");

-- Prints a header for the movies output
.print "Movies"
.print "======"
.print ""
-- The SQL statement for the movies output
-- TODO!
SELECT title, year, rating, studio
FROM movies;

-- Prints a header for the cast output
.print ""
.print "Top Cast"
.print "========"
.print ""
-- The SQL statement for the cast output
-- TODO!
SELECT title, year, rating, studio
FROM movies;