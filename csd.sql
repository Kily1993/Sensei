-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 30-01-2017 a las 14:19:59
-- Versión del servidor: 10.1.16-MariaDB
-- Versión de PHP: 5.6.24

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `csd`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `equipo`
--

CREATE TABLE `equipo` (
  `id` bigint(20) NOT NULL,
  `estadio` varchar(255) NOT NULL,
  `nombre` varchar(255) NOT NULL,
  `presupuesto` int(11) NOT NULL,
  `fede` bigint(20) NOT NULL,
  `imagen` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `equipo`
--

INSERT INTO `equipo` (`id`, `estadio`, `nombre`, `presupuesto`, `fede`, `imagen`) VALUES
(2, 'Caca Stadium', 'Carbonara', 12048942, 1, 'http://www.todobasketball.com/img/federacion-espanola-de-baloncesto.jpg'),
(3, 'Caca Stadium', 'Carbonara', 12048942, 2, NULL),
(4, 'Caca Stadium', 'Carbonara', 12048942, 2, NULL),
(5, 'Caca Stadium', 'Carbonara', 12048942, 2, NULL),
(7, 'Caca Stadium', 'Carbonara', 12048942, 2, NULL),
(8, 'Caca Stadium', 'Carbonara', 12048942, 2, NULL),
(9, 'Caca Stadium', 'Carbonara', 12048942, 2, NULL),
(10, 'Caca Stadium', 'Carbonara', 12048942, 2, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `equipo_jugador`
--

CREATE TABLE `equipo_jugador` (
  `Equipo_id` bigint(20) NOT NULL,
  `jugador_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `federacion`
--

CREATE TABLE `federacion` (
  `id` bigint(20) NOT NULL,
  `nombre` varchar(255) NOT NULL,
  `pais` varchar(255) NOT NULL,
  `imagen` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `federacion`
--

INSERT INTO `federacion` (`id`, `nombre`, `pais`, `imagen`) VALUES
(1, 'Fibaaaa', 'Espana', 'http://www.entrenadordefutbol11.com/wp-content/uploads/2015/01/federacionfutbol.jpg'),
(2, 'Fibaaaaaaa', 'Espana', 'http://www.todobasketball.com/img/federacion-espanola-de-baloncesto.jpg'),
(3, 'Fiba', 'Espana', ''),
(4, 'Fiba', 'Espana', ''),
(6, 'Fiba', 'Espana', ''),
(7, 'Fiba', 'Espana', '');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `federacion_equipo`
--

CREATE TABLE `federacion_equipo` (
  `Federacion_id` bigint(20) NOT NULL,
  `equipos_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `jugador`
--

CREATE TABLE `jugador` (
  `id` bigint(20) NOT NULL,
  `edad` int(11) NOT NULL,
  `goles` int(11) NOT NULL,
  `nombre` varchar(255) NOT NULL,
  `equi` bigint(20) NOT NULL,
  `imagen` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `jugador`
--

INSERT INTO `jugador` (`id`, `edad`, `goles`, `nombre`, `equi`, `imagen`) VALUES
(17, 44, 5, 'Calva', 2, 'http://www.lavidalucida.com/wp-content/uploads/2012/10/manchas-en-la-cara.jpg'),
(18, 44, 5, 'rr', 5, NULL),
(19, 44, 5, 'rr', 5, NULL),
(20, 44, 5, 'rr', 5, NULL),
(21, 22, 5, 'pepe', 2, NULL),
(22, 66, 77, 'Puta', 2, '');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `equipo`
--
ALTER TABLE `equipo`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_5vym6qwnasg2ff5dbxcg8vod9` (`fede`);

--
-- Indices de la tabla `equipo_jugador`
--
ALTER TABLE `equipo_jugador`
  ADD PRIMARY KEY (`Equipo_id`,`jugador_id`),
  ADD UNIQUE KEY `UK_4poung2uyhljqsoflj8qodyi6` (`jugador_id`);

--
-- Indices de la tabla `federacion`
--
ALTER TABLE `federacion`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `federacion_equipo`
--
ALTER TABLE `federacion_equipo`
  ADD PRIMARY KEY (`Federacion_id`,`equipos_id`),
  ADD UNIQUE KEY `UK_ece2s1aa008t74x3l19x1t9p0` (`equipos_id`);

--
-- Indices de la tabla `jugador`
--
ALTER TABLE `jugador`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_gq6txbcbvgr8exbyyh9jneu5c` (`equi`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `equipo`
--
ALTER TABLE `equipo`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
--
-- AUTO_INCREMENT de la tabla `federacion`
--
ALTER TABLE `federacion`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT de la tabla `jugador`
--
ALTER TABLE `jugador`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;
--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `equipo`
--
ALTER TABLE `equipo`
  ADD CONSTRAINT `FK_5vym6qwnasg2ff5dbxcg8vod9` FOREIGN KEY (`fede`) REFERENCES `federacion` (`id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `equipo_jugador`
--
ALTER TABLE `equipo_jugador`
  ADD CONSTRAINT `FK_4poung2uyhljqsoflj8qodyi6` FOREIGN KEY (`jugador_id`) REFERENCES `jugador` (`id`),
  ADD CONSTRAINT `FK_asrvbh3dqn5dgc60is8rs2r3o` FOREIGN KEY (`Equipo_id`) REFERENCES `equipo` (`id`);

--
-- Filtros para la tabla `federacion_equipo`
--
ALTER TABLE `federacion_equipo`
  ADD CONSTRAINT `FK_ece2s1aa008t74x3l19x1t9p0` FOREIGN KEY (`equipos_id`) REFERENCES `equipo` (`id`),
  ADD CONSTRAINT `FK_pcblterqnp09ufmj31xxbxcfa` FOREIGN KEY (`Federacion_id`) REFERENCES `federacion` (`id`);

--
-- Filtros para la tabla `jugador`
--
ALTER TABLE `jugador`
  ADD CONSTRAINT `FK_gq6txbcbvgr8exbyyh9jneu5c` FOREIGN KEY (`equi`) REFERENCES `equipo` (`id`) ON DELETE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
