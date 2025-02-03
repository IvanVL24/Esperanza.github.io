-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost:3306
-- Tiempo de generación: 27-09-2024 a las 00:53:38
-- Versión del servidor: 8.0.30
-- Versión de PHP: 8.3.8

START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `esperanza`
--
CREATE DATABASE IF NOT EXISTS `esperanza` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci;
USE esperanza;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `admin`
--

CREATE TABLE `admin` (
  `id` int NOT NULL,
  `usuario` varchar(30) COLLATE utf8mb4_spanish_ci NOT NULL,
  `password` varchar(120) COLLATE utf8mb4_spanish_ci NOT NULL,
  `nombre` varchar(100) COLLATE utf8mb4_spanish_ci NOT NULL,
  `email` varchar(50) COLLATE utf8mb4_spanish_ci NOT NULL,
  `token_password` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  `password_request` tinyint NOT NULL DEFAULT '0',
  `activo` tinyint NOT NULL,
  `fecha_alta` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

--
-- Volcado de datos para la tabla `admin`
--

INSERT INTO `admin` (`id`, `usuario`, `password`, `nombre`, `email`, `token_password`, `password_request`, `activo`, `fecha_alta`) VALUES
(1, 'admin', '$2y$10$63/ZN7qnmMbHMpHZIMBhSe0LCnI8Usz2cAU8rZggCjR2/KtiLQISa', 'Administrador', 'tucorreo@gmail.com', NULL, 0, 1, '2024-09-23 05:45:18'),
(2, 'admin', '$2y$10$vsg.ze/KQeDViXaYRTytW.s0rORmDgzNTYhYrmaST7bn5yvB2HeH.', 'Administrador', 'tucorreo@gmail.com', NULL, 0, 1, '2024-09-23 05:48:35'),
(3, 'admin', '$2y$10$K6fnJApmvu0wvSQhVA5eg.bM32SPOhQGE5q65A5bTLKLOKxB8YfRS', 'Administrador', 'tucorreo@gmail.com', NULL, 0, 1, '2024-09-23 05:48:40'),
(4, 'admin', '$2y$10$Yi04W4SWTtq9YFAW/p7Ot.R33FNcKkJmeKT7ftJnMwd1BnJuyatBm', 'Administrador', 'tucorreo@gmail.com', NULL, 0, 1, '2024-09-23 05:50:43'),
(5, 'admin', '$2y$10$IjcsTvENvY4hH/uzKg9MaOyVj2nrU73wQatR/4emYdzmxjjyB1DN2', 'Administrador', 'tucorreo@gmail.com', NULL, 0, 1, '2024-09-23 05:50:50'),
(6, 'admin', '$2y$10$rb5O2gCsC.Xh7JnPVSmutOd.GhwlDzm4.8Zai5UrpJV43uvbS1evm', 'Administrador', 'tucorreo@gmail.com', NULL, 0, 1, '2024-09-23 15:43:39'),
(7, 'admin', '$2y$10$YnM4A6d/HvI.h1o0WOwQH.mBs8tIdchLvLFB92E6oChxjzT8CThxa', 'Administrador', 'tucorreo@gmail.com', NULL, 0, 1, '2024-09-23 15:43:44');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categorias`
--

CREATE TABLE `categorias` (
  `id` int NOT NULL,
  `nombre` varchar(50) COLLATE utf8mb4_spanish_ci NOT NULL,
  `activo` tinyint NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

--
-- Volcado de datos para la tabla `categorias`
--

INSERT INTO `categorias` (`id`, `nombre`, `activo`) VALUES
(1, 'Pan Salado', 1),
(2, 'Pan Dulce', 1),
(3, 'Postres', 1),
(4, 'Gelatinas', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `compra`
--

CREATE TABLE `compra` (
  `id_compra` int NOT NULL,
  `id_transaccion` varchar(20) COLLATE utf8mb4_spanish_ci NOT NULL,
  `fecha` datetime NOT NULL,
  `status` varchar(20) COLLATE utf8mb4_spanish_ci NOT NULL,
  `email` varchar(50) COLLATE utf8mb4_spanish_ci NOT NULL,
  `nombre` varchar(50) COLLATE utf8mb4_spanish_ci NOT NULL,
  `total` decimal(10,2) NOT NULL,
  `medio_pago` varchar(20) COLLATE utf8mb4_spanish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

--
-- Volcado de datos para la tabla `compra`
--

INSERT INTO `compra` (`id_compra`, `id_transaccion`, `fecha`, `status`, `email`, `nombre`, `total`, `medio_pago`) VALUES
(1, 'ypqNidwxaqtxcDx', '2024-09-25 15:36:10', 'COMPLETADO', 'edson1999@live.com', 'Edson Cuello Galván', 41.00, 'TC'),
(2, 'EpP0aZWT4dHb2qB', '2024-09-25 18:39:17', 'COMPLETADO', 'cuelloedson5@gmail.com', 'Arnold Cuello Galván', 53.50, 'TC'),
(3, '4E5WqQc5x7Ya7rO', '2024-09-25 19:28:20', 'COMPLETADO', 'edson1999@live.com', 'Iván Valderrama Ledezma', 25.00, 'TD'),
(4, 'TcqztcOaG4ZsPy2', '2024-09-26 17:05:38', 'COMPLETADO', 'edson1999@live.com', 'Edson Cuello Galván', 887.00, 'Paypal');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalle_compra`
--

CREATE TABLE `detalle_compra` (
  `idetalle` int NOT NULL,
  `id_compra` int NOT NULL,
  `id` int NOT NULL,
  `nombre` varchar(100) COLLATE utf8mb4_spanish_ci NOT NULL,
  `id_categoria` int NOT NULL,
  `precio` decimal(10,2) NOT NULL,
  `cantidad` int NOT NULL,
  `subtotal` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

--
-- Volcado de datos para la tabla `detalle_compra`
--

INSERT INTO `detalle_compra` (`idetalle`, `id_compra`, `id`, `nombre`, `id_categoria`, `precio`, `cantidad`, `subtotal`) VALUES
(1, 1, 1, 'Dona Chocolate Doble', 2, 12.50, 1, 12.50),
(2, 1, 4, 'Dona Conejito Turin', 2, 28.50, 1, 28.50),
(3, 2, 3, 'Concha de Chocolate', 2, 13.50, 1, 13.50),
(4, 2, 2, 'Dona con chocolate', 2, 20.00, 2, 40.00),
(5, 3, 1, 'Dona Chocolate Doble', 2, 12.50, 2, 25.00),
(6, 4, 5, 'Pastel De Conejo Turin', 3, 380.00, 1, 380.00),
(7, 4, 4, 'Dona Conejito Turin', 2, 28.50, 2, 57.00),
(8, 4, 9, 'Pastel de 3 Leches con Frutos Rojos', 3, 450.00, 1, 450.00);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `productos`
--

CREATE TABLE `productos` (
  `id` int NOT NULL,
  `nombre` varchar(100) COLLATE utf8mb4_spanish_ci NOT NULL,
  `precio` decimal(10,2) NOT NULL,
  `descuento` tinyint NOT NULL DEFAULT '0',
  `descripcion` varchar(150) COLLATE utf8mb4_spanish_ci NOT NULL,
  `stock` int NOT NULL DEFAULT '0',
  `id_categoria` int NOT NULL,
  `activo` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

--
-- Volcado de datos para la tabla `productos`
--

INSERT INTO `productos` (`id`, `nombre`, `precio`, `descuento`, `descripcion`, `stock`, `id_categoria`, `activo`) VALUES
(1, 'Dona Chocolate Doble', 25.00, 50, 'Dona cubierta por completo de chocolate y chispas de chocolate', 7, 2, 1),
(2, 'Dona con chocolate', 20.00, 0, 'Dona con una pequeña cubierta de chocolate superior', 8, 2, 1),
(3, 'Concha de Chocolate', 15.00, 10, 'Concha sabor a chocolate con azucar', 9, 2, 1),
(4, 'Dona Conejito Turin', 30.00, 5, 'Dona de chocolate espolvoreada con conejito turin rayado y un conejito en medio', 16, 2, 1),
(5, 'Pastel De Conejo Turin', 380.00, 0, 'Patel hecho con capas de crepas bañado en chocolate decorado con conejitos', 4, 3, 1),
(6, 'Pastel M&M', 350.00, 0, 'Pastel de chocolate con relleno de M&M y decorado', 5, 3, 1),
(7, 'Pastel de 3 leches', 300.00, 0, 'Pastel de 3 leches con mermelada en la capa de en medio decorado con fresas', 5, 3, 1),
(8, 'Pastel \"Pancito Tour\" Conejo Turin', 380.00, 0, 'Sabor 3 leches con nutella por dentro con deliciosos conejos turin', 5, 3, 1),
(9, 'Pastel de 3 Leches con Frutos Rojos', 450.00, 0, 'Pastel de 3 leches con frutos rojos', 4, 3, 1),
(10, 'Pastel de Chocoflan con Cubierta de chocolate', 380.00, 0, 'Pastel de chocoflan con cubierta de chocolate', 5, 3, 1);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `categorias`
--
ALTER TABLE `categorias`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `compra`
--
ALTER TABLE `compra`
  ADD PRIMARY KEY (`id_compra`);

--
-- Indices de la tabla `detalle_compra`
--
ALTER TABLE `detalle_compra`
  ADD PRIMARY KEY (`idetalle`);

--
-- Indices de la tabla `productos`
--
ALTER TABLE `productos`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `admin`
--
ALTER TABLE `admin`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de la tabla `categorias`
--
ALTER TABLE `categorias`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `compra`
--
ALTER TABLE `compra`
  MODIFY `id_compra` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `detalle_compra`
--
ALTER TABLE `detalle_compra`
  MODIFY `idetalle` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de la tabla `productos`
--
ALTER TABLE `productos`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
