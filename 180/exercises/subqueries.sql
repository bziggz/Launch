-- 1 CREATE DATABASE

CREATE DATABASE auction;

CREATE TABLE bidders (
  id    serial  PRIMARY KEY,
  name  text    NOT NULL
);

CREATE TABLE items (
  id            serial        PRIMARY KEY,
  name          text          NOT NULL,
  initial_price numeric(6, 2) NOT NULL,
  sales_price   numeric(6, 2),
                CONSTRAINT valid_initial_price
                CHECK (initial_price BETWEEN 0.01 AND 1000.00),
                CONSTRAINT valid_sales_price
                CHECK (sales_price BETWEEN 0.01 AND 1000.00)
);

CREATE TABLE bids (
  id        serial        PRIMARY KEY,
  bidder_id integer       NOT NULL
            REFERENCES bidders(id)  ON DELETE CASCADE,
  item_id   integer       NOT NULL
            REFERENCES items(id)  ON DELETE CASCADE,
  amount    numeric(6, 2) NOT NULL,
            CONSTRAINT valid_bid_amount
            CHECK (amount BETWEEN 0.01 AND 1000.00)
);

CREATE INDEX bid__item_index ON bids (bidder_id, item_id);

\copy bidders FROM '~/desktop/coding/launch/180/exercises/bidders.csv' WITH HEADER CSV;
\copy items FROM '~/desktop/coding/launch/180/exercises/items.csv' WITH HEADER CSV;
\copy bids FROM '~/desktop/coding/launch/180/exercises/bids.csv' WITH HEADER CSV;

-- CONDITIONAL SUBQUERIES: IN

SELECT name AS "Bid on Items"
  FROM items 
 WHERE id IN 
       (SELECT DISTINCT item_id
          FROM bids);

-- CONDITIONAL SUBQUERIES: NOT IN

SELECT name AS "Items Not Bid On"
  FROM items 
 WHERE id NOT IN 
       (SELECT DISTINCT item_id
          FROM bids);

-- CONDITIONAL SUBQUERIES: EXISTS

SELECT name 
  FROM bidders
 WHERE EXISTS
       (SELECT 1 
          FROM bids
         WHERE bids.bidder_id = bidders.id);

  -- FE: SAME BUT WITH JOIN

  SELECT DISTINCT bidders.name
    FROM bidders
         RIGHT OUTER JOIN bids
         ON bids.bidder_id = bidders.id;

-- QUERY FROM A VIRTUAL TABLE

SELECT max(bid_count.count)
  FROM (SELECT count(bidder_id)
          FROM bids
         GROUP BY bidder_id) AS bid_count;

-- SCALAR SUBQUERIES

SELECT name, 
       (SELECT count(item_id) 
          FROM bids
         WHERE item_id = items.id)
  FROM items;

  -- FE: SAME BUT WITH JOIN

  SELECT items.name, count(bids.item_id)
    FROM items
         LEFT OUTER JOIN bids
         ON item_id = items.id
   GROUP BY items.name;

-- ROW COMPARISON

SELECT id 
  FROM items
 WHERE ROW(name, initial_price, sales_price) 
       = ROW('Painting', 100.00, 250.00); 

-- EXPLAIN

EXPLAIN SELECT name 
          FROM bidders
         WHERE EXISTS 
               (SELECT 1 
                  FROM bids 
                 WHERE bids.bidder_id = bidders.id);

                                QUERY PLAN                                
--------------------------------------------------------------------------
 Hash Join  (cost=33.38..66.47 rows=635 width=32)
   Hash Cond: (bidders.id = bids.bidder_id)
   ->  Seq Scan on bidders  (cost=0.00..22.70 rows=1270 width=36)
   ->  Hash  (cost=30.88..30.88 rows=200 width=4)
         ->  HashAggregate  (cost=28.88..30.88 rows=200 width=4)
               Group Key: bids.bidder_id
               ->  Seq Scan on bids  (cost=0.00..25.10 rows=1510 width=4)
(7 rows)

First, a table is created where bidders.id = bids.bidder_id
Second, eery name is passed through that table for evaluation
If it exists, the name is returned to the initial query

EXPLAIN ANALYZE SELECT name 
                  FROM bidders
                 WHERE EXISTS 
                       (SELECT 1 
                          FROM bids 
                         WHERE bids.bidder_id = bidders.id);

                                                     QUERY PLAN                                                      
