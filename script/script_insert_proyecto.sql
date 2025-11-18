-- =========================
-- Lote de datos del proyecto
-- =========================

-- Métodos de pago
INSERT INTO metodo_pago (metodo_pago_id, descripcion_metodo_pago) VALUES
(1, 'Efectivo'),
(2, 'Tarjeta de Crédito'),
(3, 'Transferencia'),
(4, 'Mercado Pago');

-- Perfiles
INSERT INTO perfil (perfil_id, tipo_perfil) VALUES
(1, 'Administrador'),
(2, 'Cliente');

-- Talles
INSERT INTO talle (talle_id, descripcion_talle) VALUES
(1, 'S'),
(2, 'M'),
(3, 'L'),
(4, 'XL');

-- Tipos de producto
INSERT INTO tipo (tipo_id, nombre_tipo) VALUES
(1, 'Remeras'),
(2, 'Pantalones');

-- Marcas
INSERT INTO marca (nombre_marca) VALUES
('Nike'),
('Adidas'),
('Puma'),
('Reebok'),
('Under Armour'),
('Fila'),
('Converse');

-- Estados de producto
INSERT INTO estado (estado_id, descripcion_estado) VALUES
(1, 'Disponible'),
(2, 'No disponible');

-- Categorías
INSERT INTO categoria (categoria_id, nombre_categoria) VALUES
(1, 'Hombre'),
(2, 'Mujer');

-- Países
INSERT INTO pais (pais_nombre) VALUES
('Argentina'),
('Brasil'),
('Chile'),
('Uruguay'),
('Paraguay'),
('Bolivia');

-- Provincias
INSERT INTO provincia (provincia_nombre, pais_id) VALUES
('Corrientes', 1),	   -- Argentina
('Buenos Aires', 1),   -- Argentina
('São Paulo', 2),      -- Brasil
('Santiago', 3),       -- Chile
('Montevideo', 4),     -- Uruguay
('Asunción', 5),       -- Paraguay
('La Paz', 6),         -- Bolivia
('Córdoba', 1),
('Santa Fe', 1),
('Mendoza', 1),
('Salta', 1),
('Misiones', 1);

-- Ciudades
INSERT INTO ciudad (ciudad_nombre, provincia_id) VALUES
('Corrientes Capital', 1),   -- Corrientes
('La Plata', 2),             -- Buenos Aires
('Córdoba Capital', 8),      -- Córdoba
('Rosario', 9),              -- Santa Fe
('Mendoza Capital', 10),     -- Mendoza
('Salta Capital', 11),       -- Salta
('Posadas', 12),             -- Misiones
('São Paulo', 3),            -- São Paulo (Brasil)
('Santiago de Chile', 4),    -- Santiago (Chile)
('Montevideo', 5),           -- Montevideo (Uruguay)
('Asunción', 6),             -- Asunción (Paraguay)
('La Paz', 7);               -- La Paz (Bolivia)


-- Domicilios de proveedores
INSERT INTO domicilio (altura, calle, ciudad_id) VALUES
(101, 'Av. Independencia', 1),  -- Corrientes Capital
(260, 'Calle 9 de Julio', 2),   -- La Plata
(340, 'Av. Colón', 3),          -- Córdoba Capital
(420, 'Bv. Oroño', 4);          -- Rosario

-- Proveedores
INSERT INTO proveedor (proveedor_nombre, domicilio_id) VALUES
('Deportes Global', 1),
('SportMax Distribuidora', 2),
('Atletas Proveedor', 3),
('UrbanFit Supply', 4);

-- Productos (20 registros)
INSERT INTO producto (precio_unitario, descripcion, tipo_id, marca_id, estado_id, categoria_id, proveedor_id) VALUES
(12000.00, 'Remera deportiva algodón', 1, 2, 1, 2, 1),
(9500.00, 'Short deportivo liviano', 1, 1, 1, 2, 2),
(8000.00, 'Musculosa running hombre', 1, 3, 1, 1, 3),
(11000.00, 'Pantalón deportivo frisa', 1, 2, 1, 2, 4),
(9000.00, 'Remera dry-fit entrenamiento', 1, 1, 1, 1, 1),
(9800.00, 'Camiseta fútbol oficial', 1, 2, 1, 1, 1),
(8700.00, 'Short de básquet', 1, 3, 1, 1, 2),
(10200.00, 'Remera manga larga running', 1, 1, 1, 2, 3),
(11500.00, 'Pantalón térmico entrenamiento', 1, 2, 1, 1, 4),
(9400.00, 'Musculosa dry-fit mujer', 1, 3, 1, 2, 1),
(10000.00, 'Remera entrenamiento manga corta', 1, 1, 1, 2, 2),
(10800.00, 'Pantalón deportivo slim', 1, 2, 1, 2, 3),
(9200.00, 'Short running mujer', 1, 3, 1, 2, 4),
(9700.00, 'Remera técnica compresión', 1, 1, 1, 1, 1),
(8900.00, 'Musculosa entrenamiento liviana', 1, 2, 1, 2, 2),
(11200.00, 'Pantalón deportivo clásico', 1, 3, 1, 2, 3),
(9500.00, 'Remera básica algodón', 1, 1, 1, 2, 4),
(8800.00, 'Short training con bolsillos', 1, 2, 1, 2, 1),
(10400.00, 'Remera dry-fit manga larga', 1, 3, 1, 1, 2),
(11800.00, 'Jogging deportivo liviano', 1, 1, 1, 2, 3);


