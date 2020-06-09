CREATE DATABASE niam;
USE niam;

--
-- Estructura de tabla para la tabla `usuarios`
--

DROP TABLE IF EXISTS `usuario`;
CREATE TABLE IF NOT EXISTS `usuario` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) NOT NULL,
  `fecha_registro` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `activo` tinyint(1) NOT NULL,
  `nick` varchar(20) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `nick` (`nick`)
);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `direccion`
--

DROP TABLE IF EXISTS `direccion`;
CREATE TABLE IF NOT EXISTS `direccion` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) NOT NULL,
  `lat` float NOT NULL,
  `ln` float NOT NULL,
  PRIMARY KEY (`id`)
);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo_telefono`
--

DROP TABLE IF EXISTS `tipo_telefono`;
CREATE TABLE IF NOT EXISTS `tipo_telefono` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) NOT NULL,
  `activo` tinyint(1) DEFAULT 1,
  PRIMARY KEY (`id`)
);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `telefono`
--



DROP TABLE IF EXISTS `telefono`;
CREATE TABLE IF NOT EXISTS `telefono` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `numero` int(10) NOT NULL,
  `is_whatsapp` tinyint(1) DEFAULT 1,
  `tipo_telefono_id`  int(10) UNSIGNED NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `tipo_telefono_id` (`tipo_telefono_id`),
  UNIQUE KEY `numero` (`numero`),
  FOREIGN KEY (`tipo_telefono_id`) REFERENCES `tipo_telefono` (`id`)
);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario_direccion`
--

DROP TABLE IF EXISTS `usuario_direccion`;
CREATE TABLE IF NOT EXISTS `usuario_direccion` (
  `id` int(10) UNSIGNED NOT NULL,
  `usuario_id` int(10) UNSIGNED NOT NULL,
  `direccion_id` int(10) UNSIGNED NOT NULL,
  `fecha` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `activo` tinyint(1) DEFAULT 1,
  PRIMARY KEY (`id`),
   UNIQUE KEY `usuario_id` (`usuario_id`),
   UNIQUE KEY `direccion_id` (`direccion_id`),
   FOREIGN KEY (`usuario_id`) REFERENCES `usuario` (`id`),
   FOREIGN KEY (`direccion_id`) REFERENCES `direccion` (`id`)
);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario_telefono`
--

DROP TABLE IF EXISTS `usuario_telefono`;
CREATE TABLE IF NOT EXISTS `usuario_telefono` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `usuario_id`int(10) UNSIGNED NOT NULL,
  `telefono_id` int(10) UNSIGNED NOT NULL,
  `fecha` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `activo` tinyint(1) DEFAULT 1,
  PRIMARY KEY (`id`),
  UNIQUE KEY `usuario_id` (`usuario_id`),
  UNIQUE KEY `telefono_id` (`telefono_id`),
  FOREIGN KEY (`usuario_id`) REFERENCES `usuario` (`id`),
  FOREIGN KEY (`telefono_id`) REFERENCES `telefono` (`id`)
);

--
-- Estructura de tabla para la tabla `credencial`
--

DROP TABLE IF EXISTS `credencial`;
CREATE TABLE IF NOT EXISTS `credencial` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `pass` varchar(80) NOT NULL,
  `is_validate` tinyint(1) DEFAULT 1,
  `fecha` date NOT NULL,
  `usuario_id` int(10) UNSIGNED NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `usuario_id` (`usuario_id`),
  FOREIGN KEY (`usuario_id`) REFERENCES `usuario` (`id`)
  );

-- --------------------------------------------------------



--
-- Estructura de tabla para la tabla `categoria`
--

DROP TABLE IF EXISTS `categoria`;
CREATE TABLE IF NOT EXISTS `categoria` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) NOT NULL,
  `activo` tinyint(1) DEFAULT 1,
  PRIMARY KEY (`id`)
);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `giro`
--

DROP TABLE IF EXISTS `giro`;
CREATE TABLE IF NOT EXISTS `giro` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) NOT NULL,
  `activo` tinyint(1) DEFAULT 1,
  PRIMARY KEY (`id`)
);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `negocio`
--

DROP TABLE IF EXISTS `negocio`;
CREATE TABLE IF NOT EXISTS `negocio` (
  `id` int(10) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `fecha` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `descripcion` varchar(100) NOT NULL,
  `usuario_id` int(10)UNSIGNED NOT NULL,
  `activo` tinyint(1) DEFAULT 1,
  `giro_id` int(10) UNSIGNED NOT NULL,
  `is_open` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `usuario_id` (`usuario_id`),
  UNIQUE KEY `giro_id` (`giro_id`),
 FOREIGN KEY (`usuario_id`) REFERENCES `usuario` (`id`),
 FOREIGN KEY (`giro_id`) REFERENCES `giro` (`id`)
);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `negocio_direccion`
--

DROP TABLE IF EXISTS `negocio_direccion`;
CREATE TABLE IF NOT EXISTS `negocio_direccion` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `negocio_id`int(10) UNSIGNED NOT NULL,
  `direccion_id` int(10) UNSIGNED NOT NULL,
 `fecha` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `activo` tinyint(1) DEFAULT 1,
  PRIMARY KEY (`id`),
  UNIQUE KEY `negocio_id` (`negocio_id`),
  UNIQUE KEY `direccion_id` (`direccion_id`),
 FOREIGN KEY (`negocio_id`) REFERENCES `negocio` (`id`),
 FOREIGN KEY (`direccion_id`) REFERENCES `direccion` (`id`)
);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `negocio_telefono`
--

DROP TABLE IF EXISTS `negocio_telefono`;
CREATE TABLE IF NOT EXISTS `negocio_telefono` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `fecha` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `activo` tinyint(1) DEFAULT 1,
  `negocio_id` int (10) UNSIGNED NOT NULL,
  `telefono_id`int (10) UNSIGNED NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `negocio_id` (`negocio_id`),
  UNIQUE KEY `telefono_id` (`telefono_id`),
 FOREIGN KEY (`negocio_id`) REFERENCES `negocio` (`id`),
 FOREIGN KEY (`telefono_id`) REFERENCES `telefono` (`id`)
);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `catalogo`
--

DROP TABLE IF EXISTS `catalogo`;
CREATE TABLE IF NOT EXISTS `catalogo` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `negocio_id` int(10) UNSIGNED NOT NULL,
  `producto_id` int(10) UNSIGNED NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `negocio_id` (`negocio_id`),
  UNIQUE KEY `producto_id` (`producto_id`),
 FOREIGN KEY (`negocio_id`) REFERENCES `negocio` (`id`),
 FOREIGN KEY (`producto_id`) REFERENCES `producto` (`id`)
);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pedido`
--

