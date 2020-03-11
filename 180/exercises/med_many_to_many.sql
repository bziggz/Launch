-- SET UP DATABASE

CREATE DATABASE billing;
\c billing

CREATE TABLE customers (
  id            serial  PRIMARY KEY,
  name          text    NOT NULL,
  payment_token char(8) NOT NULL UNIQUE,
                CONSTRAINT valid_payment_token_format
                CHECK (payment_token ~ '^[A-Z]{8}$')
);

CREATE TABLE services (
  id          serial         PRIMARY KEY,
  description text           NOT NULL,
  price       numeric(10, 2) NOT NULL,
              CONSTRAINT non_negative_price
              CHECK (price >= 0.00) 
);

INSERT INTO customers (name, payment_token)
VALUES ('Pat Johnson', 'XHGOAHEQ'),
       ('Nancy Monreal', 'JKWQPJKL'),
       ('Lynn Blake', 'KLZXWEEE'),
       ('Chen Ke-Hua', 'KWETYCVX'),
       ('Scott Lakso', 'UUEAPQPS'),
       ('Jim Pornot', 'XKJEYAZA');

INSERT INTO services (description, price)
VALUES ('Unix Hosting', 5.95),
       ('DNS', 4.95),
       ('Whois Registration', 1.95),
       ('High Bandwidth', 15.00),
       ('Business Support', 250.00),
       ('Dedicated Hosting', 50.00),
       ('Bulk Email', 250.00),
       ('One-to-one Training', 999.00);

CREATE TABLE customers_services (
  id          serial   PRIMARY KEY,
  customer_id integer  REFERENCES customers(id) ON DELETE CASCADE NOT NULL,
  service_id  integer  REFERENCES services(id) NOT NULL,
              UNIQUE(customer_id, service_id)
);

INSERT INTO customers_services (customer_id, service_id)
VALUES (1, 1),
       (1, 2),
       (1, 3),
       (3, 1),
       (3, 2),
       (3, 3),
       (3, 4),
       (3, 5),
       (4, 1),
       (4, 4),
       (5, 1),
       (5, 2),
       (5, 6),
       (6, 1),
       (6, 6),
       (6, 7);

-- GET CUSTOMERS WITH SERVICES

SELECT DISTINCT c.name, c.payment_token
  FROM customers AS c
       INNER JOIN customers_services AS cs 
       ON c.id = cs.customer_id;

-- GET CUSTOMERS WITH NO SERVICES

SELECT DISTINCT customers.*
  FROM customers
 WHERE customers.id NOT IN 
       (SELECT customers_services.customer_id FROM customers_services);

  -- FE: CUST W/O SERVICES AND SERVICES W/O CUST

  SELECT customers.*, services.*
    FROM customers_services AS cs
         FULL OUTER JOIN customers
         ON cs.customer_id = customers.id

         FULL OUTER JOIN services
         ON cs.service_id = services.id
   WHERE service_id IS NULL 
      OR customer_id IS NULL;

-- GET SERVICES WITH NO CUSTOMERS

SELECT services.description
  FROM customers_services AS cs
       RIGHT OUTER JOIN services
       ON cs.service_id = services.id
 WHERE service_id IS NULL;

-- SERVICES FOR EACH CUSTOMER

SELECT customers.name, 
       string_agg(services.description, ', ') AS services
  FROM customers_services AS cs
       RIGHT OUTER JOIN customers
       ON cs.customer_id = customers.id

       LEFT OUTER JOIN services
       ON cs.service_id = services.id
 GROUP BY customers.id;

 -- FE: SAME OUTPUT BUT \n SEPARATED

 SELECT CASE lag(customers.name)
                OVER (ORDER BY customers.name)
             WHEN customers.name THEN NULL
             ELSE customers.name 
        END AS name,
        services.description
   FROM customers
        LEFT OUTER JOIN customers_services
        ON customer_id = customers.id

        LEFT OUTER JOIN services
        ON services.id = service_id;

-- SERVICES WTIH THREE CUSTOMERS

SELECT description,
       count(service_id)
  FROM services
       INNER JOIN customers_services AS cs 
       ON cs.service_id = services.id
 GROUP BY description
HAVING count(cs.customer_id) >= 3
 ORDER BY description;

-- TOTAL GROSS INCOME

SELECT sum(services.price) AS gross 
  FROM services
       INNER JOIN customers_services
       ON customers_services.service_id = services.id;

-- ADD NEW CUSTOMER

INSERT INTO customers (name, payment_token)
VALUES ('John Doe', 'EYODHLCN');

INSERT INTO customers_services (customer_id, service_id)
VALUES (7, 1), 
       (7, 2), 
       (7, 3); 

-- HYPOTHETICALLY

SELECT sum(services.price) 
  FROM services
       INNER JOIN customers_services
       ON customers_services.service_id = services.id
 WHERE services.price > 100.00;

SELECT sum(services.price) 
  FROM services
       CROSS JOIN customers
 WHERE services.price > 100.00;

-- DELETING ROWS

DELETE FROM customers
 WHERE name = 'Chen Ke-Hua';

DELETE FROM customers_services 
 WHERE service_id = 7;

DELETE FROM services
 WHERE description = 'Bulk Email';









