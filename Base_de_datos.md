/*
use master
go
-------------------
IF (select name from sys.databases where name ='proyecto') is not null  
    DROP DATABASE proyecto;
go
CREATE DATABASE proyecto;

go
USE proyecto;
go
*/
-------------------

CREATE TABLE metodo_pago
(
  metodo_pago_id INT NOT NULL,
  descripcion_metodo_pago VARCHAR(50) NOT NULL,
  PRIMARY KEY (metodo_pago_id),
  UNIQUE (descripcion_metodo_pago)
);

CREATE TABLE venta_metodo_pago
(
  venta_metodo_pago_id INT NOT NULL,
  metodo_pago_id INT NOT NULL,
  PRIMARY KEY (venta_metodo_pago_id),
  FOREIGN KEY (metodo_pago_id) REFERENCES metodo_pago(metodo_pago_id)
);

CREATE TABLE perfil
(
  perfil_id INT NOT NULL,
  tipo_perfil VARCHAR(50) NOT NULL,
  PRIMARY KEY (perfil_id)
);

CREATE TABLE talle
(
  talle_id INT NOT NULL,
  descripcion_talle VARCHAR(100) NOT NULL,
  PRIMARY KEY (talle_id),
  UNIQUE (descripcion_talle)
);

CREATE TABLE stock_talle
(
  stock_talle_id INT NOT NULL,
  stock INT NOT NULL,
  talle_id INT NOT NULL,
  PRIMARY KEY (stock_talle_id),
  FOREIGN KEY (talle_id) REFERENCES talle(talle_id)
);

CREATE TABLE tipo
(
  tipo_id INT NOT NULL,
  nombre_tipo INT NOT NULL,
  PRIMARY KEY (tipo_id),
  UNIQUE (nombre_tipo)
);

CREATE TABLE marca
(
  marca_id INT NOT NULL,
  nombre_marca VARCHAR(100) NOT NULL,
  PRIMARY KEY (marca_id),
  UNIQUE (nombre_marca)
);

CREATE TABLE estado
(
  estado_id INT NOT NULL,
  descripcion_estado INT NOT NULL,
  PRIMARY KEY (estado_id),
  UNIQUE (descripcion_estado)
);

CREATE TABLE categoria
(
  categoria_id INT NOT NULL,
  nombre_categoria VARCHAR(100) NOT NULL,
  PRIMARY KEY (categoria_id),
  UNIQUE (nombre_categoria)
);

CREATE TABLE pais
(
  pais_id INT NOT NULL,
  pais_nombre VARCHAR(100) NOT NULL,
  PRIMARY KEY (pais_id)
);

CREATE TABLE provincia
(
  provincia_id INT NOT NULL,
  provincia_nombre INT NOT NULL,
  pais_id INT NOT NULL,
  PRIMARY KEY (provincia_id),
  FOREIGN KEY (pais_id) REFERENCES pais(pais_id)
);

CREATE TABLE producto
(
  producto_id INT NOT NULL,
  precio_unitario FLOAT NOT NULL,
  descripcion VARCHAR(200) NOT NULL,
  tipo_id INT NOT NULL,
  marca_id INT NOT NULL,
  estado_id INT NOT NULL,
  categoria_id INT NOT NULL,
  PRIMARY KEY (producto_id),
  FOREIGN KEY (tipo_id) REFERENCES tipo(tipo_id),
  FOREIGN KEY (marca_id) REFERENCES marca(marca_id),
  FOREIGN KEY (estado_id) REFERENCES estado(estado_id),
  FOREIGN KEY (categoria_id) REFERENCES categoria(categoria_id)
);

CREATE TABLE ciudad
(
  ciudad_id INT NOT NULL,
  ciudad_nombre VARCHAR(100) NOT NULL,
  provincia_id INT NOT NULL,
  PRIMARY KEY (ciudad_id),
  FOREIGN KEY (provincia_id) REFERENCES provincia(provincia_id)
);

CREATE TABLE estado_pago
(
  estado_pago_id INT NOT NULL,
  descripcion_estado_pago VARCHAR(50) NOT NULL,
  PRIMARY KEY (estado_pago_id),
  UNIQUE (descripcion_estado_pago)
);

CREATE TABLE usuario
(
  usuario_id INT NOT NULL,
  nombre_usuario VARCHAR(50) NOT NULL,
  apellido_usuario VARCHAR(50) NOT NULL,
  telefono VARCHAR(20),
  email VARCHAR(50) NOT NULL,
  contraseña VARCHAR(20) NOT NULL,
  perfil_id INT NOT NULL,
  PRIMARY KEY (usuario_id),
  FOREIGN KEY (perfil_id) REFERENCES perfil(perfil_id),
  UNIQUE (telefono),
  UNIQUE (email),
  UNIQUE (contraseña)
);

CREATE TABLE venta
(
  venta_id INT NOT NULL,
  total FLOAT NOT NULL,
  fecha DATE NOT NULL,
  usuario_id INT NOT NULL,
  estado_pago_id INT NOT NULL,
  PRIMARY KEY (venta_id),
  FOREIGN KEY (usuario_id) REFERENCES usuario(usuario_id),
  FOREIGN KEY (estado_pago_id) REFERENCES estado_pago(estado_pago_id)
);

CREATE TABLE detalle_venta
(
  cantidad INT NOT NULL,
  subtotal FLOAT NOT NULL,
  producto_id INT NOT NULL,
  venta_id INT NOT NULL,
  PRIMARY KEY (producto_id, venta_id),
  FOREIGN KEY (producto_id) REFERENCES producto(producto_id),
  FOREIGN KEY (venta_id) REFERENCES venta(venta_id)
);

CREATE TABLE proveedor
(
  provedor_id INT NOT NULL,
  proveedor_nombre INT NOT NULL,
  ciudad_id INT NOT NULL,
  PRIMARY KEY (provedor_id),
  FOREIGN KEY (ciudad_id) REFERENCES ciudad(ciudad_id)
);
