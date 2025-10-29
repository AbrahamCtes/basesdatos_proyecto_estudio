USE Proyecto_db;

CREATE TABLE metodo_pago
(
  metodo_pago_id INT NOT NULL,
  descripcion_metodo_pago VARCHAR(50) NOT NULL,
  CONSTRAINT PK_metodo_pago PRIMARY KEY (metodo_pago_id),
  CONSTRAINT UQ_metodo_pago_descripcion_metodo_pago UNIQUE (descripcion_metodo_pago)
);

CREATE TABLE perfil
(
  perfil_id INT NOT NULL,
  tipo_perfil VARCHAR(50) NOT NULL,
  CONSTRAINT PK_perfil PRIMARY KEY (perfil_id)
);

CREATE TABLE talle
(
  talle_id INT NOT NULL,
  descripcion_talle VARCHAR(100) NOT NULL,
  CONSTRAINT PK_talle PRIMARY KEY (talle_id),
  CONSTRAINT UQ_talle_descripcion_talle UNIQUE (descripcion_talle)
);

CREATE TABLE tipo 
(
  tipo_id INT NOT NULL,
  nombre_tipo VARCHAR(100) NOT NULL,
  CONSTRAINT PK_tipo PRIMARY KEY (tipo_id),
  CONSTRAINT UQ_tipo_nombre_tipo UNIQUE (nombre_tipo)
);



CREATE TABLE marca
(
  marca_id INT IDENTITY,
  nombre_marca VARCHAR(100) NOT NULL,
  CONSTRAINT PK_marca PRIMARY KEY (marca_id),
  CONSTRAINT UQ_marca_nombre_marca UNIQUE (nombre_marca)
);

CREATE TABLE estado 
(
  estado_id INT NOT NULL,
  descripcion_estado VARCHAR(100) NOT NULL,
  CONSTRAINT PK_estado PRIMARY KEY (estado_id),
  CONSTRAINT UQ_estado_descripcion_estado UNIQUE (descripcion_estado)
);


CREATE TABLE categoria
(
  categoria_id INT NOT NULL,
  nombre_categoria VARCHAR(100) NOT NULL,
  CONSTRAINT PK_categoria PRIMARY KEY (categoria_id),
  CONSTRAINT UQ_categoria_nombre_categoria UNIQUE (nombre_categoria)
);

CREATE TABLE pais
(
  pais_id INT IDENTITY,
  pais_nombre VARCHAR(100) NOT NULL,
  CONSTRAINT PK_pais PRIMARY KEY (pais_id)
);

CREATE TABLE provincia 
(
  provincia_id INT IDENTITY,
  provincia_nombre VARCHAR(100) NOT NULL,
  pais_id INT NOT NULL,
  CONSTRAINT PK_provincia PRIMARY KEY (provincia_id),
  CONSTRAINT FK_provincia_pais FOREIGN KEY (pais_id) REFERENCES pais(pais_id)
);


CREATE TABLE ciudad
(
  ciudad_id INT IDENTITY,
  ciudad_nombre VARCHAR(100) NOT NULL,
  provincia_id INT NOT NULL,
  CONSTRAINT PK_ciudad PRIMARY KEY (ciudad_id),
  CONSTRAINT FK_ciudad_provincia FOREIGN KEY (provincia_id) REFERENCES provincia(provincia_id)
);

CREATE TABLE proveedor 
(
  provedor_id INT IDENTITY,
  proveedor_nombre VARCHAR(100) NOT NULL,
  ciudad_id INT NOT NULL,
  CONSTRAINT PK_provedor PRIMARY KEY (provedor_id),
  CONSTRAINT FK_proveedor_ciudad FOREIGN KEY (ciudad_id) REFERENCES ciudad(ciudad_id)
);


CREATE TABLE producto 
(
  producto_id INT IDENTITY,
  precio_unitario FLOAT NOT NULL,
  descripcion VARCHAR(200) NOT NULL,
  tipo_id INT NOT NULL,
  marca_id INT NOT NULL,
  estado_id INT NOT NULL,
  categoria_id INT NOT NULL,
  provedor_id INT NOT NULL,
  CONSTRAINT PK_producto PRIMARY KEY (producto_id),
  CONSTRAINT FK_producto_tipo FOREIGN KEY (tipo_id) REFERENCES tipo(tipo_id),
  CONSTRAINT FK_producto_marca FOREIGN KEY (marca_id) REFERENCES marca(marca_id),
  CONSTRAINT FK_producto_estado FOREIGN KEY (estado_id) REFERENCES estado(estado_id),
  CONSTRAINT FK_producto_categoria FOREIGN KEY (categoria_id) REFERENCES categoria(categoria_id),
  CONSTRAINT FK_producto_provedor FOREIGN KEY (provedor_id) REFERENCES proveedor(provedor_id)
);

CREATE TABLE stock_talle
(
  stock INT NOT NULL,
  talle_id INT NOT NULL,
  producto_id int NOT NULL,
  CONSTRAINT PK_stock_talle PRIMARY KEY (producto_id, talle_id),
  CONSTRAINT FK_stock_talle_talle FOREIGN KEY (talle_id) REFERENCES talle(talle_id),
  CONSTRAINT FK_stock_talle_producto FOREIGN KEY (producto_id) REFERENCES producto(producto_id)
);

CREATE TABLE estado_pago
(
  estado_pago_id INT NOT NULL,
  descripcion_estado_pago VARCHAR(50) NOT NULL,
  CONSTRAINT PK_estado_pago PRIMARY KEY (estado_pago_id),
  CONSTRAINT UQ_estado_pago_descripcion_estado_pago UNIQUE (descripcion_estado_pago)
);

