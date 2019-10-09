-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost:3306
-- Tiempo de generación: 12-04-2019 a las 04:31:01
-- Versión del servidor: 5.7.23
-- Versión de PHP: 7.1.22

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `disketo_data`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `contacto`
--

CREATE TABLE `contacto` (
  `id_contacto` int(5) NOT NULL,
  `nombre` varchar(30) NOT NULL,
  `email` varchar(60) NOT NULL,
  `telefono` varchar(12) NOT NULL,
  `motivo` varchar(100) NOT NULL,
  `texto_req` varchar(255) NOT NULL,
  `fecha_hora` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `contacto`
--

INSERT INTO `contacto` (`id_contacto`, `nombre`, `email`, `telefono`, `motivo`, `texto_req`, `fecha_hora`) VALUES
(1, 'daniel', 'daniel@daniel.daniel', '056968361615', 'ventas', 'mensajito!', '2019-04-08 03:02:52'),
(2, 'loreto', 'loreto@loreto.loreto', '056968361615', 'queja', 'esta es una queja!', '2019-04-08 03:14:41'),
(3, 'daniela', 'daniela@daniela.daniela', '056968361615', 'soporte', 'este es un mensaje a soporte!', '2019-04-08 03:15:43'),
(4, 'flo', 'flo@flo.flo', '056968361615', 'queja', 'tengo una quejita!', '2019-04-08 12:45:16'),
(5, 'lola', 'lola@lola.lola', '056968361615', 'ventas', 'mensajillo!', '2019-04-08 19:33:11'),
(6, 'Elva Lazo', 'elbalazo@gmail.com', '591768489510', 'queja', 'No llego el producto que compre en internet.', '2019-04-09 01:36:56'),
(7, 'pedro', 'pedro@pedro.pedro', '05493685458', 'queja', 'aÃ±lkdjfÃ±ajlks', '2019-04-09 02:40:15'),
(8, 'daniel garcia', 'danielgarcia@gmail.com', '056968361615', 'ventas', 'este es un motivote!', '2019-04-11 20:17:35'),
(9, 'dani garcia', 'a@a.aaaa', '054968361615', 'ventas', 'aÃ±lkdfÃ±alkdsj', '2019-04-12 06:32:00'),
(10, 'lolin', 'lolin@gmail.com', '056968361615', 'ventas', 'mensajillo!', '2019-04-12 06:51:38');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `id_usuario` int(3) NOT NULL,
  `nombre` varchar(30) NOT NULL,
  `apellido` varchar(30) NOT NULL,
  `email` varchar(30) NOT NULL,
  `password` varchar(255) NOT NULL,
  `fecha_creacion` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`id_usuario`, `nombre`, `apellido`, `email`, `password`, `fecha_creacion`) VALUES
(1, 'daniel', 'daniel', 'daniel@daniel.daniel', 'daniel', '2019-04-08 21:12:26'),
(2, 'Ana Lisa', 'Melano Rojo', 'analisamelano@gmail.com', 'analizamelano', '2019-04-09 01:41:57'),
(3, 'pedro', 'pedro', 'pedro@pedro.pedro', 'pedropedro', '2019-04-09 02:40:48'),
(4, 'daniel', 'garcia', 'stngarcia8@gmail.com', 'daniel', '2019-04-11 18:33:12'),
(5, 'loretin', 'romin', 'loretin@gmail.com', 'loretin', '2019-04-11 20:31:57'),
(6, 'floppy', 'garcia', 'floppy@gmail.com', 'floppy', '2019-04-12 06:34:16'),
(7, 'floppy', 'garcia', 'floppy@gmail.com', 'floppy', '2019-04-12 06:35:04'),
(8, 'lolita', 'garcia', 'lolita@gmail.com', 'lolita', '2019-04-12 06:50:47');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `contacto`
--
ALTER TABLE `contacto`
  ADD PRIMARY KEY (`id_contacto`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id_usuario`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id_usuario` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
