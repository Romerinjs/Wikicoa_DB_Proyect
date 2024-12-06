-- Base de datos existente
DROP DATABASE IF EXISTS wikicoa;
CREATE DATABASE wikicoa;
USE wikicoa;

-- Tabla de usuarios
CREATE TABLE users (
    id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(200),
    passwordKey VARCHAR(200),
    registrationDate DATETIME
);

-- Tabla de personas (relación 1 a 1 con users)
CREATE TABLE people (
    id INT AUTO_INCREMENT PRIMARY KEY,
    firstName VARCHAR(200),
    lastName VARCHAR(200),
    birthdate DATE,
    gender VARCHAR(200),
    userId INT UNIQUE,
    FOREIGN KEY (userId) REFERENCES users(id)
);

-- Tabla de artículos
CREATE TABLE articles (
    id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(200),
    content TEXT,
    creationDate DATETIME,
    modificationDate DATETIME,
    userId INT,
    FOREIGN KEY (userId) REFERENCES users(id)
);

-- Tabla de categorías
CREATE TABLE categories (
    id INT AUTO_INCREMENT PRIMARY KEY,
    `name` VARCHAR(200),
    description TEXT
);

-- Tabla de creación de artículos (modificada con campos de likes y revisiones)
CREATE TABLE creates (
    id INT AUTO_INCREMENT PRIMARY KEY,
    userId INT,
    articleId INT,
    creationDate DATE NOT NULL,
    likes INT DEFAULT 0, -- Número total de likes
    lastRevisionDate DATETIME NULL, -- Fecha de la última revisión
    lastRevisionContent TEXT NULL, -- Contenido de la última revisión
    FOREIGN KEY (userId) REFERENCES users(id),
    FOREIGN KEY (articleId) REFERENCES articles(id)
);

-- Tabla de asignación de artículos a categorías
CREATE TABLE assigns (
    id INT AUTO_INCREMENT PRIMARY KEY,
    articleId INT,
    categoryId INT,
    FOREIGN KEY (articleId) REFERENCES articles(id),
    FOREIGN KEY (categoryId) REFERENCES categories(id)
);

-- Tabla de comentarios
CREATE TABLE comments (
    id INT AUTO_INCREMENT PRIMARY KEY,
    commentText TEXT NOT NULL,
    creationDate DATETIME NOT NULL,
    userId INT,
    articleId INT,
    FOREIGN KEY (userId) REFERENCES users(id),
    FOREIGN KEY (articleId) REFERENCES articles(id)
);

-- Tabla de etiquetas
CREATE TABLE tags (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(200) NOT NULL UNIQUE
);

-- Relación entre artículos y etiquetas
CREATE TABLE article_tag (
	id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    articleId INT,
    tagId INT,
    FOREIGN KEY (articleId) REFERENCES articles(id),
    FOREIGN KEY (tagId) REFERENCES tags(id)
);

-- Tabla de roles
CREATE TABLE roles (
    id INT AUTO_INCREMENT PRIMARY KEY,
    roleName VARCHAR(200) NOT NULL UNIQUE
);

-- Relación entre usuarios y roles
CREATE TABLE user_roles (
	id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    userId INT,
    roleId INT,
    FOREIGN KEY (userId) REFERENCES users(id),
    FOREIGN KEY (roleId) REFERENCES roles(id)
);

-- Tabla principal de la biblioteca virtual
CREATE TABLE virtual_library (
    id INT AUTO_INCREMENT PRIMARY KEY,
    libraryName VARCHAR(200) NOT NULL,
    description TEXT,
    creationDate DATETIME NOT NULL,
    categoryId INT,
    FOREIGN KEY (categoryId) REFERENCES categories(id)
);