CREATE TABLE usuario
(
  usuario_id INT IDENTITY,
  nombre_usuario VARCHAR(50) NOT NULL,
  apellido_usuario VARCHAR(50) NOT NULL,
  telefono VARCHAR(20),
  email VARCHAR(50) NULL,
  contraseña VARCHAR(20) NOT NULL,
  perfil_id INT NOT NULL,
  CONSTRAINT PK_usuario PRIMARY KEY (usuario_id),
  CONSTRAINT FK_usuario_perfil FOREIGN KEY (perfil_id) REFERENCES perfil(perfil_id),
  CONSTRAINT UQ_usuario_telefono UNIQUE (telefono),
  CONSTRAINT UQ_usuario_email UNIQUE (email),
  CONSTRAINT UQ_usuario_contaseña UNIQUE (contraseña)
);

CREATE TABLE venta
(
  venta_id INT IDENTITY,
  total FLOAT NOT NULL,
  fecha DATE NOT NULL,
  usuario_id INT NOT NULL,
  estado_pago_id INT NOT NULL,
  CONSTRAINT PK_venta PRIMARY KEY (venta_id),
  CONSTRAINT FK_venta_usuario FOREIGN KEY (usuario_id) REFERENCES usuario(usuario_id),
  CONSTRAINT FK_venta_estado_pago FOREIGN KEY (estado_pago_id) REFERENCES estado_pago(estado_pago_id)
);

CREATE TABLE venta_metodo_pago
(
  venta_metodo_pago_id INT NOT NULL,
  metodo_pago_id INT NOT NULL,
  venta_id INT NOT NULL,
  CONSTRAINT PK_venta_metodo_pago PRIMARY KEY (venta_metodo_pago_id),
  CONSTRAINT FK_venta_metodo_pago_metodo_pago FOREIGN KEY (metodo_pago_id) REFERENCES metodo_pago(metodo_pago_id),
  CONSTRAINT FK_venta_metodo_pago_venta FOREIGN KEY (venta_id) REFERENCES venta(venta_id)
);

CREATE TABLE detalle_venta
(
  cantidad INT NOT NULL,
  subtotal FLOAT NOT NULL,
  producto_id INT NOT NULL,
  venta_id INT NOT NULL,
  CONSTRAINT PK_detalle_venta PRIMARY KEY (producto_id, venta_id),
  CONSTRAINT FK_detalle_venta_producto FOREIGN KEY (producto_id) REFERENCES producto(producto_id),
  CONSTRAINT FK_detalle_venta_venta FOREIGN KEY (venta_id) REFERENCES venta(venta_id)
);
-- Restricciones --

--Establece un valor default en la fecha de venta
ALTER TABLE venta
ADD CONSTRAINT DF_venta_fecha DEFAULT GETDATE() FOR fecha;

--Verifica que el precio del producto no sea negativo
ALTER TABLE producto
ADD CONSTRAINT CHK_producto_precio_unitario CHECK (precio_unitario >= 0);

--Verifica que el stock del producto no sea negativo
ALTER TABLE stock_talle
ADD CONSTRAINT CHK_stock_talle_stock CHECK (stock >= 0);

--Verifica que la cantidad de productos no sea negativo
ALTER TABLE detalle_venta
ADD CONSTRAINT CHK_detalle_venta_cantidad CHECK (cantidad > 0);

--Verifica que el subtotal del detalle_venta no sea negativo
ALTER TABLE detalle_venta
ADD CONSTRAINT CHK_detalle_venta_subtotal CHECK (subtotal >= 0);

--Verifica que el total de la venta no sea negativo
ALTER TABLE venta
ADD CONSTRAINT CHK_venta_total CHECK (total >= 0);

--Verifica que el nombre del usuario no sea una cadena de caracteres vacia
ALTER TABLE usuario
ADD CONSTRAINT CHK_usuario_nombre_usuario CHECK (nombre_usuario <> '');

--Verifica que el apellido del usuario no sea una cadena de caracteres vacia
ALTER TABLE usuario
ADD CONSTRAINT CHK_usuario_apellido_usuario CHECK (apellido_usuario <> '');

--Verifica que la contraseña del usuario no sea una cadena de caracteres vacia
ALTER TABLE usuario
ADD CONSTRAINT CHK_usuario_contraseña CHECK (contraseña <> '');

--Verifica que la marca no sea una cadena de caracteres vacia
ALTER TABLE marca
ADD CONSTRAINT CHK_marca_nombre_marca CHECK (nombre_marca <> '');

--Verifica que el nombre de categoria no sea una cadena de caracteres vacia
ALTER TABLE categoria
ADD CONSTRAINT CHK_categoria_nombre_categoria CHECK (nombre_categoria <> '');

--Verifica que la descripcion de estado no sea una cadena de caracteres vacia
ALTER TABLE estado
ADD CONSTRAINT CHK_estado_descripcion_estado CHECK (descripcion_estado <> '');

--Verifica que el nombre del proveedor no sea una cadena de caracteres vacia
ALTER TABLE proveedor
ADD CONSTRAINT CHK_proveedor_proveedor_nombre CHECK (proveedor_nombre <> '');

--Verifica que el nombre de la ciudad no sea una cadena de caracteres vacia
ALTER TABLE ciudad
ADD CONSTRAINT CHK_ciudad_ciudad_nombre CHECK (ciudad_nombre <> '');

--Verifica que el nombre de la provincia no sea una cadena de caracteres vacia
ALTER TABLE provincia
ADD CONSTRAINT CHK_provincia_provincia_nombre CHECK (provincia_nombre <> '');

--Verifica que el nombre del pais no sea una cadena de caracteres vacia
ALTER TABLE pais
ADD CONSTRAINT CHK_pais_pais_nombre CHECK (pais_nombre <> '');
