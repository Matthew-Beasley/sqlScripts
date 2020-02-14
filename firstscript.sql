	
CREATE EXTENSION IF NOT EXISTS "uuid-ossp";
DROP TABLE IF EXISTS breeds;
DROP TABLE IF EXISTS dogs;

CREATE TABLE breeds(
  breed VARCHAR(256) NOT NULL,
  color VARCHAR(256),
  size VARCHAR(256),
  CHECK( size IN ('small', 'medium', 'large', 'very large'))
  );

CREATE TABLE dogs(
  id uuid DEFAULT uuid_generate_v4 () PRIMARY KEY, 
  name VARCHAR(256) NOT NULL, 
  breed VARCHAR(256) NOT NULL, 
  bio VARCHAR,
  shelter VARCHAR, 
  homed BOOLEAN DEFAULT false, 
  intake_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP
  );

INSERT INTO dogs 
( name, breed, bio, shelter ) 
VALUES ('chief', 'hound', 'a lovely boy from coleville', 'everett'),
        ('darrington', 'hound', 'a very sad story', 'everett'),
        ('merlin', 'husky', 'the black marouder', 'seattle'),
        ('rigel', 'husky', 'the smartest of them all', 'everett'),
        ('koyuk', 'malamute', 'a little chubby but very happy', 'seattle');

INSERT INTO breeds
( breed, color, size )
VALUES ('husky', 'black and white', 'medium'),
        ('hound', 'black and tan', 'large'),
        ('malamute', 'gray and white', 'very large');

SELECT dogs.name AS dog, breeds.breed AS breed
FROM dogs
JOIN breeds
ON dogs.breed = breeds.breed

