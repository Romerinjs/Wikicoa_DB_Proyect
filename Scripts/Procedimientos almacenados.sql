USE wikicoa;
# Procedimientos almacenados

# P.A. 1: Insertar un nuevo usuario con datos personales
DELIMITER $$
CREATE PROCEDURE insert_new_user(
    IN p_username VARCHAR(200), 
    IN p_passwordKey VARCHAR(200), 
    IN p_firstName VARCHAR(200), 
    IN p_lastName VARCHAR(200), 
    IN p_birthdate DATE, 
    IN p_gender VARCHAR(200)
)
BEGIN
    INSERT INTO users (username, passwordKey, registrationDate)
    VALUES (p_username, p_passwordKey, NOW());
    SET @user_id = LAST_INSERT_ID();
    INSERT INTO people (firstName, lastName, birthdate, gender, userId)
    VALUES (p_firstName, p_lastName, p_birthdate, p_gender, @user_id);
END $$
DELIMITER ;
# Prueba para el anterior procedimiento
CALL insert_new_user(
    'RomerinJs',           -- p_username
    '124578', -- p_passwordKey
    'Romer',              -- p_firstName
    'Almeida',               -- p_lastName
    '1990-01-01',        -- p_birthdate
    'Male'               -- p_gender
);
select * from people;


# P.A. 2: Actualizar la contraseña de un usuario
DELIMITER $$
CREATE PROCEDURE update_user_password(
    IN p_user_id INT, 
    IN p_new_passwordKey VARCHAR(200)
)
BEGIN
    UPDATE users
    SET passwordKey = p_new_passwordKey
    WHERE id = p_user_id;
END $$
DELIMITER ;

# Prueba llamada de procedimiento:
CALL update_user_password(
    1,             -- p_user_id
    'newestthantheother'  -- p_new_passwordKey
);

select passwordKey from users where id = 1;

# P.A. 3: Eliminar un usuario y su información asociada
DELIMITER $$
CREATE PROCEDURE delete_user2(
    IN p_user_id INT
)
BEGIN
    -- Eliminar roles asociados al usuario
    DELETE FROM user_roles WHERE userId = p_user_id;
    
    -- Eliminar información personal del usuario
    DELETE FROM people WHERE userId = p_user_id;

    -- Eliminar al usuario
    DELETE FROM users WHERE id = p_user_id;
END $$
DELIMITER ;


# Llamada de procedimiento
CALL delete_user2(
    6  -- p_user_id
);
select * from users;