-- Stock por talle 
INSERT INTO stock_talle (stock, talle_id, producto_id) VALUES
-- Producto 1: Remera deportiva algodón
(12, 1, 1),
(18, 2, 1),
(10, 3, 1),

-- Producto 2: Short deportivo liviano
(8, 1, 2),
(15, 2, 2),
(12, 3, 2),
(4, 4, 2),

-- Producto 3: Musculosa running hombre
(10, 1, 3),
(9, 3, 3),

-- Producto 4: Pantalón deportivo frisa
(6, 1, 4),
(10, 3, 4),

-- Producto 5: Remera dry-fit entrenamiento
(11, 1, 5),
(16, 2, 5),
(8, 4, 5),  

-- Producto 6: Camiseta fútbol oficial
(9, 1, 6),
(14, 2, 6),
(11, 3, 6),

-- Producto 7: Short de básquet
(12, 2, 7),
(2, 1, 7),  

-- Producto 8: Remera manga larga running
(10, 1, 8),
(15, 2, 8),
(12, 3, 8),

-- Producto 9: Pantalón térmico entrenamiento
(10, 2, 9),
(8, 3, 9),

-- Producto 10: Musculosa dry-fit mujer
(12, 1, 10),
(18, 2, 10),
(14, 3, 10),

-- Producto 11: Remera entrenamiento manga corta
(7, 2, 11),
(10, 3, 11),
(3, 4, 11), 

-- Producto 12: Pantalón deportivo slim
(6, 1, 12),
(12, 2, 12),
(9, 3, 12),

-- Producto 13: Short running mujer
(8, 1, 13),
(14, 2, 13),
(11, 3, 13),

-- Producto 14: Remera técnica compresión
(10, 1, 14),
(12, 3, 14),

-- Producto 15: Musculosa entrenamiento liviana
(9, 1, 15),
(13, 2, 15),
(10, 3, 15),

-- Producto 16: Pantalón deportivo clásico
(7, 1, 16),
(11, 2, 16),

-- Producto 17: Remera básica algodón
(12, 1, 17),
(14, 3, 17),

-- Producto 18: Short training con bolsillos
(8, 1, 18),
(13, 2, 18),
(10, 3, 18),

-- Producto 19: Remera dry-fit manga larga
(10, 1, 19),
(15, 2, 19),
(2, 4, 19), 

-- Producto 20: Jogging deportivo liviano
(6, 1, 20),
(10, 2, 20),
(8, 3, 20);

-- Estados de pago
INSERT INTO estado_pago (estado_pago_id, descripcion_estado_pago) VALUES
(1, 'Pendiente'),
(2, 'Pagado');

-- Domicilios de usuarios
INSERT INTO domicilio (altura, calle, ciudad_id) VALUES
(101, 'San Martín', 1),
(202, 'Belgrano', 2),
(303, 'Rivadavia', 3),
(404, 'Mitre', 4),
(505, 'Lavalle', 5),
(606, 'Catamarca', 6),
(707, 'Entre Ríos', 7),
(808, 'Corrientes', 8),
(909, 'Santa Fe', 9),
(1001, 'Urquiza', 10),
(1102, 'Salta', 11),
(1203, 'Tucumán', 12),
(1304, 'Jujuy', 1),
(1405, 'Formosa', 2);

