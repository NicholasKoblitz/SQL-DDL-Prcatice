-- from the terminal run:
-- psql < air_traffic.sql

DROP DATABASE IF EXISTS air_traffic;

CREATE DATABASE air_traffic;

\c air_traffic

CREATE TABLE airlines
(
  id SERIAL PRIMARY KEY,
  airline TEXT NOT NULL
);

CREATE TABLE airplanes
(
  id SERIAL PRIMARY KEY,
  airline INTEGER REFERENCES airlines NOT NULL,
  seat TEXT NOT NULL,
  departure TIMESTAMP NOT NULL,
  arrival TIMESTAMP NOT NULL
);

CREATE TABLE locations
(
  id SERIAL PRIMARY KEY,
  from_city TEXT NOT NULL,
  from_country TEXT NOT NULL,
  to_city TEXT NOT NULL,
  to_country TEXT NOT NULL
);


CREATE TABLE flyers
(
  id SERIAL PRIMARY KEY,
  first_name TEXT NOT NULL,
  last_name TEXT NOT NULL,
  airplane INTEGER REFERENCES airplanes NOT NULL,
  location INTEGER REFERENCES locations NOT NULL
);


INSERT INTO airlines
  (airline)
VALUES
  ('United'),
  ('British Airways'),
  ('Delta'),
  ('TUI Fly Belgium'),
  ('Air China'),
  ('American Airlines'),
  ('Avianca Brasil');


INSERT INTO airplanes
  (airline, seat, departure, arrival)
VALUES
  (1, '33B', '2018-04-08 09:00:00', '2018-04-08 12:00:00'),
  (2, '8A', '2018-12-19 12:45:00', '2018-12-19 16:15:00'),
  (3, '12F', '2018-01-02 07:00:00', '2018-01-02 08:03:00'),
  (3, '20A', '2018-04-15 16:50:00', '2018-04-15 21:00:00'),
  (4, '23D', '2018-08-01 18:30:00', '2018-08-01 21:50:00'),
  (5, '18C', '2018-10-31 01:15:00', '2018-10-31 12:55:00'),
  (1, '9E', '2019-02-06 06:00:00', '2019-02-06 07:47:00'),
  (6, '1A', '2018-12-22 14:42:00', '2018-12-22 15:56:00'),
  (6, '32B', '2019-02-06 16:28:00', '2019-02-06 19:18:00'),
  (7, '10D', '2019-01-20 19:30:00', '2019-01-20 22:45:00');


INSERT INTO locations
  (from_city, from_country, to_city, to_country)
VALUES
  ('Washington DC', 'United States', 'Seattle', 'United States'),
  ('Tokyo', 'Japan', 'London', 'United Kingdom'),
  ('Los Angeles', 'United States', 'Las Vegas', 'United States'),
  ('Seattle', 'United States', 'Mexico City', 'Mexico'),
  ('Paris', 'France', 'Casablanca', 'Morocco'),
  ('Dubai', 'UAE', 'Beijing', 'China'),
  ('New York', 'United States', 'Charlotte', 'United States'),
  ('Cedar Rapids', 'United States', 'Chicago', 'United States'),
  ('Charlotte', 'United States', 'New Orleans', 'United States'),
  ('Sao Paolo', 'Brazil', 'Santiago', 'Chile');


INSERT INTO flyers
  (first_name, last_name, airplane, location)
VALUES
  ('Jennifer', 'Finch', 1, 1),
  ('Thadeus', 'Gathercoal', 2, 2),
  ('Sonja', 'Pauley', 3, 3),
  ('Jennifer', 'Finch', 4, 4),
  ('Waneta', 'Skeleton', 5, 5),
  ('Thadeus', 'Gathercoal', 6, 6),
  ('Berkie', 'Wycliff', 7, 7),
  ('Alvin', 'Leathes', 8, 8),
  ('Berkie', 'Wycliff', 9, 9),
  ('Cory', 'Squibbes', 10, 10);