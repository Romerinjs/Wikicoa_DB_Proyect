USE wikicoa;
-- Encuentra todos los artículos que tienen asignada una categoría.
SELECT title 
FROM articles AS a 
WHERE EXISTS (SELECT 1 FROM assigns WHERE articleId = a.id);
