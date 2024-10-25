USE wikicoa;
-- Tabla de usuarios
INSERT INTO users (username, passwordKey, registrationDate)
VALUES ('user1', 'pass123', '2023-01-01 10:00:00'),
       ('user2', 'pass456', '2023-02-02 12:30:00');

-- Tabla de personas
INSERT INTO people (firstName, lastName, birthdate, gender, userId)
VALUES ('John', 'Doe', '1990-06-15', 'M', 1),
       ('Jane', 'Smith', '1985-04-20', 'F', 2);

-- Tabla de artículos
INSERT INTO articles (title, content, creationDate, modificationDate, userId)
VALUES ('First Article', 'Content of the first article', '2023-01-05 11:00:00', '2023-01-06 11:00:00', 1),
       ('Second Article', 'Content of the second article', '2023-02-10 15:00:00', '2023-02-12 15:00:00', 2);

-- Tabla de categorías
INSERT INTO categories (name, description)
VALUES ('Technology', 'Articles about technology'),
       ('Science', 'Articles about science');

-- Tabla de creación de artículos
INSERT INTO creates (userId, articleId, creationDate)
VALUES (1, 1, '2023-01-05'),
       (2, 2, '2023-02-10');

-- Tabla de asignación de artículos a categorías
INSERT INTO assigns (articleId, categoryId)
VALUES (1, 1),
       (2, 2);

-- Tabla de comentarios
INSERT INTO comments (commentText, creationDate, userId, articleId)
VALUES ('Great article!', '2023-01-06 11:30:00', 2, 1),
       ('Very informative.', '2023-02-12 16:00:00', 1, 2);

-- Tabla de etiquetas
INSERT INTO tags (name)
VALUES ('Tech'), ('Education');

-- Relación entre artículos y etiquetas
INSERT INTO article_tag (articleId, tagId)
VALUES (1, 1), (2, 2);

-- Tabla de revisiones de artículos
INSERT INTO article_revisions (articleId, userId, revisionDate, content)
VALUES (1, 1, '2023-01-06 12:00:00', 'Revised content of the first article'),
       (2, 2, '2023-02-12 17:00:00', 'Revised content of the second article');

-- Tabla de roles
INSERT INTO roles (roleName)
VALUES ('Admin'), ('Editor');

-- Relación entre usuarios y roles
INSERT INTO user_roles (userId, roleId)
VALUES (1, 1), (2, 2);

-- Tabla de likes en artículos
INSERT INTO article_likes (userId, articleId, likeDate)
VALUES (1, 2, '2023-02-13 10:00:00'),
       (2, 1, '2023-01-07 12:00:00');
