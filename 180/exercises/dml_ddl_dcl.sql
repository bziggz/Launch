-- 1 define DDL and DML

DDL - Data Definition Language (CREATE ALTER) - create/modify/delete tables
DML - Data Manipulation Language (SELECT INSERT) - CRUD data

-- 2 

SELECT column_name FROM my_table; -- is Data Manipulation Language

-- 3

CREATE TABLE things (
  id serial PRIMARY KEY,
  item text NOT NULL UNIQUE,
  material text NOT NULL
); -- is Data Definition Language

-- 4

ALTER TABLE things
DROP CONSTRAINT things_item_key; -- DDL

-- 5

INSERT INTO things VALUES (3, 'Scissors', 'Metal'); -- DML

-- 6

UPDATE things
SET material = 'plastic'
WHERE item = 'Cup'; -- DML

-- 7

\d things -- none, it's a meta-command

-- 8

DELETE FROM things WHERE item = 'Cup'; -- DML

-- 9

DROP DATABASE xyzzy; -- DDL

-- 10

CREATE SEQUENCE part_number_sequence; -- DDL