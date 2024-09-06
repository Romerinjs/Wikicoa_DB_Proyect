#Paso 1:
#Creacion de la base de datos
CREATE DATABASE Wikicoa;

#Paso 2:
USE Wikicoa;

#Paso 3:
#Creacion de la tabla Usuarios
CREATE TABLE Usuarios (
    id_usuario INT AUTO_INCREMENT PRIMARY KEY,
    nombre_usuario VARCHAR(50),
    correo VARCHAR(100),
    contraseña VARCHAR(100),
    fecha_registro DATETIME 	);

#Creacion de la tabla Articulos
CREATE TABLE Articulos (
    id_articulo INT AUTO_INCREMENT PRIMARY KEY,
    titulo VARCHAR(100),
    contenido TEXT,
    fecha_creacion DATETIME,
    fecha_modificacion DATETIME,
    id_usuario INT,
    FOREIGN KEY (id_usuario) REFERENCES Usuarios(id_usuario) 	);

#Creacion de la tabla Categorias
CREATE TABLE Categorias (
    id_categoria INT AUTO_INCREMENT PRIMARY KEY,
    nombre_categoria VARCHAR(50),
    descripcion TEXT
);

#tablas de la normalizacion
#CREATE TABLE Asigna (
#    id_articulo INT,
#    id_categoria INT,
#   PRIMARY KEY (id_articulo, id_categoria),
#    FOREIGN KEY (id_articulo) REFERENCES Articulos(id_articulo),
#    FOREIGN KEY (id_categoria) REFERENCES Categorias(id_categoria) );

#Creacion de la tabla Crea
CREATE TABLE Crea (
    id_usuario INT,
    id_articulo INT,
    fecha_creacion DATE NOT NULL,
    PRIMARY KEY (id_usuario, id_articulo),
    FOREIGN KEY (id_usuario) REFERENCES Usuarios(id_usuario),
    FOREIGN KEY (id_articulo) REFERENCES Articulos(id_articulo)
);
CREATE TABLE Articulo_Categoria (
    id_articulo INT,
    id_categoria INT,
    PRIMARY KEY (id_articulo, id_categoria),
    FOREIGN KEY (id_articulo) REFERENCES Articulos(id_articulo),
    FOREIGN KEY (id_categoria) REFERENCES Categorias(id_categoria)
);
#Agregar columna en tabla Usuarios
ALTER TABLE Usuarios
ADD COLUMN prueba VARCHAR(1) DEFAULT "p";

#Eliminacion de columna previa
ALTER TABLE Usuarios
DROP COLUMN prueba;

#Modificación de columna
ALTER TABLE Usuarios
MODIFY COLUMN correo VARCHAR(100) DEFAULT "empty";

#consultas
