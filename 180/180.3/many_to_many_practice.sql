-- 1

SELECT books.id,
       books.author,
       string_agg(categories.name, ', ') AS categories
  FROM books_categories
       INNER JOIN books
       ON books.id = books_categories.book_id

       INNER JOIN categories
       ON categories.id = books_categories.category_id
 GROUP BY books.id
 ORDER BY books.id;

-- 2

ALTER TABLE books
ALTER COLUMN author TYPE varchar(100),
ALTER COLUMN title  TYPE varchar(100);

INSERT INTO books (author, title)
VALUES ('Lynn Sherr', 'Sally Ride: America''s First Woman in Space'),
       ('Charlotte Brontë', 'Jane Eyre'),
       ('Meeru Dhalwala and Vikram Vij', 'Vij''s: Elegant and Inspired Indian Cuisine');

INSERT INTO categories (name)
VALUES ('Space Exploration'),
       ('Cookbook'),
       ('South Asia');

INSERT INTO books_categories (book_id, category_id)
VALUES (4, 5),
      (4, 1),
      (4, 7),
      (5, 2),
      (5, 4),
      (6, 8),
      (6, 1),
      (6, 9); 

-- 3

ALTER TABLE books_categories
  ADD UNIQUE (book_id, category_id);

-- 4

SELECT c.name, 
       count(b.id) AS book_count,
       string_agg(b.title, ', ') AS book_title
  FROM books_categories AS bc
       INNER JOIN categories AS c
       ON bc.category_id = c.id

       INNER JOIN books AS b
       ON bc.book_id = b.id
 GROUP BY c.name
 ORDER BY c.name;


