-- Usuarios
INSERT INTO usuario (nombre_usuario, apellido_usuario, telefono, email, contrasena, perfil_id, domicilio_id) VALUES
('Juan', 'Pérez', '3794000000', 'juanperez@mail.com', 'clave123', 2, 5),
('Ana', 'Gómez', '3794111111', 'anagomez@mail.com', 'clave456', 1, 6),
('María', 'López', '3794222222', 'marialopez@mail.com', 'clave789', 2, 7),
('Carlos', 'Fernández', '3794333333', 'carlosfernandez@mail.com', 'clave321', 2, 8),
('Lucía', 'Martínez', '3794444444', 'luciamartinez@mail.com', 'clave654', 1, 9),
('Diego', 'Ramírez', '3794555555', 'diegoramirez@mail.com', 'clave987', 2, 10),
('Sofía', 'Alvarez', '3794666666', 'sofiaalvarez@mail.com', 'clave111', 2, 11),
('Martín', 'Domínguez', '3794777777', 'martindominguez@mail.com', 'clave222', 2, 12),
('Valeria', 'Suárez', '3794888888', 'valeriasuarez@mail.com', 'clave333', 1, 13),
('Fernando', 'García', '3794999999', 'fernandogarcia@mail.com', 'clave444', 2, 14),
('Paula', 'Méndez', '3795000000', 'paulamendez@mail.com', 'clave555', 2, 1),
('Ricardo', 'Torres', '3795111111', 'ricardotorres@mail.com', 'clave666', 2, 2),
('Camila', 'Rojas', '3795222222', 'camilarojas@mail.com', 'clave777', 2, 3),
('Andrés', 'Silva', '3795333333', 'andressilva@mail.com', 'clave888', 2, 4),
('Laura', 'Benítez', '3795444444', 'laurabenitez@mail.com', 'clave999', 2, 2),
('Jorge', 'Sosa', '3795555555', 'jorgesosa@mail.com', 'clave000', 2, 11),
('Marta', 'Acosta', '3795666666', 'martaacosta@mail.com', 'claveabc', 2, 4),
('Pedro', 'Luna', '3795777777', 'pedroluna@mail.com', 'clavexyz', 2, 5);


-- Ventas (38 ventas)
INSERT INTO venta (total, fecha, usuario_id, estado_pago_id) VALUES
(18000.00, '2025-11-01', 3, 1), 
(22000.00, '2025-11-02', 3, 2),  
(12500.00, '2025-11-03', 4, 1),  
(27500.00, '2025-11-04', 4, 2),  
(9500.00,  '2025-11-05', 6, 1),  
(30500.00, '2025-11-06', 14, 2),  
(14500.00, '2025-11-07', 6, 1),  
(19800.00, '2025-11-07', 10, 2),  
(16000.00, '2025-11-07', 7, 1),  
(21000.00, '2025-11-10', 7, 2),  
(13200.00, '2025-11-11', 8, 1),  
(27500.00, '2025-11-12', 8, 2), 
(16200.00, '2025-11-13', 1, 1),  
(19800.00, '2025-11-11', 6, 2),  
(17500.00, '2025-10-17', 7, 1),
(18500.00, '2025-10-17', 15, 1),  
(22000.00, '2025-10-17', 15, 2),
(14500.00, '2025-11-05', 16, 1),  
(27500.00, '2025-10-20', 16, 2),
(16000.00, '2025-10-20', 17, 1), 
(21000.00, '2025-10-19', 17, 2),
(13200.00, '2025-10-19', 18, 1), 
(27500.00, '2025-10-18', 18, 2),
(15000.00, '2025-10-21', 1, 1),   
(16800.00, '2025-10-22', 3, 2),   
(14200.00, '2025-10-22', 4, 1),   
(17500.00, '2025-10-24', 6, 2),   
(15800.00, '2025-10-24', 7, 1),   
(19200.00, '2025-10-26', 8, 2),   
(20500.00, '2025-10-27', 10, 1),  
(18700.00, '2025-10-27', 11, 2),  
(16300.00, '2025-10-29', 12, 1),  
(17800.00, '2025-10-30', 13, 2),  
(15400.00, '2025-10-30', 14, 1),  
(19900.00, '2025-10-30', 15, 2),  
(18500.00, '2025-11-01', 16, 1),  
(17200.00, '2025-11-02', 17, 2), 
(16000.00, '2025-11-03', 18, 1);  


-- Venta - método de pago
INSERT INTO venta_metodo_pago (venta_metodo_pago_id, metodo_pago_id, venta_id) VALUES
(1, 1, 1),   
(2, 2, 2),   
(3, 3, 3),   
(4, 1, 4),  
(5, 2, 5),  
(6, 4, 6),  
(7, 1, 7),   
(8, 2, 8),   
(9, 3, 9),   
(10, 4, 10), 
(11, 1, 11),
(12, 2, 12), 
(13, 3, 13), 
(14, 4, 14), 
(15, 1, 15),
(16, 1, 16), 
(17, 2, 17),  
(18, 3, 18),  
(19, 4, 19), 
(20, 1, 20),  
(21, 2, 21),  
(22, 3, 22),  
(23, 4, 23),
(24, 1, 24), 
(25, 2, 25),  
(26, 3, 26), 
(27, 4, 27), 
(28, 1, 28),
(29, 2, 29),  
(30, 3, 30), 
(31, 4, 31),  
(32, 1, 32),  
(33, 2, 33),  
(34, 3, 34),  
(35, 4, 35),  
(36, 1, 36),  
(37, 2, 37),  
(38, 3, 38);  

