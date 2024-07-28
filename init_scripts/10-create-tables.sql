-- Users Table
CREATE TABLE users (
    id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
    username varchar(255) NOT NULL,
    email varchar(255) UNIQUE NOT NULL,
    password character(97) NOT NULL, -- All argon2id hashes will be 97 chars in length using the settings we have
    first_name varchar(255),
    last_name varchar(255),
    enabled boolean NOT NULL
);
CREATE INDEX users_email_index ON users(email);
