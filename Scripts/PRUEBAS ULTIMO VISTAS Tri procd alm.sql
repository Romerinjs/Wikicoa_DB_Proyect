USE wikicoa;

SELECT * FROM users;
SELECT * FROM people;

# Prueba trigger
INSERT INTO users (username, passwordKey) 
VALUES ('Lamar', 'xxxx122');
