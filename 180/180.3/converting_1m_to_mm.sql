-- 1 import films7.sql

-- 2

CREATE TABLE directors_films (
  id          serial    PRIMARY KEY,
  director_id integer   REFERENCES directors(id),
  film_id     integer   REFERENCES films(id)
);

-- 3

INSERT INTO directors_films (director_id, film_id)
VALUES (1, 1),
       (2, 2),
       (3, 3),
       (4, 4),
       (5, 5),
       (6, 6),
       (3, 7),
       (7, 8),
       (8, 9),
       (4, 10);

-- 4

ALTER TABLE films 
 DROP COLUMN director_id;

-- 5

SELECT films.title AS title, 
       directors.name 
  FROM directors_films
       INNER JOIN films
       ON directors_films.film_id = films.id

       INNER JOIN directors
       ON directors_films.director_id = directors.id
 ORDER BY title ASC;

 -- 6

 INSERT INTO directors (name)
 VALUES ('Joel Coen'),
        ('Ethan Coen'),
        ('Frank Miller'),
        ('Robert Rodriguez');

INSERT INTO films (title, year, genre, duration)
VALUES ('Fargo', 1996, 'comedy', 98),
       ('No Country For Old Men', 2007, 'western', 122),
       ('Sin City', 2005, 'crime', 124),
       ('Spy Kids', 2001, 'scifi', 88);

INSERT INTO directors_films (director_id, film_id)
VALUES (9, 11),
       (9, 12),
       (10, 12),
       (11, 13),
       (12, 13),
       (12, 14);

-- 7

SELECT directors.name, 
       count(df.director_id) AS number_of_films
  FROM directors_films AS df
       INNER JOIN directors
       ON df.director_id = directors.id

 GROUP BY directors.name
 ORDER BY number_of_films DESC, 
          directors.name  ASC; 