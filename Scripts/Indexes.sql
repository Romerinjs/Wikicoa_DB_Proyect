# Indexes
USE wikicoa;
# Indice unico para la tabla username, eficiencia y induplicidad 
CREATE UNIQUE INDEX idx_users_username ON users(username);

EXPLAIN SELECT * FROM users WHERE username = 'Juanito';


# Relación muchos a muchos para búsquedas rápidas de artículos etiquetados.
CREATE INDEX idx_article_tag_article_tag ON article_tag(articleId, tagId);

EXPLAIN SELECT * FROM article_tag WHERE articleId = 1 AND tagId = 2;


SHOW INDEX FROM users;

SHOW INDEX FROM article_tag;
