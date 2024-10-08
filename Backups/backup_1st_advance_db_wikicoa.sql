# Paso 1:
# Creación de la base de datos
DROP DATABASE IF EXISTS wikicoa;
CREATE DATABASE wikicoa;

# Paso 2:
USE wikicoa;

# Paso 3:
# Creación de la tabla users
CREATE TABLE users (
    id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(50),
    passwordKey VARCHAR(100),
    registrationDate DATETIME
);

# Creación de la tabla people
CREATE TABLE people (
    id INT AUTO_INCREMENT PRIMARY KEY,
    firstName VARCHAR(15),
    lastName VARCHAR (15),
    birthdate DATE,
    gender VARCHAR(10),
    userId INT UNIQUE, # con esto garantizamos que la relacion sea 1 a 1 xd
    FOREIGN KEY (userId) REFERENCES users(id)  -- Relacionado con 'id' en users
);

# Creación de la tabla articles
CREATE TABLE articles (
    id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(100),
    content TEXT,
    creationDate DATETIME,
    modificationDate DATETIME,
    userId INT,
    FOREIGN KEY (userId) REFERENCES users(id)  -- Relacionado con 'id' en users
);

# Creación de la tabla categories
CREATE TABLE categories (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(50),
    description TEXT
);

# Creación de la tabla creates
CREATE TABLE creates (
    userId INT,
    articleId INT,
    creationDate DATE NOT NULL,
    PRIMARY KEY (userId, articleId),
    FOREIGN KEY (userId) REFERENCES users(id),  -- Relacionado con 'id' en users
    FOREIGN KEY (articleId) REFERENCES articles(id)  -- Relacionado con 'id' en articles
);

# Creación de la tabla assigns (anteriormente Article_Category)
CREATE TABLE assigns (
    articleId INT,
    categoryId INT,
    PRIMARY KEY (articleId, categoryId),
    FOREIGN KEY (articleId) REFERENCES articles(id),  -- Relacionado con 'id' en articles
    FOREIGN KEY (categoryId) REFERENCES categories(id)  -- Relacionado con 'id' en categories
);

# Agregar columna en tabla users
ALTER TABLE users
ADD COLUMN testColumn VARCHAR(1) DEFAULT "p";

# Eliminación de columna previa
ALTER TABLE users
DROP COLUMN testColumn;

# Modificación de columna
ALTER TABLE users
MODIFY COLUMN email VARCHAR(100) DEFAULT "empty";

ALTER TABLE users
DROP COLUMN email;
ALTER TABLE people ADD COLUMN email VARCHAR (100) DEFAULT "@yourmail.dom";
ALTER TABLE people DROP COLUMN fullName;
ALTER TABLE people ADD COLUMN firstName VARCHAR(15);
ALTER TABLE people ADD COLUMN lastName VARCHAR(15);
