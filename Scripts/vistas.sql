USE wikicoa;
# Veremos las diferentes vistas
# Vista 1: Vista de usuarios activos por mes
CREATE VIEW active_users_per_month AS
SELECT 
    MONTH(registrationDate) AS registration_month, 
    COUNT(*) AS active_users
FROM users
GROUP BY MONTH(registrationDate);

# Vista 2: Vista de detalles de usuario con información de persona
CREATE VIEW user_details AS
SELECT 
    u.id AS user_id, 
    u.username, 
    u.registrationDate, 
    p.firstName, 
    p.lastName, 
    p.birthdate, 
    p.gender
FROM users u
LEFT JOIN people p ON u.id = p.userId;

# Vista 3: Vista de usuarios con roles
CREATE VIEW users_with_roles AS
SELECT 
    u.id AS user_id, 
    u.username, 
    r.roleName
FROM users u
INNER JOIN user_roles ur ON u.id = ur.userId
INNER JOIN roles r ON ur.roleId = r.id;
