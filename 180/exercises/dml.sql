-- CREATE THE DATABASE

CREATE DATABASE workshop;
\c workshop

CREATE TABLE devices (
  id          serial      PRIMARY KEY,
  name        text        NOT NULL,
  created_at  timestamp   DEFAULT now()
);

CREATE TABLE parts (
  id          serial    PRIMARY KEY,
  part_number text      UNIQUE NOT NULL,
  device_id   integer   REFERENCES devices(id)
);

-- INSERT DATA FOR PARTS AND DEVICES

INSERT INTO devices (name)
VALUES ('Accelerometer'),
       ('Gyroscope');

INSERT INTO parts (part_number, device_id)
VALUES ('1001', 1),
       ('1002', 1),
       ('1003', 1),
       ('2001', 2),
       ('2002', 2),
       ('2003', 2),
       ('2004', 2),
       ('2005', 2),
       ('3001', NULL),
       ('3002', NULL),
       ('3003', NULL);

-- INNER JOIN

SELECT devices.name,
       parts.part_number
  FROM devices
       INNER JOIN parts
       ON parts.device_id = devices.id;

-- SELECT part_number

SELECT * 
  FROM parts
 WHERE part_number LIKE '3%';

-- AGGREGATE FUNCTIONS

SELECT devices.name, 
       count(parts.id)
  FROM devices
       LEFT JOIN parts
       ON devices.id = parts.device_id
 GROUP BY devices.name;

-- ORDER BY

SELECT devices.name, 
       count(parts.id)
  FROM devices
       LEFT JOIN parts
       ON devices.id = parts.device_id
 GROUP BY devices.name
 ORDER BY count DESC;

 -- IS NULL and IS NOT NULL

SELECT part_number, device_id
  FROM parts
 WHERE device_id IS NULL;

SELECT part_number, device_id
  FROM parts
 WHERE device_id IS NOT NULL;

-- OLDEST DEVICE

INSERT INTO devices (name) 
VALUES ('Magnetometer');

INSERT INTO parts (part_number, device_id) 
VALUES (4001, 3);

SELECT name 
  FROM devices
 ORDER BY created_at
 LIMIT 1;

 -- UPDATE device_id

 UPDATE parts
    SET device_id = 1
  WHERE part_number IN ('2005', '2004');  

  -- FE: UPDATE SMALLEST PART NUMBER

  UPDATE parts
     SET device_id = 2
   WHERE part_number = (SELECT min(part_number)
                          FROM parts);

-- DELETE ACCELEROMETER

DELETE FROM parts
 WHERE device_id = 1;

DELETE FROM devices
 WHERE name = 'Accelerometer';

 -- FE: CHANGE TABLES AND DELETE IN ONE STATEMENT

  CREATE TABLE parts (
    id          serial  PRIMARY KEY,
    part_number integer NOT NULL UNIQUE,
    device_id   integer REFERENCES devices ON DELETE CASCADE
  );

  DELETE FROM devices 
   WHERE name = 'Accelerometer';