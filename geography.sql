DROP TABLE IF EXISTS cities;
DROP TABLE IF EXISTS states;

CREATE TABLE cities (
  city_name VARCHAR(128) NOT NULL PRIMARY KEY,
  state_name VARCHAR(2),
  population INTEGER
);

CREATE TABLE states (
  state_name VARCHAR(2) PRIMARY KEY,
  country VARCHAR(64),
  population INTEGER
);

INSERT INTO states 
(state_name, country, population)
VALUES
  ('wa', 'usa', 1000),
  ('ca', 'usa', 1000),
  ('co', 'usa', 1000);

INSERT INTO cities 
(city_name, state_name, population)
VALUES 
  ('seattle', 'wa', 100),
  ('everett', 'wa', 100),
  ('san francisco', 'ca', 200),
  ('denver', 'co', 300);

SELECT cities.city_name AS city, states.state_name AS state 
FROM cities
JOIN states
ON cities.state_name = states.state_name


SELECT city_name 
FROM cities
WHERE state_name = 'wa'