---------------------------------------------------------------------------------------------------------------------
 Hash Join  (cost=33.38..66.47 rows=635 width=32) (actual time=0.091..0.097 rows=6 loops=1)
   Hash Cond: (bidders.id = bids.bidder_id)
   ->  Seq Scan on bidders  (cost=0.00..22.70 rows=1270 width=36) (actual time=0.011..0.013 rows=7 loops=1)
   ->  Hash  (cost=30.88..30.88 rows=200 width=4) (actual time=0.041..0.041 rows=6 loops=1)
         Buckets: 1024  Batches: 1  Memory Usage: 9kB
         ->  HashAggregate  (cost=28.88..30.88 rows=200 width=4) (actual time=0.033..0.036 rows=6 loops=1)
               Group Key: bids.bidder_id
               ->  Seq Scan on bids  (cost=0.00..25.10 rows=1510 width=4) (actual time=0.007..0.014 rows=26 loops=1)
 Planning Time: 0.209 ms
 Execution Time: 0.149 ms

 Same process as before, but this time the query was 
 executed to get the actual evaluation time

-- COMPARING SQL STATEMENTS

EXPLAIN ANALYZE SELECT MAX(bid_counts.count) 
                  FROM (SELECT COUNT(bidder_id) 
                          FROM bids 
                         GROUP BY bidder_id) AS bid_counts;

EXPLAIN ANALYZE SELECT COUNT(bidder_id) AS max_bid 
                  FROM bids
                 GROUP BY bidder_id
                 ORDER BY max_bid DESC
                 LIMIT 1;

                                                  QUERY PLAN                                                   
---------------------------------------------------------------------------------------------------------------
 Aggregate  (cost=37.15..37.16 rows=1 width=8) (actual time=0.042..0.043 rows=1 loops=1)
   ->  HashAggregate  (cost=32.65..34.65 rows=200 width=12) (actual time=0.036..0.038 rows=6 loops=1)
         Group Key: bids.bidder_id
         ->  Seq Scan on bids  (cost=0.00..25.10 rows=1510 width=4) (actual time=0.011..0.016 rows=26 loops=1)
 Planning Time: 0.103 ms
 Execution Time: 0.084 ms

                                                      QUERY PLAN                                                      
---------------------------------------------------------------------------------------------------------------------
 Limit  (cost=35.65..35.65 rows=1 width=12) (actual time=0.057..0.057 rows=1 loops=1)
   ->  Sort  (cost=35.65..36.15 rows=200 width=12) (actual time=0.055..0.055 rows=1 loops=1)
         Sort Key: (count(bidder_id)) DESC
         Sort Method: top-N heapsort  Memory: 25kB
         ->  HashAggregate  (cost=32.65..34.65 rows=200 width=12) (actual time=0.041..0.045 rows=6 loops=1)
               Group Key: bidder_id
               ->  Seq Scan on bids  (cost=0.00..25.10 rows=1510 width=4) (actual time=0.011..0.017 rows=26 loops=1)
 Planning Time: 0.151 ms
 Execution Time: 0.105 ms

 The second query involved a fair amount of sorting that had to be done, 
 that was not neccessary in the first query.

  -- FE:

  EXPLAIN ANALYZE SELECT name,
                         (SELECT COUNT(item_id) 
                            FROM bids 
                           WHERE item_id = items.id)
                    FROM items;

  EXPLAIN ANALYZE SELECT items.name, count(bids.item_id)
                    FROM items
                         LEFT OUTER JOIN bids
                         ON item_id = items.id
                   GROUP BY items.name;

                                       QUERY PLAN
 -----------------------------------------------------------------------------------------------------------                                 
 Seq Scan on items  (cost=0.00..25455.20 rows=880 width=40) (actual time=0.042..0.100 rows=6 loops=1)
   SubPlan 1
     ->  Aggregate  (cost=28.89..28.91 rows=1 width=8) (actual time=0.012..0.012 rows=1 loops=6)
           ->  Seq Scan on bids  (cost=0.00..28.88 rows=8 width=4) (actual time=0.005..0.008 rows=4 loops=6)
                 Filter: (item_id = items.id)
                 Rows Removed by Filter: 22
 Planning Time: 0.139 ms
 Execution Time: 0.144 ms

                                        QUERY PLAN                                                      
---------------------------------------------------------------------------------------------------------------------
 HashAggregate  (cost=66.44..68.44 rows=200 width=40) (actual time=0.111..0.114 rows=6 loops=1)
   Group Key: items.name
   ->  Hash Right Join  (cost=29.80..58.89 rows=1510 width=36) (actual time=0.049..0.085 rows=27 loops=1)
         Hash Cond: (bids.item_id = items.id)
         ->  Seq Scan on bids  (cost=0.00..25.10 rows=1510 width=4) (actual time=0.007..0.020 rows=26 loops=1)
         ->  Hash  (cost=18.80..18.80 rows=880 width=36) (actual time=0.033..0.033 rows=6 loops=1)
               Buckets: 1024  Batches: 1  Memory Usage: 9kB
               ->  Seq Scan on items  (cost=0.00..18.80 rows=880 width=36) (actual time=0.022..0.025 rows=6 loops=1)
 Planning Time: 0.286 ms
 Execution Time: 0.184 ms

