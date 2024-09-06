USE Wikicoa;
#Filtrado de datos
SELECT * FROM Usuarios
WHERE nombre_usuario = 'Juanito Alimaña';

#Condiciones para filtrar
#cond. directa
SELECT * FROM Articulos
WHERE id_usuario = 1;

#condiciones lógicas
# AND
SELECT * FROM Articulos
WHERE id_usuario = 1 AND fecha_creacion > '2024-01-01';

# cond. OR
SELECT * FROM Articulos
WHERE titulo = 'Historia' OR fecha_modificacion > '2024-07-01';

#Condiciones NOT
SELECT * FROM Usuarios
WHERE nombre_usuario <> 'Ann77';

#condicion mayor que
SELECT * FROM Articulos
WHERE fecha_creacion > '2024-01-01';

#Igualdad
SELECT * FROM Categorias
WHERE nombre_categoria = 'Historia';
