-- phpMyAdmin SQL Dump
-- version 4.0.4
-- http://www.phpmyadmin.net
--
-- Servidor: localhost
-- Tiempo de generación: 15-11-2013 a las 03:30:24
-- Versión del servidor: 5.6.12-log
-- Versión de PHP: 5.4.16

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de datos: `restaurant`
--
CREATE DATABASE IF NOT EXISTS `restaurant` DEFAULT CHARACTER SET latin1 COLLATE latin1_spanish_ci;
USE `restaurant`;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `menu`
--

CREATE TABLE IF NOT EXISTS `menu` (
  `cod_menu` int(8) NOT NULL AUTO_INCREMENT,
  `fecha_inicio` date NOT NULL,
  `fecha_fin` date DEFAULT NULL,
  `estado` tinyint(1) NOT NULL,
  PRIMARY KEY (`cod_menu`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `menu_dia`
--

CREATE TABLE IF NOT EXISTS `menu_dia` (
  `cod_menu_dia` int(8) NOT NULL AUTO_INCREMENT,
  `dia` varchar(12) COLLATE latin1_spanish_ci NOT NULL,
  `fecha_inicio` date NOT NULL,
  `fecha_fin` date DEFAULT NULL,
  `estado` tinyint(1) NOT NULL,
  PRIMARY KEY (`cod_menu_dia`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `orden`
--

CREATE TABLE IF NOT EXISTS `orden` (
  `cod_orden` bigint(20) NOT NULL AUTO_INCREMENT,
  `num_mesa` int(2) NOT NULL,
  `estado` tinyint(1) NOT NULL,
  PRIMARY KEY (`cod_orden`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `orden_producto`
--

CREATE TABLE IF NOT EXISTS `orden_producto` (
  `cod_orden_producto` bigint(20) NOT NULL AUTO_INCREMENT,
  `cod_orden` bigint(20) NOT NULL,
  `cod_producto` varchar(8) COLLATE latin1_spanish_ci NOT NULL,
  `cantidad` int(2) NOT NULL,
  PRIMARY KEY (`cod_orden_producto`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pedido`
--

CREATE TABLE IF NOT EXISTS `pedido` (
  `cod_pedido` bigint(20) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(40) COLLATE latin1_spanish_ci NOT NULL,
  `nit` bigint(12) NOT NULL,
  `direccion` varchar(50) COLLATE latin1_spanish_ci NOT NULL,
  `telefono` bigint(12) NOT NULL,
  `estado` tinyint(1) NOT NULL,
  PRIMARY KEY (`cod_pedido`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pedido_producto`
--

CREATE TABLE IF NOT EXISTS `pedido_producto` (
  `cod_penido_producto` bigint(20) NOT NULL AUTO_INCREMENT,
  `cod_pedido` bigint(20) NOT NULL,
  `cod_producto` varchar(8) COLLATE latin1_spanish_ci NOT NULL,
  `cantidad` int(2) NOT NULL,
  PRIMARY KEY (`cod_penido_producto`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pensionados`
--

CREATE TABLE IF NOT EXISTS `pensionados` (
  `cod_pensionado` int(8) NOT NULL AUTO_INCREMENT,
  `ci` int(12) NOT NULL,
  `nombre` varchar(40) COLLATE latin1_spanish_ci NOT NULL,
  `direccion` varchar(60) COLLATE latin1_spanish_ci NOT NULL,
  `telefono` bigint(12) NOT NULL,
  `estado` tinyint(1) NOT NULL,
  PRIMARY KEY (`cod_pensionado`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `producto`
--

CREATE TABLE IF NOT EXISTS `producto` (
  `cod_producto` varchar(8) COLLATE latin1_spanish_ci NOT NULL,
  `nombre` varchar(30) COLLATE latin1_spanish_ci NOT NULL,
  `tipo` int(1) NOT NULL,
  `precio` float NOT NULL,
  `estado` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `producto_menu`
--

CREATE TABLE IF NOT EXISTS `producto_menu` (
  `cod_producto_menu` int(8) NOT NULL AUTO_INCREMENT,
  `cod_menu` int(8) NOT NULL,
  `cod_producto` varchar(8) COLLATE latin1_spanish_ci NOT NULL,
  PRIMARY KEY (`cod_producto_menu`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `producto_menu_dia`
--

CREATE TABLE IF NOT EXISTS `producto_menu_dia` (
  `cod_producto_menu_dia` int(8) NOT NULL AUTO_INCREMENT,
  `cod_menu_dia` int(8) NOT NULL,
  `cod_producto` varchar(8) COLLATE latin1_spanish_ci NOT NULL,
  PRIMARY KEY (`cod_producto_menu_dia`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE IF NOT EXISTS `usuarios` (
  `login` varchar(12) COLLATE latin1_spanish_ci NOT NULL,
  `password` varchar(8) COLLATE latin1_spanish_ci NOT NULL,
  `ci` bigint(12) NOT NULL,
  `nombre` varchar(40) COLLATE latin1_spanish_ci NOT NULL,
  `correo` varchar(30) COLLATE latin1_spanish_ci NOT NULL,
  `rol` int(1) NOT NULL,
  `estado` tinyint(1) NOT NULL,
  PRIMARY KEY (`login`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
