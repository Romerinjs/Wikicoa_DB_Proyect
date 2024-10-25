USE wikicoa;
SELECT username 
FROM users 
WHERE id IN (SELECT userId FROM comments);
