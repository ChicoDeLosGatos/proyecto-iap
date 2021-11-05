-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost:8889
-- Temps de generació: 09-10-2021 a les 02:11:14
-- Versió del servidor: 5.7.34
-- Versió de PHP: 7.4.21

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de dades: `GGAEBD`
--
CREATE DATABASE IF NOT EXISTS `GGAEBD` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `GGAEBD`;


-- --------------------------------------------------------

--
-- Estructura de la taula `actos_evaluacion`
--

CREATE TABLE `actos_evaluacion` (
  `id` varchar(25) NOT NULL,
  `nombre` varchar(25) NOT NULL,
  `descripcion` text,
  `fecha_entrega` date DEFAULT NULL,
  `asignatura` varchar(8) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Bolcament de dades per a la taula `actos_evaluacion`
--

INSERT INTO `actos_evaluacion` (`id`, `nombre`, `descripcion`, `fecha_entrega`, `asignatura`) VALUES
('DCU.2021.ACTO.ANALISIS', 'Análisis de necesidades', 'Entregadle con el estudio cualitativo, la Persona y los escenarios', '2021-10-09', 'DCU.2021'),
('DCU.2021.ACTO.P3', 'Práctica 3', 'Acto de evaluación correspondiente a los ejercicios de la práctica 3', '2022-01-12', 'DEW.2021'),
('DCU.2021.ACTO.REST', 'Consumo REST', 'Extensión del prototipo Web para inyectar datos de un servicio REST', '2021-10-21', 'DCU.2021'),
('DCU.2021.ACTO.TEST', 'Test escrito', 'Prueba escrita de la asignatura', '2022-01-23', 'DCU.2021'),
('DCU.2021.ACTO.WEB', 'Prototipo Web', 'Entregable con el diseño web responsive de la aplicación del caso de estudio', '2022-01-15', 'DCU.2021'),
('DEW.2021.ACTO.EX', 'Examen', 'Prueba escrita de la asignatura', '2022-01-27', 'DEW.2021'),
('DEW.2021.ACTO.P1', 'Práctica 1', 'Acto de evaluación correspondiente a los ejercicios de la práctica 1', '2021-11-09', 'DEW.2021'),
('DEW.2021.ACTO.P2', 'Práctica 2', 'Acto de evaluación correspondiente a los ejercicios de la práctica 2', '2021-12-19', 'DEW.2021'),
('IAP.2021.ACTO.E1', 'Entregable 1', 'Proyecto Mule ESB con la integración De Fuentes de datos', '2021-11-12', 'IAP.2021'),
('IAP.2021.ACTO.E2', 'Entregable 2', 'Servicio REST implementado en Mule ESB', '2021-12-17', 'IAP.2021'),
('IAP.2021.ACTO.E3', 'Entregable 3', 'Desarrollo solución de integración con colas', '2022-01-21', 'IAP.2021'),
('IAP.2021.ACTO.TEST', 'Test escrito', 'Prueba escrita de la asignatura', '2022-01-25', 'IAP.2021');

-- --------------------------------------------------------

--
-- Estructura de la taula `alumnos`
--

CREATE TABLE `alumnos` (
  `dni` varchar(10) NOT NULL,
  `nombre` varchar(512) NOT NULL,
  `apellidos` varchar(512) NOT NULL,
  `email` varchar(40) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de la taula `alumnos_asignaturas`
--

CREATE TABLE `alumnos_asignaturas` (
  `alumno` varchar(10) NOT NULL,
  `asignatura` varchar(8) NOT NULL,
  `nota` float DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de la taula `alumnos_grupos`
--

CREATE TABLE `alumnos_grupos` (
  `id` int(11) NOT NULL,
  `alumno` varchar(10) NOT NULL,
  `grupo` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de la taula `asignaturas`
--

CREATE TABLE `asignaturas` (
  `id_asig` varchar(8) NOT NULL,
  `acronimo` varchar(3) NOT NULL,
  `anyo` int(11) NOT NULL,
  `nombre` varchar(512) NOT NULL,
  `curso` int(11) NOT NULL,
  `cuatrimestre` varchar(1) NOT NULL,
  `creditos` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Bolcament de dades per a la taula `asignaturas`
--

INSERT INTO `asignaturas` (`id_asig`, `acronimo`, `anyo`, `nombre`, `curso`, `cuatrimestre`, `creditos`) VALUES
('DCU.2020', 'DCU', 2020, 'Desarrollo Centrado en el Usuario', 4, 'A', 5),
('DCU.2021', 'DCU', 2021, 'Desarrollo Centrado en el Usuario', 4, 'A', 5),
('DEW.2020', 'DEW', 2020, 'Desarrollo Web', 3, 'B', 5),
('DEW.2021', 'DEW', 2021, 'Desarrollo Web', 3, 'B', 5),
('IAP.2020', 'IAP', 2020, 'Integración de Aplicaciones', 4, 'A', 5),
('IAP.2021', 'IAP', 2021, 'Integración de Aplicaciones', 4, 'A', 5);

-- --------------------------------------------------------

--
-- Estructura de la taula `entregas`
--

CREATE TABLE `entregas` (
  `id` int(11) NOT NULL,
  `grupo` int(11) NOT NULL,
  `acto_ev` varchar(25) NOT NULL,
  `a_tiempo` tinyint(1) NOT NULL DEFAULT '1',
  `nota` float DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de la taula `grupos`
--

CREATE TABLE `grupos` (
  `id` int(11) NOT NULL,
  `asignatura` varchar(8) NOT NULL,
  `activo` tinyint(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Índexs per a les taules bolcades
--

--
-- Índexs per a la taula `actos_evaluacion`
--
ALTER TABLE `actos_evaluacion`
  ADD PRIMARY KEY (`id`);

--
-- Índexs per a la taula `alumnos`
--
ALTER TABLE `alumnos`
  ADD PRIMARY KEY (`dni`);

--
-- Índexs per a la taula `alumnos_asignaturas`
--
ALTER TABLE `alumnos_asignaturas`
  ADD PRIMARY KEY (`alumno`,`asignatura`);

--
-- Índexs per a la taula `alumnos_grupos`
--
ALTER TABLE `alumnos_grupos`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `alumno` (`alumno`,`grupo`);

--
-- Índexs per a la taula `asignaturas`
--
ALTER TABLE `asignaturas`
  ADD PRIMARY KEY (`id_asig`);

--
-- Índexs per a la taula `entregas`
--
ALTER TABLE `entregas`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `grupo` (`grupo`,`acto_ev`);

--
-- Índexs per a la taula `grupos`
--
ALTER TABLE `grupos`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT per les taules bolcades
--

--
-- AUTO_INCREMENT per la taula `alumnos_grupos`
--
ALTER TABLE `alumnos_grupos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT per la taula `entregas`
--
ALTER TABLE `entregas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
