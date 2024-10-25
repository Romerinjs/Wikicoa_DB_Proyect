USE wikicoa;
-- Encuentra los usuarios que tienen roles únicos (roles que no comparten con otros usuarios)
SELECT username 
FROM users AS u
JOIN user_roles AS ur ON u.id = ur.userId
GROUP BY username
HAVING COUNT(roleId) = 1;

