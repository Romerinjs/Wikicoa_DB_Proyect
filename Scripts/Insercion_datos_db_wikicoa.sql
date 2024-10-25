USE wikicoa;
# Insert data in People Table
INSERT INTO people 
(firstName, lastName, birthdate, gender, userId)
 VALUES 
 ('Juan', 'Garcia', '2004-06-05', 'male', 1);

# Inserción de datos en la tabla users
INSERT INTO users (username, passwordKey, registrationDate)
VALUES
('Nigromante', 'KidKeo123', '2024-05-06 08:21:00'),
('JuanitoAlimaña', 'supersecurepass', '2024-01-05 08:30:00'),
('Ann77', 'm0ntana1234', '2024-02-12 10:45:00'),
('Miguelangelo', 'mikeloco567', '2024-03-22 13:20:00'),
('OffSofia', 'mamaypapax100pre', '2024-04-18 16:10:00'),
('Pablo', 'pablo789', '2024-05-03 18:50:00');

# Inserción de datos en la tabla articles
INSERT INTO articles (title, content, creationDate, modificationDate, userId)
VALUES
('Historia de la Revolución Industrial', 'Contenido sobre la Revolución Industrial...', '2024-06-01 12:30:00', '2024-06-05 14:00:00', 1),
('Tecnología y Sociedad', 'Contenido sobre la influencia de la tecnología...', '2024-06-10 11:00:00', '2024-06-12 13:45:00', 2),
('Teoría de la Relatividad', 'Contenido sobre la teoría de la relatividad...', '2024-06-15 09:15:00', '2024-06-20 10:30:00', 3),
('Arte Contemporáneo', 'Contenido sobre el arte contemporáneo...', '2024-07-01 15:45:00', '2024-07-03 16:30:00', 4),
('Programación en Python', 'Contenido sobre la programación en Python...', '2024-07-10 08:30:00', '2024-07-12 09:00:00', 5);

# Inserción de datos en la tabla categories
INSERT INTO categories (name, description)
VALUES
('Historia', 'Artículos relacionados con hechos históricos importantes.'),
('Tecnología', 'Artículos relacionados con avances tecnológicos y su impacto.'),
('Ciencia', 'Artículos que exploran temas científicos.'),
('Arte', 'Artículos sobre movimientos artísticos y estilos.'),
('Programación', 'Artículos sobre lenguajes de programación y desarrollo de software.');

# Inserción de datos en la tabla creates
INSERT INTO creates (userId, articleId, creationDate)
VALUES
(1, 1, '2024-06-01'),
(2, 2, '2024-06-10'),
(3, 3, '2024-06-15'),
(4, 4, '2024-07-01'),
(5, 5, '2024-07-10');

# Inserción de datos en la tabla assigns (asignaciones de categorías a artículos)
INSERT INTO assigns (articleId, categoryId)
VALUES
(1, 1),  -- Historia
(2, 2),  -- Tecnología
(3, 3),  -- Ciencia
(4, 4),  -- Arte
(5, 5);  -- Programación

# Consultas de verificación:

# 1. Consulta para ver usuarios y los artículos que han creado:
SELECT u.username, a.title
FROM users u
INNER JOIN articles a ON u.id = a.userId;

# 2. Consulta para ver los artículos y sus categorías:
SELECT a.title, c.`name` AS category
FROM articles a
INNER JOIN assigns ac ON a.id = ac.articleId
INNER JOIN categories c ON ac.categoryId = c.id;

# 3. Consulta para filtrar artículos por un usuario en específico (Juanito Alimaña):
SELECT * 
FROM articles 
WHERE userId = 1;