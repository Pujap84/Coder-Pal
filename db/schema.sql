DROP TABLE IF EXISTS questions;

CREATE TABLE questions (
    id SERIAL PRIMARY KEY,
    name TEXT,
    image_url TEXT,
    price DECIMAL(8,2)
);

CREATE TABLE answers (
    id SERIAL PRIMARY KEY,
    name TEXT,
    image_url TEXT,
    price DECIMAL(8,2)
);

CREATE TABLE users (
    id SERIAL PRIMARY KEY,
    name TEXT,
    email TEXT,
    password_digest TEXT,
);

ALTER TABLE signup RENAME COLUMN password TO password_digest;