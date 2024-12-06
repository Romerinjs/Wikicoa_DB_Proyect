USE wikicoa;

-- Roles
INSERT INTO roles (roleName)
VALUES 
    ('admin'), 
    ('editor'), 
    ('viewer'), 
    ('default');

-- Users
INSERT INTO users (username, passwordKey, registrationDate)
VALUES 
    ('user1', 'password123', '2024-01-15 10:00:00'),
    ('user2', 'password456', '2024-02-20 12:30:00'),
    ('user3', 'password789', '2024-03-05 14:45:00');

-- People
INSERT INTO people (firstName, lastName, birthdate, gender, userId)
VALUES 
    ('Alice', 'Smith', '1990-05-12', 'Female', 1),
    ('Bob', 'Brown', '1985-07-22', 'Male', 2),
    ('Charlie', 'Johnson', '1992-11-10', 'Non-Binary', 3);

-- User Roles
INSERT INTO user_roles (userId, roleId)
VALUES 
    (1, 1), -- Admin role
    (2, 2), -- Editor role
    (3, 3); -- Viewer role

-- Articles
INSERT INTO articles (title, content, creationDate, modificationDate, userId)
VALUES 
    ('First Article', 'Content of the first article.', '2024-01-16 08:00:00', '2024-01-16 08:00:00', 1),
    ('Second Article', 'Content of the second article.', '2024-02-21 09:30:00', '2024-02-21 09:30:00', 2),
    ('Third Article', 'Content of the third article.', '2024-03-06 15:00:00', '2024-03-06 15:00:00', 3);

-- Categories
INSERT INTO categories (name, description)
VALUES 
    ('Technology', 'Articles about technology.'),
    ('Science', 'Articles about science.'),
    ('Lifestyle', 'Articles about lifestyle.');

-- Assigns (Articles to Categories)
INSERT INTO assigns (articleId, categoryId)
VALUES 
    (1, 1), 
    (2, 2), 
    (3, 3);

-- Comments
INSERT INTO comments (commentText, creationDate, userId, articleId)
VALUES 
    ('Great article!', '2024-01-17 10:00:00', 2, 1),
    ('Very informative.', '2024-02-22 11:15:00', 3, 2),
    ('Interesting perspective.', '2024-03-07 16:30:00', 1, 3);
