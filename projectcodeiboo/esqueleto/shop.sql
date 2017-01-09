
DROP DATABASE IF EXISTS shop;

CREATE DATABASE shop 
DEFAULT CHARACTER SET utf8 COLLATE utf8_spanish_ci;

USE shop;

CREATE TABLE IF NOT EXISTS `e_transporte` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `codigo_pedido` int(11) NOT NULL,
  `empresa` varchar(64) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB;

CREATE TABLE IF NOT EXISTS `tipo_producto` (
 `id` int(11) NOT NULL AUTO_INCREMENT,
 `n_tipos` varchar(32) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB;

CREATE TABLE IF NOT EXISTS `proveedores` (
 `id` int(11) NOT NULL AUTO_INCREMENT,
 `nombre` varchar(32) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB;

CREATE TABLE IF NOT EXISTS `producto` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_tipo` int(11) NOT NULL,
  `id_proveedor` int(11) NOT NULL,
  `nombre` varchar(64) NOT NULL,
  `caracteristicas` varchar(256) NOT NULL,
  `color` varchar(16) NOT NULL,
  `precio` int(11) NOT NULL,
  `precio_proveedor` int(11) NOT NULL,
  `stock` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  FOREIGN KEY (id_tipo) REFERENCES tipo_producto (id) 
  ON DELETE RESTRICT ON UPDATE CASCADE,
  FOREIGN KEY (id_proveedor) REFERENCES proveedores (id) 
  ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB;

CREATE TABLE IF NOT EXISTS `usuarios` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(64) NOT NULL,
  `apellidos` varchar(64) NOT NULL,
  `telefono` int(16) NOT NULL,
  `fecha_nacimiento` date NOT NULL,
  `direccion` varchar(128) NOT NULL,
  `dni` varchar(10) NOT NULL,
  `email` varchar(128) NOT NULL,
  `user` varchar(16) NOT NULL,
  `password` varchar(32) NOT NULL,
  `ciudad` varchar(16) NOT NULL,
  `pais` varchar(16) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB;

CREATE TABLE IF NOT EXISTS `pedidos` (
  `codigo` int(11) NOT NULL AUTO_INCREMENT,
  `id_user` int(11) NOT NULL,
  `tipo_pago` varchar(16) NOT NULL,
  `fecha_compra` date NOT NULL,
  `fecha_envio` date NOT NULL,
  `fecha_entrega` date NOT NULL,
  `id_transporte` int(11) NOT NULL,
  PRIMARY KEY (`codigo`),
  FOREIGN KEY (id_user) REFERENCES usuarios (id) 
  ON DELETE RESTRICT ON UPDATE CASCADE,
  FOREIGN KEY (id_transporte) REFERENCES e_transporte (id) 
  ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB;

  CREATE TABLE IF NOT EXISTS `detalles_pedido` (
  `id_producto` int(11) NOT NULL ,
  `codigo_pedido` int(11) NOT NULL,
  `cantidad` int(11) NOT NULL,
  `descuento` int(11) NOT NULL,
  PRIMARY KEY (`id_producto`, `codigo_pedido`),
  FOREIGN KEY (id_producto) REFERENCES producto (id) 
  ON DELETE RESTRICT ON UPDATE CASCADE,
  FOREIGN KEY (codigo_pedido) REFERENCES pedidos (codigo) 
  ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB;