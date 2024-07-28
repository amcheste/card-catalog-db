CREATE TYPE status AS ENUM ('ACTIVE', 'DISABLED');

-- Users Table
CREATE TABLE users (
    id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
    username varchar(255) NOT NULL,
    email varchar(255) UNIQUE NOT NULL,
    first_name varchar(255) NOT NULL,
    last_name varchar(255) NOT NULL,
    time_created timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    time_modified timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    status status NOT NULL DEFAULT 'ACTIVE'
);
CREATE INDEX users_email_index ON users(email);

SELECT * FROM users;

CREATE TABLE user_passwords (
    id uuid PRIMARY KEY REFERENCES users(id),
    password character(97) NOT NULL, -- All argon2id hashes will be 97 chars in length using the settings we have
    expiry timestamp(0)
);