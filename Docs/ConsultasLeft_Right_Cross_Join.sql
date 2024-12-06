USE wikicoa;
# Consulta con Left
#  Listar todos los usuarios y los artículos que han creado (incluso si algún usuario es null).
SELECT users.username, articles.title AS userArticles
FROM users
LEFT JOIN articles ON users.id = articles.userId;

# Mostrar usuarios con su perfil (información de la tabla people) incluyendo usuarios que no tengan perfil asociado:
SELECT users.username, people.firstName, people.lastName AS peopleProfile
FROM users
LEFT JOIN people ON users.id = people.userId;

# Mostrar artículos con las categorías a las que están asignados
SELECT articles.title, categories.name AS artiCateg
FROM articles
LEFT JOIN assigns ON articles.id = assigns.articleId
LEFT JOIN categories ON assigns.categoryId = categories.id;


# Consulta con Right
# Mostrar todos los artículos y los usuarios que los han creado (incluso si algún artículo no tiene un usuario asociado).
SELECT users.username, articles.title AS userArticles
FROM users
RIGHT JOIN articles ON users.id = articles.userId;

# Muestra todas las categorías y los artículos asignados a cada una, incluso si alguna categoría no tiene artículos.
SELECT categories.name AS categoryName, articles.title AS articleTitle
FROM categories
RIGHT JOIN assigns ON categories.id = assigns.categoryId
RIGHT JOIN articles ON assigns.articleId = articles.id;



# Consulta con Cross
# Obtener todas las combinaciones posibles de usuarios y categorías, independientemente de si están relacionados.
SELECT users.username, categories.name
FROM users
CROSS JOIN categories;

