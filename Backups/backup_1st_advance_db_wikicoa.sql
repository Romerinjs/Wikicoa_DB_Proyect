-- Base de datos existente:
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
    gender VARCHAR(10),
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
    name VARCHAR(200),
    description TEXT
);

-- Tabla de creación de artículos
CREATE TABLE creates (
    id INT AUTO_INCREMENT PRIMARY KEY,
    userId INT,
    articleId INT,
    creationDate DATE NOT NULL,
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

-- Nuevas tablas:

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
	id INT AUTO_INCREMENT PRIMARY KEY,
    articleId INT,
    tagId INT,
    FOREIGN KEY (articleId) REFERENCES articles(id),
    FOREIGN KEY (tagId) REFERENCES tags(id)
);

-- Tabla de revisiones de artículos
CREATE TABLE article_revisions (
    id INT AUTO_INCREMENT PRIMARY KEY,
    articleId INT,
    userId INT,
    revisionDate DATETIME NOT NULL,
    content TEXT NOT NULL,
    FOREIGN KEY (articleId) REFERENCES articles(id),
    FOREIGN KEY (userId) REFERENCES users(id)
);

-- Tabla de roles
CREATE TABLE roles (
    id INT AUTO_INCREMENT PRIMARY KEY,
    roleName VARCHAR(200) NOT NULL UNIQUE
);

-- Relación entre usuarios y roles
CREATE TABLE user_roles (
	id INT PRIMARY KEY AUTO_INCREMENT,
    userId INT,
    roleId INT,
    FOREIGN KEY (userId) REFERENCES users(id),
    FOREIGN KEY (roleId) REFERENCES roles(id)
);

-- Tabla de likes en artículos
CREATE TABLE article_likes (
	id INT PRIMARY KEY AUTO_INCREMENT,
    userId INT,
    articleId INT,
    likeDate DATETIME NOT NULL,
    FOREIGN KEY (userId) REFERENCES users(id),
    FOREIGN KEY (articleId) REFERENCES articles(id)
);
