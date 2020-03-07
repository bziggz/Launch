# 1

$createdb animals

# 2

CREATE TABLE birds (
  id serial PRIMARY KEY,
  name varchar(25),
  age integer,
  species varchar(15)
);

# 3

INSERT INTO birds (name, age, species) VALUES
('Charlie', 3, 'Finch'),
('Allie', 5, 'Owl'),
('Jennifer', 3, 'Magpie'),
('Jamie', 4, 'Owl'),
('Roy', 8, 'Crow');

# 4

SELECT * FROM birds;

# 5

SELECT * FROM birds WHERE age < 5;

# 6

UPDATE birds SET species = 'Raven' WHERE species = 'Crow';







