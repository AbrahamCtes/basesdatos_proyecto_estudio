USE proyecto;
DROP TABLE usuario_con_indice
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
    CONCAT('nombre', @i % 1000),
    CONCAT('apellido', @i % 1000),
    RAND() * 1000,
    CONCAT('email', @i, '@gmailfalso.com'),
    CONCAT('contraseña', @i),
    2,
    4
    ); 
    SET @i = @i + 1;				-- Incrementa la variable @i en cada iteración del bucle
END;

SELECT * 
FROM usuario_con_indice

SET STATISTICS TIME ON; -- Muestra el tiempo el tiempo de CPU y tiempo total de ejecucion.
SET STATISTICS IO ON; -- Muestra la cantidad de operaciones de lectura de pagina para monitorear la entrada/salida.

