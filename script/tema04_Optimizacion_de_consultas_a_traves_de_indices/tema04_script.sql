--Carga de un millon de registros

DECLARE @i INT = 0;					-- Primero se declara una variable de contador
WHILE @i < 1000000				    -- Luego se inicia un bucle que se repetirá un millón de veces
BEGIN
    INSERT INTO pedido (total, fecha, id_usuario)
	--Se genera una fecha y un monto aleatorio, luego selecciona un id_usuario aleatorio de la tabla usuarios
    VALUES (RAND() * 1000, DATEADD(DAY, -RAND() * 365, GETDATE()), FLOOR(RAND() * 1000) + 1); 
    SET @i = @i + 1;				-- Incrementa la variable @i en cada iteración del bucle
END;