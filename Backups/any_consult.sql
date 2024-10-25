USE wikicoa;
-- Encuentra artículos cuyo usuario creador ha hecho 'any' comentario en algún artículo.
SELECT title 
FROM articles 
WHERE userId = ANY (SELECT userId FROM comments);
