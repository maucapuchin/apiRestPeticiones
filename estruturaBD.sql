/* Inicializacion */

/* 
CREATE DATABASE niam;
USE niam;
*/

/* Scripts de tablas */

/*
//////////////////////////////////////////////////
CREATE TABLE `tipousuario` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `tipo` varchar(30) NOT NULL,
  PRIMARY KEY (`id`)
);
//////////////////////////////////////////////////
CREATE TABLE `usuario` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) NOT NULL,
  `telefono` varchar(10) NOT NULL, 
  `correo` varchar(100) NOT NULL,  
  `activo` tinyint(1) NOT NULL DEFAULT '1',
  `fecharegistro` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `tipousuario_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `telefono` (`telefono`),
  UNIQUE KEY `correo` (`correo`),
  KEY `tipousuario_id` (`tipousuario_id`),
  CONSTRAINT `usuario_ibfk_1` FOREIGN KEY (`tipousuario_id`) REFERENCES `tipousuario` (`id`)
);
//////////////////////////////////////////////////////////////
CREATE TABLE `credencial` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nick` varchar(20) NOT NULL,
  `pass` varchar(80) NOT NULL,
  `fecha` datetime DEFAULT current_timestamp(),
  `activo` tinyint(1) DEFAULT 1,
  `usuario_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `nick_UNIQUE` (`nick`),
  UNIQUE KEY `usuario_id_UNIQUE` (`usuario_id`),
  CONSTRAINT `credencial_ibfk_1` FOREIGN KEY (`usuario_id`) REFERENCES `usuario` (`id`)
)
*/

/* Scripts de consultas */

/*
INSERT INTO `tipousuario` VALUES (1,'Administrador'),(2,'Vendedor'),(3,'Cliente');  
*/