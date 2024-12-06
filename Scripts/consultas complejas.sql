# CONSULTAS COMPLEJAS
USE wikicoa;
# Consulta para obtener el nombre de usuarios y el número total de artículos creados
SELECT 
    u.username, 
    COUNT(a.id) AS totalArticles
FROM  users AS u
LEFT JOIN 
    articles AS a ON u.id = a.userId
GROUP BY     u.id
ORDER BY     totalArticles DESC;
