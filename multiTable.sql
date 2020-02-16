CREATE EXTENSION IF NOT EXISTS "uuid-ossp";
DROP TABLE IF EXISTS shelter;
DROP TABLE IF EXISTS adopters;
DROP TABLE IF EXISTS dogs;

CREATE TABLE dogs (
  dog_id UUID PRIMARY KEY DEFAULT uuid_generate_v1(),
  dog_name VARCHAR(100) NOT NULL,
  sex VARCHAR(6),
  age VARCHAR(10)
);

CREATE TABLE adopters (
  adopter_id UUID PRIMARY KEY DEFAULT uuid_generate_v1(),
  adopter_name VARCHAR(100) NOT NULL,
  sex_wanted VARCHAR(6),
  age_wanted VARCHAR(10)
);

CREATE TABLE shelter (
  shelter_id UUID PRIMARY KEY DEFAULT uuid_generate_v1(),
  dog_id UUID REFERENCES dogs(dog_id),
  adopter_id UUID REFERENCES adopters(adopter_id)
);

INSERT INTO dogs
  (dog_name, sex, age)
VALUES
  ('chief', 'male', 'adult'),
  ('darrington', 'male', 'young'),
  ('merlin', 'male', 'senior'),
  ('gracy', 'female', 'young');

INSERT INTO adopters
  (adopter_name, sex_wanted, age_wanted)
VALUES
  ('jen', 'female', 'young'),
  ('mark', 'male', 'senior'),
  ('pat', 'male', 'young'),
  ('helen', 'male', 'adult');

INSERT INTO shelter 
  (dog_id, adopter_id)
VALUES (
  (SELECT dog_id FROM dogs WHERE dog_name = 'chief'),
  (SELECT adopter_id FROM adopters WHERE adopter_name = 'helen')
);

INSERT INTO shelter
  (dog_id, adopter_id)
VALUES (
  (SELECT dog_id FROM dogs WHERE dog_name = 'gracy'),
  (SELECT adopter_id FROM adopters WHERE adopter_name = 'jen')
);

INSERT INTO shelter 
  (dog_id, adopter_id)
VALUES (
  (SELECT dog_id FROM dogs WHERE dog_name = 'darrington'),
  (SELECT adopter_id FROM adopters WHERE adopter_name = 'pat')
);

INSERT INTO shelter 
  (dog_id, adopter_id)
VALUES (
  (SELECT dog_id FROM dogs WHERE dog_name = 'merlin'),
  (SELECT adopter_id FROM adopters WHERE adopter_name = 'mark')
);

SELECT dog_name, adopter_name 
FROM  dogs
JOIN shelter
ON dogs.dog_id = shelter.dog_id
JOIN adopters
ON adopters.adopter_id = shelter.adopter_id
