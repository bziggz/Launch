-- 1 import file orders_products1.sql

-- 2

ALTER TABLE orders 
  ADD CONSTRAINT orders_product_id_fkey 
      FOREIGN KEY (product_id) REFERENCES products(id);

-- 3

INSERT INTO products (name)
VALUES ('small bolt'),
       ('large bolt');

INSERT INTO orders (product_id, quantity)
VALUES (1, 10),
       (1, 25),
       (2, 15);

-- 4

SELECT orders.quantity AS quantity,
       products.name AS name
  FROM orders
       INNER JOIN products
       ON orders.product_id = products.id;

-- 5

yes:

INSERT INTO orders (quantity)
VALUES (15);

-- 6

ERROR:  column "product_id" contains null values

--7 

DELETE FROM orders
 WHERE product_id IS NULL;

ALTER TABLE orders 
ALTER COLUMN product_id 
  SET NOT NULL;

-- 8

CREATE TABLE reviews (
  id          serial  PRIMARY KEY,
  product_id  INT     REFERENCES products(id),
  review      text    NOT NULL 
);

-- 9

INSERT INTO reviews (product_id, review)
VALUES (1, 'a little small'),
       (1, 'very round!'),
       (2, 'could have been smaller');

-- 10

False, unless appropriately constriained, foreign key columns will 
accept NULL values.