-- Detalle de ventas 
INSERT INTO detalle_venta (cantidad, precio_uni, talle_id, producto_id, venta_id) VALUES
(1, 15000.00, 1, 1, 1),
(2, 24000.00, 2, 2, 2),
(1, 9500.00, 3, 3, 3),
(1, 11000.00, 2, 4, 3),
(2, 18000.00, 1, 5, 4),
(1, 9500.00, 2, 6, 4),
(1, 8700.00, 3, 7, 5),
(2, 10200.00, 1, 8, 6),
(1, 11500.00, 2, 9, 6),
(1, 9400.00, 3, 10, 7),
(2, 10000.00, 1, 11, 8),
(3, 10800.00, 2, 12, 8),
(1, 9200.00, 3, 13, 9),
(2, 9700.00, 1, 14, 10),
(2, 8900.00, 2, 15, 10),
(1, 11200.00, 3, 16, 11),
(2, 9500.00, 1, 17, 12),
(1, 8800.00, 2, 18, 12),
(4, 10400.00, 3, 19, 13),
(2, 11800.00, 1, 20, 14),
(3, 12000.00, 2, 1, 15),
(1, 9500.00, 3, 2, 15),
(1, 12000.00, 2, 1, 16),
(2, 9500.00, 3, 2, 17),
(1, 8000.00, 1, 3, 18),
(3, 11000.00, 2, 4, 19),
(1, 9400.00, 3, 10, 20),
(2, 10000.00, 1, 11, 21),
(4, 10800.00, 2, 12, 22),
(2, 9200.00, 3, 13, 23),
(1, 12000.00, 2, 1, 24),
(2, 9500.00, 3, 2, 25),
(1, 8000.00, 1, 3, 26),
(2, 11000.00, 2, 4, 27),
(1, 9000.00, 1, 5, 28),
(2, 9800.00, 2, 6, 29),
(1, 8700.00, 3, 7, 30),
(2, 10200.00, 1, 8, 31),
(1, 11500.00, 2, 9, 32),
(2, 9400.00, 3, 10, 33),
(1, 10000.00, 1, 11, 34),
(2, 10800.00, 2, 12, 35),
(1, 9200.00, 3, 13, 36),
(2, 9700.00, 1, 14, 37),
(1, 8900.00, 2, 15, 38);

-- Conteo de registros en todas las tablas principales
SELECT COUNT(*) AS total_metodo_pago     FROM metodo_pago; --resultado esperado: 4 registros
SELECT COUNT(*) AS total_perfil          FROM perfil; --resultado esperado: 2 registros
SELECT COUNT(*) AS total_talle           FROM talle; --resultado esperado: 4 registros
SELECT COUNT(*) AS total_tipo            FROM tipo; --resultado esperado: 2 registros
SELECT COUNT(*) AS total_marca           FROM marca; --resultado esperado: 7 registros
SELECT COUNT(*) AS total_estado          FROM estado; --resultado esperado: 2 registros
SELECT COUNT(*) AS total_categoria       FROM categoria; --resultado esperado: 2 registros
SELECT COUNT(*) AS total_pais            FROM pais; --resultado esperado: 12 registros
SELECT COUNT(*) AS total_provincia       FROM provincia; --resultado esperado: 12 registros 
SELECT COUNT(*) AS total_ciudad          FROM ciudad; --resultado esperado: 12 registros
SELECT COUNT(*) AS total_domicilio       FROM domicilio; --resultado esperado: 18 registros
SELECT COUNT(*) AS total_proveedor       FROM proveedor; --resultado esperado: 4 registros
SELECT COUNT(*) AS total_producto        FROM producto; --resultado esperado: 20 registros
SELECT COUNT(*) AS total_stock_talle     FROM stock_talle; --resultado esperado: 54 registros
SELECT COUNT(*) AS total_estado_pago     FROM estado_pago;--resultado esperado: 2 registros
SELECT COUNT(*) AS total_usuario         FROM usuario; --resultado esperado: 18 registros
SELECT COUNT(*) AS total_venta           FROM venta; --resultado esperado: 38 registros
SELECT COUNT(*) AS total_venta_metodo    FROM venta_metodo_pago; --resultado esperado: 38 registros
SELECT COUNT(*) AS total_detalle_venta   FROM detalle_venta; --resultado esperado: 45 registros