-- 1

CREATE TABLE people (
  name        varchar(25)   NOT NULL,
  age         integer,
  occupation  varchar(50),
);

-- 2

INSERT INTO people (name, age, occupation)
     VALUES ('Abby', 34, 'biologist'),
            ('Mu''nisah', 26, NULL),
            ('Mirabelle', 40, 'contractor');

-- 3

SELECT * FROM people WHERE age = 26;

SELECT * FROM people LIMIT 1 OFFSET 1;

SELECT * FROM people WHERE occupation IS NULL;

-- 4

CREATE TABLE birds (
  name      varchar(50)     NOT NULL,
  length    decimal(3, 1),
  wingspan  decimal(3, 1),
  family    varchar(50),
  extinct   boolean         DEFAULT false
);

-- 5

INSERT INTO birds (name, length, wingspan, family, extinct)
     VALUES ('Spotted Towhee', 21.6, 26.7, 'Emberizidae', DEFAULT),
            ('American Robin', 25.5, 36.0, 'Turdidae', DEFAULT),
            ('Greater Koa Finch', 19.0, 24.0, 'Fringillidae', true),
            ('Carolina Parakeet', 33.0, 55.8, 'Psittacidae', true),
            ('Common Kestrel', 35.5, 73.5, 'Falconidae', DEFAULT);

-- 6

  SELECT name, family 
    FROM birds
   WHERE extinct = false
ORDER BY length DESC;

-- 7

SELECT max(wingspan) AS "Max Wingspan",
       min(wingspan) AS "Min Wingspan",
       avg(wingspan) AS "Average Wingspan"
  FROM birds;

-- 8

CREATE TABLE menu_items (
  item            varchar(25)    NOT NULL,
  prep_time       integer,
  ingredient_cost decimal(3, 2),
  sales           integer,
  menu_price      decimal(3, 2)
  );

INSERT INTO menu_items (item, prep_time, ingredient_cost, sales, menu_price)
     VALUES ('omelette', 10, 1.50, 182, 7.99),
            ('tacos', 5, 2.00, 254, 8.99),
            ('oatmeal', 1, 0.50, 79, 5.99);

-- 9

  SELECT item, menu_price - ingredient_cost AS profit 
    FROM menu_items 
ORDER BY profit DESC 
   LIMIT 1;


-- 10

SELECT item, menu_price, ingredient_cost,
       round(prep_time/60.0 * 13.0, 2) AS labor,
       menu_price - ingredient_cost - round(prep_time/60.0 * 13.0, 2) AS profit
  FROM menu_items
ORDER BY profit DESC;




