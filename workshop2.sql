CREATE EXTENSION IF NOT EXISTS "uuid-ossp";
DROP TABLE IF EXISTS roles;
DROP TABLE IF EXISTS users;
DROP TABLE IF EXISTS departments;

CREATE TABLE users (
  user_id UUID PRIMARY KEY DEFAULT uuid_generate_v1(),
  user_name VARCHAR(100)
);

CREATE TABLE departments (
  dept_id UUID PRIMARY KEY DEFAULT uuid_generate_v1(),
  dept_name VARCHAR(100)
);

CREATE TABLE roles (
  id UUID PRIMARY KEY DEFAULT uuid_generate_v1(),
  user_id UUID REFERENCES users(user_id),
  dept_id UUID REFERENCES departments(dept_id)
);

INSERT INTO departments 
  (dept_name)
VALUES
  ('engineering'),
  ('humanresources'),
  ('finance');

INSERT INTO users
  (user_name)
VALUES
  ('chief'),
  ('darrington'),
  ('rigel'),
  ('merlin');

INSERT INTO roles
  (user_id, dept_id)
VALUES(
  (SELECT user_id FROM users WHERE user_name = 'chief'),
  (SELECT dept_id FROM departments WHERE dept_name = 'engineering')
);

INSERT INTO roles
  (user_id, dept_id)
VALUES (
  (SELECT user_id FROM users WHERE user_name = 'chief'),
  (SELECT dept_id FROM departments WHERE dept_name = 'humanresources')
);

INSERT INTO roles
  (user_id, dept_id)
VALUES(
  (SELECT user_id FROM users WHERE user_name = 'darrington'),
  (SELECT dept_id FROM departments WHERE dept_name = 'engineering')
);

INSERT INTO roles
  (user_id, dept_id)
VALUES(
  (SELECT user_id FROM users WHERE user_name = 'rigel'),
  (SELECT dept_id FROM departments WHERE dept_name = 'finance')
);

INSERT INTO roles
  (user_id, dept_id)
VALUES(
  (SELECT user_id FROM users WHERE user_name = 'merlin'),
  (SELECT dept_id FROM departments WHERE dept_name = 'humanresources')
);


SELECT users.user_name, departments.dept_name 
FROM users
JOIN roles
ON users.user_id = roles.user_id
JOIN departments
ON departments.dept_id = roles.dept_id

