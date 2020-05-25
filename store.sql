-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 25-05-2020 a las 15:36:03
-- Versión del servidor: 10.4.11-MariaDB
-- Versión de PHP: 7.2.29

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `store`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `administrador`
--

CREATE TABLE `administrador` (
  `ID` int(11) NOT NULL,
  `Nombres` varchar(150) NOT NULL,
  `Apellidos` varchar(150) NOT NULL,
  `Correo` varchar(150) NOT NULL,
  `Password` varchar(150) NOT NULL,
  `Foto` varchar(2000) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `administrador`
--

INSERT INTO `administrador` (`ID`, `Nombres`, `Apellidos`, `Correo`, `Password`, `Foto`) VALUES
(24, 'admin', 'admin', 'admin@admin', 'admin', '1590347211_1590037742_avatar5.png');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalleventa`
--

CREATE TABLE `detalleventa` (
  `ID` int(15) NOT NULL,
  `IDVENTA` int(15) NOT NULL,
  `IDPRODUCTO` int(15) NOT NULL,
  `PRECIOUNITARIO` decimal(20,2) NOT NULL,
  `CANTIDAD` int(15) NOT NULL,
  `VENDIDO` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `detalleventa`
--

INSERT INTO `detalleventa` (`ID`, `IDVENTA`, `IDPRODUCTO`, `PRECIOUNITARIO`, `CANTIDAD`, `VENDIDO`) VALUES
(136, 62, 1, '3000.00', 1, 1),
(140, 64, 24, '1000.00', 4, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `productos`
--

CREATE TABLE `productos` (
  `CodigoProd` int(11) NOT NULL,
  `NombreProd` varchar(255) NOT NULL,
  `Precio` decimal(20,0) NOT NULL,
  `Modelo` text NOT NULL,
  `Marca` varchar(255) NOT NULL,
  `Descripcion` text NOT NULL,
  `Imagen` varchar(300) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `productos`
--

INSERT INTO `productos` (`CodigoProd`, `NombreProd`, `Precio`, `Modelo`, `Marca`, `Descripcion`, `Imagen`) VALUES
(1, 'Video Camara', '3000', 'HMX-F90', 'Samsung', 'color negro, memoria de 32GB', '1590348860_1590002297_1588048345_Samsung-HMX-F90-video-camera-2.jpg'),
(24, 'Samsung Galaxy', '1000', 'Plus', 'Samsung', 'color negro, RAM de 8GB', '1590413441_1590002348_1588048439_galaxy-s7-edge_gallery_right_gold_s3.png'),
(29, 'Bocina inalambrica', '35', 'Omega DX10', 'Omega', '', '1588771095_es_WAM6500-ZF_001_Front_black.jpg'),
(31, 'Teclado', '15', 'X Tech', 'Tech', 'color negro', '1590413539_1590002591_1588771014_1588088653_318-3182180_teclado-png-transparent-png.png');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ventas`
--

CREATE TABLE `ventas` (
  `ID` int(11) NOT NULL,
  `ClaveTransacion` varchar(250) NOT NULL,
  `PaypalDatos` text NOT NULL,
  `Nombre` varchar(250) NOT NULL,
  `Fecha` datetime NOT NULL,
  `Correo` varchar(100) NOT NULL,
  `Cantidad` int(100) NOT NULL,
  `Total` decimal(60,0) NOT NULL,
  `status` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `ventas`
--

INSERT INTO `ventas` (`ID`, `ClaveTransacion`, `PaypalDatos`, `Nombre`, `Fecha`, `Correo`, `Cantidad`, `Total`, `status`) VALUES
(62, 'hp9fd2pqq4utsl3t7g3v0e3s4j', '{\"id\":\"PAYID-L2PYEGY4YV74949XR699321T\",\"intent\":\"sale\",\"state\":\"approved\",\"cart\":\"7WP63784P04867338\",\"payer\":{\"payment_method\":\"paypal\",\"status\":\"VERIFIED\",\"payer_info\":{\"email\":\"sb-lq8xh959292@personal.example.com\",\"first_name\":\"John\",\"last_name\":\"Doe\",\"payer_id\":\"3FQ3UKUS2XJ6L\",\"shipping_address\":{\"recipient_name\":\"John Doe\",\"line1\":\"Free Trade Zone\",\"city\":\"San Salvador\",\"state\":\"San Salvador\",\"postal_code\":\"1120\",\"country_code\":\"SV\"},\"phone\":\"5034612073\",\"country_code\":\"SV\"}},\"transactions\":[{\"amount\":{\"total\":\"3000.00\",\"currency\":\"USD\",\"details\":{\"subtotal\":\"3000.00\",\"shipping\":\"0.00\",\"insurance\":\"0.00\",\"handling_fee\":\"0.00\",\"shipping_discount\":\"0.00\"}},\"payee\":{\"merchant_id\":\"628HUGKVDMKJ6\",\"email\":\"sb-ga3n61050275@business.example.com\"},\"description\":\"Compra de productos a Techmology box:$3,000.00\",\"custom\":\"hp9fd2pqq4utsl3t7g3v0e3s4j#62\",\"soft_descriptor\":\"PAYPAL *JOHNDOESTES\",\"item_list\":{\"shipping_address\":{\"recipient_name\":\"John Doe\",\"line1\":\"Free Trade Zone\",\"city\":\"San Salvador\",\"state\":\"San Salvador\",\"postal_code\":\"1120\",\"country_code\":\"SV\"}},\"related_resources\":[{\"sale\":{\"id\":\"3PW379681C364381M\",\"state\":\"completed\",\"amount\":{\"total\":\"3000.00\",\"currency\":\"USD\",\"details\":{\"subtotal\":\"3000.00\",\"shipping\":\"0.00\",\"insurance\":\"0.00\",\"handling_fee\":\"0.00\",\"shipping_discount\":\"0.00\"}},\"payment_mode\":\"INSTANT_TRANSFER\",\"protection_eligibility\":\"ELIGIBLE\",\"protection_eligibility_type\":\"ITEM_NOT_RECEIVED_ELIGIBLE,UNAUTHORIZED_PAYMENT_ELIGIBLE\",\"transaction_fee\":{\"value\":\"162.30\",\"currency\":\"USD\"},\"parent_payment\":\"PAYID-L2PYEGY4YV74949XR699321T\",\"create_time\":\"2020-04-21T23:32:11Z\",\"update_time\":\"2020-04-21T23:32:11Z\",\"links\":[{\"href\":\"https://api.sandbox.paypal.com/v1/payments/sale/3PW379681C364381M\",\"rel\":\"self\",\"method\":\"GET\"},{\"href\":\"https://api.sandbox.paypal.com/v1/payments/sale/3PW379681C364381M/refund\",\"rel\":\"refund\",\"method\":\"POST\"},{\"href\":\"https://api.sandbox.paypal.com/v1/payments/payment/PAYID-L2PYEGY4YV74949XR699321T\",\"rel\":\"parent_payment\",\"method\":\"GET\"}],\"soft_descriptor\":\"PAYPAL *JOHNDOESTES\"}}]}],\"create_time\":\"2020-04-21T23:30:35Z\",\"update_time\":\"2020-04-21T23:32:11Z\",\"links\":[{\"href\":\"https://api.sandbox.paypal.com/v1/payments/payment/PAYID-L2PYEGY4YV74949XR699321T\",\"rel\":\"self\",\"method\":\"GET\"}]}', 'jose rivas', '2020-04-22 01:28:40', 'sb-lq8xh959292@personal.example.com', 0, '3000', 'Completo'),
(64, 'kca0pgah0edfhak6t6mskb3lld', '', 'José Miguel', '2020-05-12 07:20:18', 'jose@service', 4, '4000', 'pendiente');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `administrador`
--
ALTER TABLE `administrador`
  ADD PRIMARY KEY (`ID`);

--
-- Indices de la tabla `detalleventa`
--
ALTER TABLE `detalleventa`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `IDVENTA` (`IDVENTA`),
  ADD KEY `IDPRODUCTO` (`IDPRODUCTO`);

--
-- Indices de la tabla `productos`
--
ALTER TABLE `productos`
  ADD PRIMARY KEY (`CodigoProd`);

--
-- Indices de la tabla `ventas`
--
ALTER TABLE `ventas`
  ADD PRIMARY KEY (`ID`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `administrador`
--
ALTER TABLE `administrador`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT de la tabla `detalleventa`
--
ALTER TABLE `detalleventa`
  MODIFY `ID` int(15) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=141;

--
-- AUTO_INCREMENT de la tabla `productos`
--
ALTER TABLE `productos`
  MODIFY `CodigoProd` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- AUTO_INCREMENT de la tabla `ventas`
--
ALTER TABLE `ventas`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=65;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `detalleventa`
--
ALTER TABLE `detalleventa`
  ADD CONSTRAINT `detalleVenta_ibfk_1` FOREIGN KEY (`IDVENTA`) REFERENCES `ventas` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `detalleVenta_ibfk_2` FOREIGN KEY (`IDPRODUCTO`) REFERENCES `productos` (`CodigoProd`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