DROP TABLE IF EXISTS `pedido`;
CREATE TABLE IF NOT EXISTS `pedido` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `usuario_direccion_id`  int(10) UNSIGNED NOT NULL,
  `folio` int(10) NOT NULL,
  `fecha` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `usuario_direccion_id` (`usuario_direccion_id`),
  FOREIGN KEY (`usuario_direccion_id`) REFERENCES `usuario_direccion` (`id`)

);
-- --------------------------------------------------------
--
-- Estructura de tabla para la tabla `estado_pedido`
--

DROP TABLE IF EXISTS `estado_pedido`;
CREATE TABLE IF NOT EXISTS `estado_pedido` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) NOT NULL,
  `activo` tinyint(1) DEFAULT 1,
  PRIMARY KEY (`id`)
);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalles_pedido`
--

DROP TABLE IF EXISTS `detalles_pedido`;
CREATE TABLE IF NOT EXISTS `detalles_pedido` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `pedido_id` int(10)UNSIGNED NOT NULL,
  `cantidad` int(10) NOT NULL,
  `catalogo_id` int (10) UNSIGNED NOT NULL,
  `precio` float NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `pedido_id` (`pedido_id`),
  UNIQUE KEY `catalogo_id` (`catalogo_id`),
 FOREIGN KEY (`pedido_id`) REFERENCES `pedido` (`id`),
 FOREIGN KEY (`catalogo_id`) REFERENCES `catalogo` (`id`)
);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `historial_pedidos`
--

DROP TABLE IF EXISTS `historial_pedidos`;
CREATE TABLE IF NOT EXISTS `historial_pedidos` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `estado_pedido_id` int(10) UNSIGNED NOT NULL,
  `detalles_pedido_id` int(10) UNSIGNED NOT NULL,
  `fecha` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `estado_pedido_id` (`estado_pedido_id`),
  UNIQUE KEY `detalles_pedido_id` (`detalles_pedido_id`),
  FOREIGN KEY (`estado_pedido_id`) REFERENCES `estado_pedido` (`id`),
  FOREIGN KEY (`detalles_pedido_id`) REFERENCES `detalles_pedido` (`id`)

);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `producto`
--

DROP TABLE IF EXISTS `producto`;
CREATE TABLE IF NOT EXISTS `producto` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) NOT NULL,
  `descripcion` varchar(100) NOT NULL,
  `precio` float NOT NULL,
  `categoria_id`  int(10)UNSIGNED NOT NULL,
  `activo` tinyint(1) DEFAULT 1,
  `imagen` varchar(255) NOT NULL,
  `is_disponible` tinyint(1) DEFAULT 1,
  `fecha` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `categoria_id` (`categoria_id`),
 FOREIGN KEY (`categoria_id`) REFERENCES `categoria` (`id`)
);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `calificacion`
--

DROP TABLE IF EXISTS `calificacion`;
CREATE TABLE IF NOT EXISTS `calificacion` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `negocio_id` int(10) UNSIGNED NOT NULL,
  `usuario_id` int(10) UNSIGNED NOT NULL,
  `comentario` varchar(200) NOT NULL,
  `valor` int(10) NOT NULL,
  `fecha` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `negocio_id` (`negocio_id`),
  UNIQUE KEY `usuario_id` (`usuario_id`),
  FOREIGN KEY (`negocio_id`) REFERENCES `negocio` (`id`),
  FOREIGN KEY (`usuario_id`) REFERENCES `usuario` (`id`)
);
