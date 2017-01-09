-- phpMyAdmin SQL Dump
-- version 4.6.3
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Jan 09, 2017 at 11:10 AM
-- Server version: 5.7.16-0ubuntu0.16.04.1
-- PHP Version: 7.0.8-0ubuntu0.16.04.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `shop`
--

-- --------------------------------------------------------

--
-- Table structure for table `detalles_pedido`
--

CREATE TABLE `detalles_pedido` (
  `id_producto` int(11) NOT NULL,
  `codigo_pedido` int(11) NOT NULL,
  `cantidad` int(11) NOT NULL,
  `descuento` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Dumping data for table `detalles_pedido`
--

INSERT INTO `detalles_pedido` (`id_producto`, `codigo_pedido`, `cantidad`, `descuento`) VALUES
(1, 1, 1, NULL),
(5, 1, 1, NULL),
(9, 1, 1, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `e_transporte`
--

CREATE TABLE `e_transporte` (
  `id` int(11) NOT NULL,
  `empresa` varchar(64) COLLATE utf8_spanish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Dumping data for table `e_transporte`
--

INSERT INTO `e_transporte` (`id`, `empresa`) VALUES
(1, 'DHL'),
(2, 'SEUR'),
(3, 'TNT'),
(4, 'MRW');

-- --------------------------------------------------------

--
-- Table structure for table `pedidos`
--

CREATE TABLE `pedidos` (
  `codigo` int(11) NOT NULL,
  `id_user` int(11) NOT NULL,
  `tipo_pago` varchar(16) COLLATE utf8_spanish_ci NOT NULL,
  `pagado` int(1) NOT NULL,
  `fecha_compra` date DEFAULT NULL,
  `fecha_envio` date DEFAULT NULL,
  `fecha_entrega` date DEFAULT NULL,
  `id_transporte` int(11) NOT NULL,
  `info_transporte` varchar(64) COLLATE utf8_spanish_ci DEFAULT NULL,
  `nom2` varchar(32) COLLATE utf8_spanish_ci DEFAULT NULL,
  `ape2` varchar(32) COLLATE utf8_spanish_ci DEFAULT NULL,
  `tel2` int(11) DEFAULT NULL,
  `dire2` varchar(256) COLLATE utf8_spanish_ci DEFAULT NULL,
  `ciu2` varchar(32) COLLATE utf8_spanish_ci DEFAULT NULL,
  `pai2` varchar(32) COLLATE utf8_spanish_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Dumping data for table `pedidos`
--

INSERT INTO `pedidos` (`codigo`, `id_user`, `tipo_pago`, `pagado`, `fecha_compra`, `fecha_envio`, `fecha_entrega`, `id_transporte`, `info_transporte`, `nom2`, `ape2`, `tel2`, `dire2`, `ciu2`, `pai2`) VALUES
(1, 1, 'tarjeta', 1, '2016-02-10', '2016-02-11', '2016-02-16', 1, 'DHL-32456-4345', NULL, NULL, NULL, NULL, NULL, NULL),
(2, 5, 'visa', 0, NULL, NULL, NULL, 1, NULL, '', '', 0, '', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `producto`
--

CREATE TABLE `producto` (
  `id` int(11) NOT NULL,
  `id_tipo` int(11) NOT NULL,
  `id_proveedor` int(11) NOT NULL,
  `nombre` varchar(64) COLLATE utf8_spanish_ci NOT NULL,
  `caracteristicas` varchar(256) COLLATE utf8_spanish_ci NOT NULL,
  `color` varchar(16) COLLATE utf8_spanish_ci NOT NULL,
  `precio` int(11) NOT NULL,
  `precio_proveedor` int(11) NOT NULL,
  `stock` int(11) NOT NULL,
  `imagen` varchar(32) COLLATE utf8_spanish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Dumping data for table `producto`
--

INSERT INTO `producto` (`id`, `id_tipo`, `id_proveedor`, `nombre`, `caracteristicas`, `color`, `precio`, `precio_proveedor`, `stock`, `imagen`) VALUES
(1, 1, 1, 'F-One Bandit IX 2016', 'Cometa todo terreno excelente para todas las disciplinas del kite y adaptada a cualquier nivel.  Mas de 8 años de mejoría año tras año la colocan como la cometa mas desarrollada del mercado.', 'verde', 769, 420, 10, 'fone-2016-bandit9-500x500.jpg'),
(2, 1, 2, 'North Dice 2016', 'Estamos ante la tercera generación de la, cada vez más popular, Dice, \n\n    que redefine el concepto de versatilidad y rendimiento.', 'rojo', 674, 200, 7, 'North-dice-2016-roja-500x500.jpg'),
(3, 1, 1, 'F-One Furtive 2017', 'En 2014, Alex Caizergues (recordman del mundo de velocidad) nos pidió unos \n\n    prototipos de cometas para batir su propio record de velocidad que era de 56,62 nudos. ', 'amarillo', 1170, 750, 0, 'FURTIVE-black-yellow-orange.jpg'),
(4, 1, 2, 'North Evo 2016', 'La Evo es la maestra de la polivalencia de todas las cometas de la gama de North Kiteboarding, garantizándote que el trabajo va a estar hecho! Hemos hecho algunas cosas diferentes,\n\n dotando a la máquina del freeride de cinco costillas en lugar de tres.', 'amarillo', 1099, 699, 4, 'north-evo-2016-verde-500x500.jpg'),
(5, 2, 1, 'F-One Acid HRD 2016 Lite Tech', 'Es lo último para todos los que buscan una tabla totalmente freestyle.\n\n Corta y ancha hasta las puntas, un pop extremo proporcionando una mayor altura en los recortes y un fabuloso aterrizaje. ', 'rojo', 435, 200, 8, 'acid-hrd-fone-2016-500x500.jpg'),
(6, 2, 1, 'F-One Acid HRD 2017 carbon', ' Su doble cóncavo suprimirá cualquier salpicadura y \n\n    absorberá las vibraciones en las recepciones más duras. ', 'negro', 717, 510, 0, 'ACID-HRD-Carbon-2017-500x500.jpg'),
(7, 2, 1, 'North Gambler 2016', ' La Gambler es nuestra tabla de Wakestyle para parques, la usan riders como Tom Court, \n    Craig Cunningham y además Colleen Carroll, que ha ganado en varias ocasiones el evento Triple S.', 'rojo', 525, 300, 10, 'north-gambler-2016-500x500.jpg'),
(8, 2, 3, 'Slingshot Karolina Pro 2017', 'Building on the popularity of last year’s Refraction Karolina model,\n\n this freestyle-focused board is designed with hard-charging, aggressive and powered-up female riders in mind.', 'azul', 569, 300, 4, 'karolina-2017-500x500.jpg'),
(9, 3, 3, 'Mystic Aviator 2016/17', 'El Mystic Aviator es un arnés de braguero clásico que ofrece gran confort y resistencia a muy buen precio. ', 'negro', 129, 80, 5, 'AVIATOR-500x500.jpg'),
(10, 3, 1, 'F-One Barra 2016', 'La barra de la colección 2016 se beneficia de la tecnología MONOLITH, ultimo diamante pulido del departamento de I&D de F-ONE.', 'azul-rojo', 449, 250, 12, 'monolit-barra-fone-2016.jpg'),
(11, 3, 2, 'Mystic MK8 Helmet', '- CE aprobado: CE EN 1385\n- Almohadillas ajustables.', 'azul', 45, 20, 6, 'mk8-yellow-500x500.jpg'),
(12, 3, 1, 'F-One Asa tabla 2016', 'Asa para tabla que se puede ajustar para usarla con separaciones de 20 a 21cm.\nTornillos incorporados en el asa.', 'azul', 15, 7, 20, 'asa-handle-190x190.jpg'),
(14, 4, 3, 'Mystic Crossfire 3/2 Shortarm', 'Traje pierna larga y manga corta, ideal para primavera o sitios donde el agua esta fría pero el clima es cálido.\n\nGrosor 3/2.', 'negro', 85, 44, 5, 'crossfire-shortarm-2012.jpg'),
(15, 4, 3, 'Mystic Crossfire shorthleg longarm 4/3', 'Tarje de neopreno  manga larga y pierna pirata cremallera trasera.\nGran elasticidad y calidad de acabados par sentirte cómodo en todas las sesiones,\n\nDisponible en un solo color.', 'negro-azul', 99, 44, 7, 'crossfire-shortleg.jpg'),
(16, 4, 3, 'Mystic Sup Long John 3/2', 'Mystic Sup Long John 3/2 ofrece máxima comodidad y confort. Para quien busca un traje largo sin mangas par la parctica del kite o SUP en verano durante horas sin pasar frío y con la libertad de movimientos.', 'negro', 49, 50, 8, 'long-john-mystic.jpg'),
(17, 4, 3, 'Mystic Star Longarm shorty 3/2', 'Tarje de neopreno  manga larga y pierna corta  L/S, cremallera trasera.\nGran elasticidad y calidad de acabados par sentirte cómodo en todas las sesiones,', 'negro', 70, 33, 12, 'STAR-LONGARM-SHORTY.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `proveedores`
--

CREATE TABLE `proveedores` (
  `id` int(11) NOT NULL,
  `nombre` varchar(32) COLLATE utf8_spanish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Dumping data for table `proveedores`
--

INSERT INTO `proveedores` (`id`, `nombre`) VALUES
(1, 'Frenlar'),
(2, 'DB-enio'),
(3, 'Seervice'),
(73, 'Abades'),
(99, 'Lar-post');

-- --------------------------------------------------------

--
-- Table structure for table `tipo_producto`
--

CREATE TABLE `tipo_producto` (
  `id` int(11) NOT NULL,
  `n_tipos` varchar(32) COLLATE utf8_spanish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Dumping data for table `tipo_producto`
--

INSERT INTO `tipo_producto` (`id`, `n_tipos`) VALUES
(1, 'Kites'),
(2, 'Tablas'),
(3, 'Accesorios'),
(4, 'Neoprenos'),
(5, 'Cursos');

-- --------------------------------------------------------

--
-- Table structure for table `usuarios`
--

CREATE TABLE `usuarios` (
  `id` int(11) NOT NULL,
  `nombre` varchar(64) COLLATE utf8_spanish_ci NOT NULL,
  `apellidos` varchar(64) COLLATE utf8_spanish_ci NOT NULL,
  `telefono` int(16) NOT NULL,
  `fecha_nacimiento` date NOT NULL,
  `direccion` varchar(128) COLLATE utf8_spanish_ci NOT NULL,
  `dni` varchar(10) COLLATE utf8_spanish_ci NOT NULL,
  `email` varchar(128) COLLATE utf8_spanish_ci NOT NULL,
  `user` varchar(16) COLLATE utf8_spanish_ci NOT NULL,
  `password` varchar(32) COLLATE utf8_spanish_ci NOT NULL,
  `ciudad` varchar(16) COLLATE utf8_spanish_ci NOT NULL,
  `pais` varchar(16) COLLATE utf8_spanish_ci NOT NULL,
  `privilegio` int(11) NOT NULL,
  `admin` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Dumping data for table `usuarios`
--

INSERT INTO `usuarios` (`id`, `nombre`, `apellidos`, `telefono`, `fecha_nacimiento`, `direccion`, `dni`, `email`, `user`, `password`, `ciudad`, `pais`, `privilegio`, `admin`) VALUES
(1, 'Juan', 'Pacheco Gonzalez', 937234581, '1980-06-05', 'c/palomares n 45 2º 4ª', '79322012J', 'juanpacheco@hotmail.com', 'juanete', '81dc9bdb52d04dc20036dbd8313ed055', 'Sabadell', 'España', 100, 0),
(2, 'Rafa', 'Sanchez Jimenez', 937654367, '1986-07-01', 'c/delafe n 32 1º 1ª', '32323045G', 'rafapela@hotmail.com', 'Rafio', '81dc9bdb52d04dc20036dbd8313ed055', 'Barcelona', 'España', 100, 0),
(3, 'Maria', 'Dolmen piriz', 934671209, '1992-10-23', 'c/gran via n 289 6º 1ª', '39100438T', 'mariaDB@hotmail.com', 'mariela', '81dc9bdb52d04dc20036dbd8313ed055', 'Vilafranca', 'España', 100, 0),
(5, 'David', 'Sánchez Devesa', 647933210, '2000-02-03', 'C/De las nieves', '23455632s', 'davidete@horing.com', 'davidin', '81dc9bdb52d04dc20036dbd8313ed055', 'sabadell', 'Espanya', 500, 1),
(6, 'sandra', 'perez López', 935778912, '2000-03-06', 'c/bud 1 3', '23677896-j', 'princesa@horoingo.com', 'sandra', '81dc9bdb52d04dc20036dbd8313ed055', 'sabadell', 'españa', 100, 0),
(7, 'davide', 'davide', 698755645, '0000-00-00', 'wffgfgfd', '47555985', 'sdgfsg@gotmal.com', 'davide', '81dc9bdb52d04dc20036dbd8313ed055', 'sggfds', 'dfgdfg', 100, 0),
(9, 'der', 'der', 145698789, '0000-00-00', 'egg', '45899654', 'ergg@df.com', 'der', '81dc9bdb52d04dc20036dbd8313ed055', 'egerge', 'egg', 100, 0),
(10, 'der', '', 0, '0000-00-00', '', '', '', '', '', '', '', 100, 0),
(11, 'fsfs', 'sdfsd', 45631, '0000-00-00', 'sdg', '45899658N', 'sdfsdf@sdgf.com', 'qwe', '81dc9bdb52d04dc20036dbd8313ed055', 'rewr', 'werew', 100, 0),
(12, 'wrwer', 'qwee', 5789654, '0000-00-00', 'fsfdsfds', '45698875N', 'dsfdsf@fdsf.com', 'werr', '81dc9bdb52d04dc20036dbd8313ed055', 'sfdsf', 'sdfdsf', 100, 0),
(13, 'qwe', 'qwee', 45698, '0000-00-00', 'qweqeqwe', '45899874D', 'sdfd@sfdf.com', 'dddd', '81dc9bdb52d04dc20036dbd8313ed055', 'dfdffs', 'sdfsdf', 100, 0),
(14, 'erwer', 'werwer', 456987, '0000-00-00', 'sdfdsfds', '45699874G', 'sdfdsf@hot.com', 'rrrr', '81dc9bdb52d04dc20036dbd8313ed055', 'sdgffsg', 'sfsdgf', 100, 0),
(15, 'qwer', 'qwer', 569875, '0000-00-00', 'qwe', '58999632D', 'qeqwe@sfdgfs.com', 'yyyy', '81dc9bdb52d04dc20036dbd8313ed055', 'sdfsf', 'sdfsdf', 100, 0),
(16, 'dssa', 'dsad', 564896, '0000-00-00', 'sgdsf', '45699874D', 'sff@sdf.com', 'jjjj', '81dc9bdb52d04dc20036dbd8313ed055', 'dfsdfs', 'sdfsdf', 100, 0);

-- --------------------------------------------------------

--
-- Stand-in structure for view `vist_prod`
-- (See below for the actual view)
--
CREATE TABLE `vist_prod` (
`id` int(11)
,`nombre` varchar(64)
,`caracteristicas` varchar(256)
,`color` varchar(16)
,`precio` int(11)
,`stock` int(11)
,`imagen` varchar(32)
,`n_tipos` varchar(32)
,`nom` varchar(32)
);

-- --------------------------------------------------------

--
-- Structure for view `vist_prod`
--
DROP TABLE IF EXISTS `vist_prod`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vist_prod`  AS  select `p`.`id` AS `id`,`p`.`nombre` AS `nombre`,`p`.`caracteristicas` AS `caracteristicas`,`p`.`color` AS `color`,`p`.`precio` AS `precio`,`p`.`stock` AS `stock`,`p`.`imagen` AS `imagen`,`t`.`n_tipos` AS `n_tipos`,`pv`.`nombre` AS `nom` from (`proveedores` `pv` left join (`tipo_producto` `t` left join `producto` `p` on((`p`.`id_tipo` = `t`.`id`))) on((`p`.`id_proveedor` = `pv`.`id`))) ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `detalles_pedido`
--
ALTER TABLE `detalles_pedido`
  ADD PRIMARY KEY (`id_producto`,`codigo_pedido`),
  ADD KEY `codigo_pedido` (`codigo_pedido`);

--
-- Indexes for table `e_transporte`
--
ALTER TABLE `e_transporte`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pedidos`
--
ALTER TABLE `pedidos`
  ADD PRIMARY KEY (`codigo`),
  ADD KEY `id_user` (`id_user`),
  ADD KEY `id_transporte` (`id_transporte`);

--
-- Indexes for table `producto`
--
ALTER TABLE `producto`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_tipo` (`id_tipo`),
  ADD KEY `id_proveedor` (`id_proveedor`);

--
-- Indexes for table `proveedores`
--
ALTER TABLE `proveedores`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tipo_producto`
--
ALTER TABLE `tipo_producto`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `user` (`user`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `e_transporte`
--
ALTER TABLE `e_transporte`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `pedidos`
--
ALTER TABLE `pedidos`
  MODIFY `codigo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `producto`
--
ALTER TABLE `producto`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;
--
-- AUTO_INCREMENT for table `proveedores`
--
ALTER TABLE `proveedores`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=100;
--
-- AUTO_INCREMENT for table `tipo_producto`
--
ALTER TABLE `tipo_producto`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `detalles_pedido`
--
ALTER TABLE `detalles_pedido`
  ADD CONSTRAINT `detalles_pedido_ibfk_1` FOREIGN KEY (`id_producto`) REFERENCES `producto` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `detalles_pedido_ibfk_2` FOREIGN KEY (`codigo_pedido`) REFERENCES `pedidos` (`codigo`) ON UPDATE CASCADE;

--
-- Constraints for table `pedidos`
--
ALTER TABLE `pedidos`
  ADD CONSTRAINT `pedidos_ibfk_1` FOREIGN KEY (`id_user`) REFERENCES `usuarios` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `pedidos_ibfk_2` FOREIGN KEY (`id_transporte`) REFERENCES `e_transporte` (`id`) ON UPDATE CASCADE;

--
-- Constraints for table `producto`
--
ALTER TABLE `producto`
  ADD CONSTRAINT `producto_ibfk_1` FOREIGN KEY (`id_tipo`) REFERENCES `tipo_producto` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `producto_ibfk_2` FOREIGN KEY (`id_proveedor`) REFERENCES `proveedores` (`id`) ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
