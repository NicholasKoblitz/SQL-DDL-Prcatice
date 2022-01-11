DROP DATABASE IF EXISTS craigslist;

CREATE DATABASE craigslist;

\c craigslist


CREATE TABLE regions
(
    id SERIAL PRIMARY KEY,
    region TEXT UNIQUE NOT NULL
);


CREATE TABLE categories
(
    id SERIAL PRIMARY KEY,
    category TEXT UNIQUE NOT NULL
);

CREATE TABLE users
(
    id SERIAL PRIMARY KEY,
    username VARCHAR(15) UNIQUE NOT NULL,
    password VARCHAR(15) NOT NULL,
    region_id INTEGER REFERENCES regions
);

CREATE TABLE posts
(
    id SERIAL PRIMARY KEY,
    user_id INTEGER REFERENCES users NOT NULL,
    category_id INTEGER REFERENCES categories NOT NULL,
    title VARCHAR(20) NOT NULL,
    text TEXT,
    location TEXT,
    region_id  INTEGER REFERENCES regions
);

