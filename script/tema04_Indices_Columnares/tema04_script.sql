USE proyecto;
DROP TABLE usuario_con_indice
DROP TABLE usuario_sin_indice
--Creacion de una tabla para la prueba

SELECT *
INTO usuario_con_indice
FROM usuario
WHERE 1 = 0; -- Esto asegura que solo se copie la estructura

--Carga de un millon de datos

DECLARE @i INT = 0;					-- Primero se declara una variable de contador
WHILE @i < 1000000				    -- Luego se inicia un bucle que se repetirá un millón de veces
BEGIN
    INSERT INTO usuario_con_indice(
    nombre_usuario, 
    apellido_usuario,
    telefono,
    email,
    contrasena,
    perfil_id,
    domicilio_id
    )
    --Cargamos valores aleatorios a los campos pertenecientes a la tabla usuario_con_indice
    VALUES (
    CONCAT('nombre', @i % 1000),            -- nombre
    CONCAT('apellido', @i % 1000),          -- apellido
    RAND() * 1000,                          -- telefono
    CONCAT('email', @i, '@gmailfalso.com'), -- email
    CONCAT('contraseña', @i),               -- contraseña
    2,                                      -- perfil_id
    4                                       -- domicilio
    ); 
    IF (@i % 10000 = 0)                     -- cada 10.000 registros, crea un usuario admin
    BEGIN
        UPDATE usuario_con_indice
        SET perfil_id = 1
    END
    SET @i = @i + 1;				-- Incrementa la variable @i en cada iteración del bucle
END;

SELECT * 
FROM usuario_con_indice

SET STATISTICS TIME ON; -- Muestra el tiempo el tiempo de CPU y tiempo total de ejecucion.
SET STATISTICS IO ON; -- Muestra la cantidad de operaciones de lectura de pagina para monitorear la entrada/salida.

-- Creamos una copia de la tabla con indice, para hacer la busqueda sin indice.
SELECT *
INTO usuario_sin_indice
FROM usuario_con_indice

-- Creamos un indice columnar en la tabla usuario_con_indice
CREATE COLUMNSTORE INDEX IDX_columnstore_usuario
ON usuario_con_indice(nombre_usuario,telefono,email,perfil_id);

-- Primero, probemos el tiempo de ejecucion de la tabla sin indice columnar
SELECT perfil_id, nombre_usuario, telefono, email, COUNT(*)
FROM usuario_sin_indice
GROUP BY nombre_usuario, telefono, email, perfil_id
--  1000000 registros leidos
--  SQL Server Execution Times:
--  CPU time = 8937 ms,  elapsed time = 54204 ms.

-- Segundo, probemos el tiempo de ejecucion de la tabla con indice
SELECT nombre_usuario, telefono, email, COUNT(*)
FROM usuario_con_indice
GROUP BY nombre_usuario, telefono, email
-- 1000000 registros leidos
-- SQL Server Execution Times:
-- CPU time = 8579 ms,  elapsed time = 49863 ms.


