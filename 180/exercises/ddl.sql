-- CREATE AN EXTRASOLAR PLANETARY DATABASE

CREATE DATABASE extrasolar;

CREATE TABLE stars (
  id            serial        PRIMARY KEY,
  name          varchar(25)   UNIQUE NOT NULL,
  distance      integer       NOT NULL,
  spectral_type char(1),
  companions    integer       NOT NULL,
                CONSTRAINT positive_distance
                CHECK(distance > 0),
                CONSTRAINT non_negative_companions
                CHECK(companions >= 0)
);

CREATE TABLE planets (
  id          serial    PRIMARY KEY,
  designation char(1)   UNIQUE,
  mass        integer 
);

-- RELATING STARS AND PLANETS

ALTER TABLE planets
  ADD COLUMN star_id integer NOT NULL REFERENCES stars(id);

-- INCREASE STAR NAME LENGTH

ALTER TABLE stars 
ALTER COLUMN name TYPE varchar(50);

-- STELLAR DISTANCE PRECISION

ALTER TABLE stars
ALTER COLUMN distance TYPE numeric;

-- CHECK VALUES IN LIST

ALTER TABLE stars
  ADD CONSTRAINT correct_spectral_type
      CHECK (spectral_type IN ('O', 'B', 'A', 'F', 'G', 'K', 'M')),
ALTER COLUMN spectral_type SET NOT NULL;

-- ENUMERATED TYPES

ALTER TABLE stars
 DROP CONSTRAINT correct_spectral_type;

CREATE TYPE valid_spectral_type 
       AS ENUM ('O', 'B', 'A', 'F', 'G', 'K', 'M');

ALTER TABLE stars
ALTER COLUMN spectral_type TYPE valid_spectral_type
                           USING spectral_type::valid_spectral_type;

-- PLANETARY MASS PRECISION

ALTER TABLE planets
ALTER COLUMN designation SET NOT NULL,
ALTER COLUMN mass TYPE numeric,
ALTER COLUMN mass SET NOT NULL,
  ADD CONSTRAINT positive_mass 
      CHECK (mass > 0);

-- ADD A SEMI-MAJOR AXIS COLUMN

ALTER TABLE planets
  ADD COLUMN semi_major_axis numeric NOT NULL;

-- ADD A MOONS TABLE

CREATE TABLE moons (
  id              serial    PRIMARY KEY,
  planet_id       integer   NOT NULL REFERENCES planets(id),
  designation     integer   NOT NULL,
  semi_major_axis numeric,
  mass            numeric,
                  CONSTRAINT positive_s_m_axis 
                  CHECK (semi_major_axis > 0),
                  CONSTRAINT positive_mass
                  CHECK (mass > 0)
);

-- DELETE THE DATABASE

\c base_db
DROP DATABASE extrasolar;
