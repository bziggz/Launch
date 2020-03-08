-- 1 - import into psql

-- 2

SELECT count(id)
  FROM tickets;

-- 3

SELECT count(DISTINCT customer_id)
  FROM tickets;

-- 4

SELECT count(DISTINCT tickets.customer_id) 
       / count(DISTINCT customers.id)::float * 100
    AS percentage
  FROM customers
       LEFT OUTER JOIN tickets
       ON  tickets.customer_id = customers.id;

-- 5

SELECT events.name AS name, 
       count(tickets.id) AS popularity
  FROM events
       LEFT OUTER JOIN tickets
       ON events.id = tickets.event_id

 GROUP BY name
 ORDER BY popularity DESC;

-- 6

SELECT c.id AS id, 
       c.email AS email,
       count(DISTINCT t.event_id) AS count
  FROM customers AS c
       INNER JOIN tickets AS t
       ON c.id = t.customer_id
 GROUP BY c.id
HAVING count(DISTINCT t.event_id) = 3;

-- 7

SELECT e.name AS event,
       e.starts_at AS starts_at,
       sec.name AS section,
       s.row AS row, 
       s.number AS seat
  FROM tickets AS t
       INNER JOIN events AS e
       ON t.event_id = e.id

       INNER JOIN customers AS c
       ON t.customer_id = c.id

       INNER JOIN seats AS s
       ON t.seat_id = s.id

       INNER JOIN sections AS sec
       ON s.section_id = sec.id
 WHERE c.email = 'gennaro.rath@mcdermott.co';
