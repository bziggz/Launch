 CREATE TABLE expenses (
  id          serial        PRIMARY KEY,
  created_on  date          NOT NULL,
  amount      decimal(6, 2) NOT NULL,
  memo        text          NOT NULL
  );