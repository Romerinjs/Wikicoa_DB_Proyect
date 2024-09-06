USE Wikicoa;
# Inserta datos en la tabla Usuarios
INSERT INTO Usuarios (nombre_usuario, correo, contraseña, fecha_registro)
VALUES
('Juanito Alimaña', 'juan.xd@hotmail.com', 'supersecurepass', '2024-01-05 08:30:00'),
('Ann77', 'ana.montes@gmail.com', 'm0ntana1234', '2024-02-12 10:45:00'),
('Miguelangelo', 'miguel.angel@yahoo.com', 'mikeloco567', '2024-03-22 13:20:00'),
('OffSofia', 'sofia.lara@gmail.com', 'mamaypapax100pre', '2024-04-18 16:10:00'),
('Pablo', 'jpramirezc@itp.edu.co', 'pablo789', '2024-05-03 18:50:00');

# Inserción de datos en la tabla Articulos
INSERT INTO Articulos (titulo, contenido, fecha_creacion, fecha_modificacion, id_usuario)
VALUES
('Historia de la Revolución Industrial', 'Contenido sobre la Revolución Industrial...', '2024-06-01 12:30:00', '2024-06-05 14:00:00', 1),
('Tecnología y Sociedad', 'Contenido sobre la influencia de la tecnología...', '2024-06-10 11:00:00', '2024-06-12 13:45:00', 2),
('Teoría de la Relatividad', 'Contenido sobre la teoría de la relatividad...', '2024-06-15 09:15:00', '2024-06-20 10:30:00', 3),
('Arte Contemporáneo', 'Contenido sobre el arte contemporáneo...', '2024-07-01 15:45:00', '2024-07-03 16:30:00', 4),
('Programación en Python', 'Contenido sobre la programación en Python...', '2024-07-10 08:30:00', '2024-07-12 09:00:00', 5);

# Inserta datos en tabla Categorias
INSERT INTO Categorias (nombre_categoria, descripcion)
VALUES
('Historia', 'Artículos relacionados con hechos históricos importantes.'),
('Tecnología', 'Artículos relacionados con avances tecnológicos y su impacto.'),
('Ciencia', 'Artículos que exploran temas científicos.'),
('Arte', 'Artículos sobre movimientos artísticos y estilos.'),
('Programación', 'Artículos sobre lenguajes de programación y desarrollo de software.');

# Insercion de datos en la tabla Crea (asociación entre usuarios y artículos)
INSERT INTO Crea (id_usuario, id_articulo, fecha_creacion)
VALUES
(1, 1, '2024-06-01'),
(2, 2, '2024-06-10'),
(3, 3, '2024-06-15'),
(4, 4, '2024-07-01'),
(5, 5, '2024-07-10');

# Inserta datos en la tabla Articulo_Categoria (asociación entre artículos y categorías)
INSERT INTO Articulo_Categoria (id_articulo, id_categoria)
VALUES
# Historia
(1, 1), 
# Tecnología
(2, 2),
# Ciencia
(3, 3),
# Arte
(4, 4),
# Programación
(5, 5);

#Consultas para la verificación
SELECT * FROM Usuarios;
SELECT * FROM Articulos;
SELECT * FROM Categorias;
SELECT * FROM Articulo_Categorias;
#2 consulta
SELECT Articulos.titulo, Categorias.nombre_categoria
FROM Articulos
JOIN Articulo_Categoria ON Articulos.id_articulo = Articulo_Categoria.id_articulo
JOIN Categorias ON Articulo_Categoria.id_categoria = Categorias.id_categoria;


#3 consulta
SELECT * FROM Articulos
WHERE id_usuario = 1;


