USE Wikicoa;
# Cambiar nombre de tabla Usuarios a Users
RENAME TABLE Usuarios TO Users;

# Cambiar nombre de tabla Articulos a Articles
RENAME TABLE Articulos TO Articles;

# Cambiar nombre de tabla Categorias a Categories
RENAME TABLE Categorias TO Categories;

# Cambiar nombre de tabla Crea a Creates
RENAME TABLE Crea TO Creates;

# Cambiar nombre de tabla Articulo_Categoria a Article_Category
RENAME TABLE Articulo_Categoria TO Article_Category;


# New changes to columns
# Cambiar atributos en la tabla Users
ALTER TABLE Users
CHANGE COLUMN id_usuario user_id INT AUTO_INCREMENT PRIMARY KEY,
CHANGE COLUMN nombre_usuario username VARCHAR(50),
CHANGE COLUMN correo email VARCHAR(100),
CHANGE COLUMN contraseña password VARCHAR(100),
CHANGE COLUMN fecha_registro registration_date DATETIME;

# Cambiar atributos en la tabla Articles
ALTER TABLE Articles
CHANGE COLUMN id_articulo article_id INT AUTO_INCREMENT PRIMARY KEY,
CHANGE COLUMN titulo title VARCHAR(100),
CHANGE COLUMN contenido content TEXT,
CHANGE COLUMN fecha_creacion creation_date DATETIME,
CHANGE COLUMN fecha_modificacion modification_date DATETIME,
CHANGE COLUMN id_usuario user_id INT;

# Cambiar atributos en la tabla Categories
ALTER TABLE Categories
CHANGE COLUMN id_categoria category_id INT AUTO_INCREMENT PRIMARY KEY,
CHANGE COLUMN nombre_categoria category_name VARCHAR(50),
CHANGE COLUMN descripcion description TEXT;

# Cambiar atributos en la tabla Creates
ALTER TABLE Creates
CHANGE COLUMN id_usuario user_id INT,
CHANGE COLUMN id_articulo article_id INT,
CHANGE COLUMN fecha_creacion creation_date DATE NOT NULL;

# Cambiar atributos en la tabla Article_Category
ALTER TABLE Article_Category
CHANGE COLUMN id_articulo article_id INT,
CHANGE COLUMN id_categoria category_id INT;
