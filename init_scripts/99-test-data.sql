-- Add test user foo, the password is foo
INSERT INTO users(id, username, email, first_name, last_name, time_created, time_modified, status)
VALUES('67c62fba-6061-4009-ae1b-4d20ceed3380', 'foo', 'foo@mail.com','Foo', 'Bar', '2024-08-01T23:05:56', '2024-08-01T23:05:56', 'ACTIVE');

INSERT INTO user_passwords(id, password, expiry)
VALUES('67c62fba-6061-4009-ae1b-4d20ceed3380', '$argon2id$v=19$m=65536,t=3,p=1$bIlCaQhbkjXZ0sF9nC/NnQ$VphhiTfJE5nnZIBTfjSoy3KmPsd0HD5ILHzYhpd+CA4', '2024-10-30T23:05:55.708Z');

