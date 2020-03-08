-- 1

SELECT 1 + NULL; => NULL

-- 2

 ALTER TABLE employees 
ALTER COLUMN department
         SET DEFAULT 'unassigned';

UPDATE employees
   SET department = 'unassigned'
 WHERE department IS NULL;

 ALTER TABLE employees
ALTER COLUMN department
         SET NOT NULL;

-- 3

CREATE TABLE temperatures (
  date date    NOT NULL,
  low  integer NOT NULL,
  high integer NOT NULL 
);

-- 4

INSERT INTO temperatures (date, low, high)
     VALUES ('2016-03-01', 34, 43),
            ('2016-03-02', 32, 44),
            ('2016-03-03', 31, 47),
            ('2016-03-04', 33, 42),
            ('2016-03-05', 39, 46),
            ('2016-03-06', 32, 43),
            ('2016-03-07', 29, 32),
            ('2016-03-08', 23, 31),
            ('2016-03-09', 17, 28);

-- 5

SELECT date, round((low + high)/2.0, 1) AS "average" 
  FROM temperatures 
 WHERE date BETWEEN '2016-03-02' AND '2016-03-08';

-- 6

ALTER TABLE temperatures
 ADD COLUMN rainfall integer DEFAULT 0 NOT NULL; 

-- 7 

UPDATE temperatures
   SET rainfall = (low + high)/2 - 35 
 WHERE (low + high)/2 > 35;

-- 8

 ALTER TABLE temperatures
ALTER COLUMN rainfall TYPE decimal(5, 3);

      UPDATE temperatures
         SET rainfall = rainfall/25.4;

-- 9

ALTER TABLE temperatures RENAME TO weather;

-- 10

\d weather

-- 11

$ pg_dump -d sql-course -t weather --inserts > dump.sql
