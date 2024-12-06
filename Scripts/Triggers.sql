USE wikicoa;

SELECT * 
FROM information_schema.TRIGGERS 
WHERE TRIGGER_SCHEMA = 'wikicoa';

# Triggers
# 1: Trigger para establecer un valor inicial en roles al crear un usuario
DELIMITER $$
CREATE TRIGGER after_user_insert
AFTER INSERT ON users
FOR EACH ROW
BEGIN
    INSERT INTO user_roles (userId, roleId)
    VALUES (NEW.id, (SELECT id FROM roles WHERE roleName = 'default'));
END $$
DELIMITER ;

# Consulta para probar trigger
SELECT 
    u.id AS user_id, 
    u.username, 
    r.roleName AS assigned_role
FROM users u
LEFT JOIN user_roles ur ON u.id = ur.userId
LEFT JOIN roles r ON ur.roleId = r.id;

INSERT INTO users (username, passwordKey, registrationDate)
VALUES ('new_user', 'password123', NOW());


# 2: Trigger para actualizar la última fecha de modificación de un artículo cuando cambia el contenido
DELIMITER $$
CREATE TRIGGER before_article_update
BEFORE UPDATE ON articles
FOR EACH ROW
BEGIN
    SET NEW.modificationDate = NOW();
END $$
DELIMITER ;

# consulta de prueba
SELECT modificationDate 
FROM articles 
WHERE id = 1;

UPDATE articles
SET content = 'Updated content via trigger test'
WHERE id = 1;



# 3: Trigger para evitar eliminación de usuarios con artículos publicados
DELIMITER $$
CREATE TRIGGER before_user_delete
BEFORE DELETE ON users
FOR EACH ROW
BEGIN
    IF EXISTS (SELECT 1 FROM articles WHERE userId = OLD.id) THEN
        SIGNAL SQLSTATE '45000' 
        SET MESSAGE_TEXT = 'Cannot delete user with published articles.';
    END IF;
END $$
DELIMITER ;

# Consulta de prueba
SELECT * 
FROM users 
WHERE id = 3;

SELECT * 
FROM articles 
WHERE userId = 3;

# Prueba del trigger 3
DELETE FROM users
WHERE id = 3;


# Prueba para triggers funcionales
DELIMITER $$
CREATE TRIGGER before_insert_users
BEFORE INSERT ON users
FOR EACH ROW
BEGIN
    SET NEW.registrationDate = NOW();
END $$
DELIMITER ;
# Este trigger automáticamente asigna la fecha de registro
# (registrationDate) al momento actual antes de insertar un nuevo usuario.
