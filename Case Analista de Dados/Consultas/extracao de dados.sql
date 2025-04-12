CREATE EXTENSION IF NOT EXISTS dblink;


CREATE TABLE actor AS
SELECT * FROM dblink(
  'dbname=dbinterview user=postgres password=postgres',
  'SELECT actor_id, first_name, last_name, last_update FROM actor'
) AS actor(
  actor_id INTEGER,
  first_name VARCHAR,
  last_name VARCHAR,
  last_update TIMESTAMP
);

CREATE TABLE address AS
SELECT * FROM dblink(
  'dbname=dbinterview user=postgres password=postgres',
  'SELECT address_id, address, address2, district, city_id, postal_code, phone, last_update FROM address'
) AS address(
  address_id INTEGER,
  address VARCHAR,
  address2 VARCHAR,
  district VARCHAR,
  city_id INTEGER,
  postal_code VARCHAR,
  phone VARCHAR,
  last_update TIMESTAMP
);

CREATE TABLE category AS
SELECT * FROM dblink(
  'dbname=dbinterview user=postgres password=postgres',
  'SELECT category_id, name, last_update FROM category'
) AS category(
  category_id INTEGER,
  name VARCHAR,
  last_update TIMESTAMP
);

CREATE TABLE city AS
SELECT * FROM dblink(
  'dbname=dbinterview user=postgres password=postgres',
  'SELECT city_id, city, country_id, last_update FROM city'
) AS city(
  city_id INTEGER,
  city VARCHAR,
  country_id INTEGER,
  last_update TIMESTAMP
);

CREATE TABLE country AS
SELECT * FROM dblink(
  'dbname=dbinterview user=postgres password=postgres',
  'SELECT country_id, country, last_update FROM country'
) AS country(
  country_id INTEGER,
  country VARCHAR,
  last_update TIMESTAMP
);

CREATE TABLE customer AS
SELECT * FROM dblink(
  'dbname=dbinterview user=postgres password=postgres',
  'SELECT customer_id, store_id, first_name, last_name, email, address_id, activebool, create_date, last_update, active FROM customer'
) AS customer(
  customer_id INTEGER,
  store_id INTEGER,
  first_name VARCHAR,
  last_name VARCHAR,
  email VARCHAR,
  address_id INTEGER,
  activebool BOOLEAN,
  create_date TIMESTAMP,
  last_update TIMESTAMP,
  active INTEGER
);

CREATE TABLE film AS
SELECT * FROM dblink(
  'dbname=dbinterview user=postgres password=postgres',
  'SELECT film_id, title, description, release_year, language_id, rental_duration, rental_rate, length, replacement_cost, rating, last_update, special_features, fulltext FROM film'
) AS film(
  film_id INTEGER,
  title VARCHAR,
  description TEXT,
  release_year INTEGER,
  language_id INTEGER,
  rental_duration INTEGER,
  rental_rate NUMERIC,
  length INTEGER,
  replacement_cost NUMERIC,
  rating VARCHAR,
  last_update TIMESTAMP,
  special_features VARCHAR[],
  fulltext TSVECTOR
);

CREATE TABLE film_actor AS
SELECT * FROM dblink(
  'dbname=dbinterview user=postgres password=postgres',
  'SELECT actor_id, film_id, last_update FROM film_actor'
) AS film_actor(
  actor_id INTEGER,
  film_id INTEGER,
  last_update TIMESTAMP
);

CREATE TABLE film_category AS
SELECT * FROM dblink(
  'dbname=dbinterview user=postgres password=postgres',
  'SELECT film_id, category_id, last_update FROM film_category'
) AS film_category(
  film_id INTEGER,
  category_id INTEGER,
  last_update TIMESTAMP
);

CREATE TABLE inventory AS
SELECT * FROM dblink(
  'dbname=dbinterview user=postgres password=postgres',
  'SELECT inventory_id, film_id, store_id, last_update FROM inventory'
) AS inventory(
  inventory_id INTEGER,
  film_id INTEGER,
  store_id INTEGER,
  last_update TIMESTAMP
);

CREATE TABLE language AS
SELECT * FROM dblink(
  'dbname=dbinterview user=postgres password=postgres',
  'SELECT language_id, name, last_update FROM language'
) AS language(
  language_id INTEGER,
  name VARCHAR,
  last_update TIMESTAMP
);

CREATE TABLE payment AS
SELECT * FROM dblink(
  'dbname=dbinterview user=postgres password=postgres',
  'SELECT payment_id, customer_id, staff_id, rental_id, amount, payment_date FROM payment'
) AS payment(
  payment_id INTEGER,
  customer_id INTEGER,
  staff_id INTEGER,
  rental_id INTEGER,
  amount NUMERIC,
  payment_date TIMESTAMP
);

CREATE TABLE rental AS
SELECT * FROM dblink(
  'dbname=dbinterview user=postgres password=postgres',
  'SELECT rental_id, rental_date, inventory_id, customer_id, return_date, staff_id, last_update FROM rental'
) AS rental(
  rental_id INTEGER,
  rental_date TIMESTAMP,
  inventory_id INTEGER,
  customer_id INTEGER,
  return_date TIMESTAMP,
  staff_id INTEGER,
  last_update TIMESTAMP
);

CREATE TABLE staff AS
SELECT * FROM dblink(
  'dbname=dbinterview user=postgres password=postgres',
  'SELECT staff_id, first_name, last_name, address_id, email, store_id, active, username, password, last_update, picture FROM staff'
) AS staff(
  staff_id INTEGER,
  first_name VARCHAR,
  last_name VARCHAR,
  address_id INTEGER,
  email VARCHAR,
  store_id INTEGER,
  active INTEGER,
  username VARCHAR,
  password VARCHAR,
  last_update TIMESTAMP,
  picture BYTEA
);

CREATE TABLE store AS
SELECT * FROM dblink(
  'dbname=dbinterview user=postgres password=postgres',
  'SELECT store_id, manager_staff_id, address_id, last_update FROM store'
) AS store(
  store_id INTEGER,
  manager_staff_id INTEGER,
  address_id INTEGER,
  last_update TIMESTAMP
);

