-- 1

\i ~/desktop/coding/launch/180/180.2/films.sql

-- 2

 ALTER TABLE films 
ALTER COLUMN title    SET NOT NULL,
ALTER COLUMN year     SET NOT NULL,
ALTER COLUMN genre    SET NOT NULL,
ALTER COLUMN director SET NOT NULL,
ALTER COLUMN duration SET NOT NULL;

-- 3

not null appears in the nullable column of the schema

-- 4

   ALTER TABLE films
ADD CONSTRAINT title_unique UNIQUE (title);

-- 5

Under the schema, in the Indexes section

-- 6

    ALTER TABLE films 
DROP CONSTRAINT title_unique;

-- 7

ALTER TABLE films 
  ADD CHECK (length(title) >= 1);

-- 8

new row for relation "films" violates check constraint "films_title_check"

INSERT INTO films (title, year, genre, director, duration) 
     VALUES ('', 1999, 'horror', 'Guillermo del Toro', 120);

-- 9

under the schema in the Check Constraints section

-- 10

    ALTER TABLE films 
DROP CONSTRAINT films_title_check;

-- 11

ALTER TABLE films
  ADD CHECK year BETWEEN 1900 AND 2100;

-- 12

under the schema in the Check Constraints section

-- 13

ALTER TABLE films
  ADD CHECK (length(director) >= 3 
        AND director LIKE '% %'); 

-- 14

under the schema in the Check Constraints section

-- 15

new row for relation "films" violates check constraint "films_director_check"

-- 16

Column Constraints, Table Constraints, Data Types

-- 17

no

CREATE TABLE failure (
  id integer DEFAULT 'Hello'
);

-- 18

\d table_name





