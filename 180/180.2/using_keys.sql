-- 1

CREATE SEQUENCE counter;

--2 

SELECT nextval(counter);

-- 3

DROP SEQUENCE counter;

-- 4

CREATE SEQUENCE even_counter 
   INCREMENT BY 2
     START WITH 2;

-- 5

regions_id_seq (table_column_seq)

-- 6

ALTER TABLE films
 ADD COLUMN id serial PRIMARY KEY;

-- 7

duplicate key value violates unique constraint "id_unique"

-- 8

 multiple primary keys for table "films" are not allowed

 -- 9

 ALTER TABLE films
 DROP CONSTRAINT films_pkey;