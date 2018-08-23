CREATE DATABASE  IF NOT EXISTS `scripwebbd`;
USE `scripwebbd`;

DROP TABLE IF EXISTS `tipo_de_usuario`;

CREATE TABLE `tipo_de_usuario`(
  `cod_tipo_usuario` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nombre_tipo_usuario` varchar(100) COLLATE utf8_spanish_ci NOT NULL,
  `fecha_inicio_usuario` TIMESTAMP NOT NULL,
  `actualizacion_usuario` TIMESTAMP NOT NULL DEFAULT NOW() ON UPDATE NOW(),
  PRIMARY KEY (`cod_tipo_usuario`)
)ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;


DROP TABLE IF EXISTS `area_formacion`;

CREATE TABLE `area_formacion` (
  `cod_area_formacion` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nombre_area_formacion` varchar(100) COLLATE utf8_spanish_ci NOT NULL,
  `fecha_inicio_usuario` TIMESTAMP NOT NULL,
  `actualizacion_usuario` TIMESTAMP NOT NULL DEFAULT NOW() ON UPDATE NOW(),
  PRIMARY KEY (`cod_area_formacion`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;


DROP TABLE IF EXISTS `area_conocimiento`;

CREATE TABLE `area_conocimiento` (
  `cod_area_conocimiento` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nombre_area_conocimiento` varchar(100) COLLATE utf8_spanish_ci NOT NULL,
  `fecha_inicio_usuario` TIMESTAMP NOT NULL,
  `actualizacion_usuario` TIMESTAMP NOT NULL DEFAULT NOW() ON UPDATE NOW(),
  PRIMARY KEY (`cod_area_conocimiento`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;


DROP TABLE IF EXISTS `tipo_documento`;

CREATE TABLE `tipo_documento` (
  `cod_tipo_documento` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nombre_tipo_documento` varchar(100) COLLATE utf8_spanish_ci NOT NULL,
  `fecha_inicio_usuario` TIMESTAMP NOT NULL,
  `actualizacion_usuario` TIMESTAMP NOT NULL DEFAULT NOW() ON UPDATE NOW(),
  PRIMARY KEY (`cod_tipo_documento`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;


DROP TABLE IF EXISTS `pais`;

CREATE TABLE `pais` (
  `cod_pais` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nombre_pais` varchar(50) COLLATE utf8_spanish_ci NOT NULL,
  `postal_pais` varchar(10) COLLATE utf8_spanish_ci NOT NULL,
  `fecha_inicio_usuario` TIMESTAMP NOT NULL,
  `actualizacion_usuario` TIMESTAMP NOT NULL DEFAULT NOW() ON UPDATE NOW(),
  PRIMARY KEY (`cod_pais`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;


DROP TABLE IF EXISTS `estados`;

CREATE TABLE `estados` (
  `cod_estado` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `cod_pais` int(10) unsigned NOT NULL,
  `nombre_estado` varchar(50) COLLATE utf8_spanish_ci NOT NULL,
  `fecha_inicio_usuario` TIMESTAMP NOT NULL,
  `actualizacion_usuario` TIMESTAMP NOT NULL DEFAULT NOW() ON UPDATE NOW(),
  PRIMARY KEY (`cod_estado`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;


DROP TABLE IF EXISTS `ciudades`;

CREATE TABLE `ciudades` (
  `cod_ciudad` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `cod_estado` int(10) unsigned NOT NULL,
  `nombre_ciudad` varchar(50) COLLATE utf8_spanish_ci NOT NULL,
  `fecha_inicio_usuario` TIMESTAMP NOT NULL,
  `actualizacion_usuario` TIMESTAMP NOT NULL DEFAULT NOW() ON UPDATE NOW(),
  PRIMARY KEY (`cod_ciudad`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;


DROP TABLE IF EXISTS `comunas`;

CREATE TABLE `comunas` (
  `cod_comuna` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nombre_comuna` varchar(50) COLLATE utf8_spanish_ci NOT NULL,
  `fecha_inicio_usuario` TIMESTAMP NOT NULL,
  `actualizacion_usuario` TIMESTAMP NOT NULL DEFAULT NOW() ON UPDATE NOW(),
  PRIMARY KEY (`cod_comuna`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;


DROP TABLE IF EXISTS `ciudad_comunas`;

CREATE TABLE `ciudad_comunas` (
  `cod_ciu_comu` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `cod_ciudad` int(10) unsigned NULL,
  `cod_comuna` int(10) unsigned NULL,
  `fecha_inicio_usuario` TIMESTAMP NOT NULL,
  `actualizacion_usuario` TIMESTAMP NOT NULL DEFAULT NOW() ON UPDATE NOW(),
  PRIMARY KEY (`cod_ciu_comu`),
  KEY `fkcodciudadcc_ciudades_idx` (`cod_ciudad`),
  KEY `fkcodcomunacc_comunas_idx` (`cod_comuna`),
  CONSTRAINT `fkcodciudadcc_ciudades` FOREIGN KEY (`cod_ciudad`) REFERENCES `ciudades` (`cod_ciudad`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `fkcodcomunacc_comunas` FOREIGN KEY (`cod_comuna`) REFERENCES `comunas` (`cod_comuna`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;


DROP TABLE IF EXISTS `corregimiento`;

CREATE TABLE `corregimiento` (
  `cod_corregimiento` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `cod_ciudad` int(10) unsigned NOT NULL,
  `name_corregimiento` varchar(30) COLLATE utf8_spanish_ci NOT NULL,
  `fecha_inicio_usuario` TIMESTAMP NOT NULL,
  `actualizacion_usuario` TIMESTAMP NOT NULL DEFAULT NOW() ON UPDATE NOW(),
  PRIMARY KEY (`cod_corregimiento`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

DROP TABLE IF EXISTS `vereda`;

CREATE TABLE `vereda` (
  `cod_vereda` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `cod_corregimiento` int(10) unsigned NOT NULL,
  `name_vereda` varchar(30) COLLATE utf8_spanish_ci NOT NULL,
  `fecha_inicio_usuario` TIMESTAMP NOT NULL,
  `actualizacion_usuario` TIMESTAMP NOT NULL DEFAULT NOW() ON UPDATE NOW(),
  PRIMARY KEY (`cod_vereda`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

DROP TABLE IF EXISTS `barrio`;

CREATE TABLE `barrio` (
  `cod_barrio` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `cod_corregimiento` int(10) unsigned NULL,
  `cod_comuna` int(10) unsigned NULL,
  `name_barrio` varchar(30) COLLATE utf8_spanish_ci NOT NULL,
  `fecha_inicio_usuario` TIMESTAMP NOT NULL,
  `actualizacion_usuario` TIMESTAMP NOT NULL DEFAULT NOW() ON UPDATE NOW(),
  PRIMARY KEY (`cod_barrio`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;


DROP TABLE IF EXISTS `users`;

CREATE TABLE `users` (
  `id_user` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `cod_tipo_usuario` int(10) unsigned NOT NULL,
  `cod_area_formacion` int(10) unsigned NULL,
  `cod_area_conocimiento` int(10) unsigned NULL,
  `cod_tipo_documento` int(10) unsigned NOT NULL,
  `nombre_usuario` varchar(100) COLLATE utf8_spanish_ci NOT NULL,
  `genero_usuario` varchar(10) COLLATE utf8_spanish_ci NOT NULL,
  `ano_naci` int(4) unsigned NOT NULL,
  `mes_naci` int(2) unsigned NOT NULL,
  `dia_naci` int(2) unsigned NOT NULL,
  `documento_usuario` int(12) unsigned NOT NULL,
  `email_usuario` varchar(60) COLLATE utf8_spanish_ci NOT NULL,
  `contraseña_usuario` varchar(128) COLLATE utf8_spanish_ci NOT NULL,
  `salt_user` varchar(128) COLLATE utf8_spanish_ci NOT NULL,
  `confir_contraseña` varchar(128) COLLATE utf8_spanish_ci NOT NULL,
  `celular` varchar(16) COLLATE utf8_spanish_ci NOT NULL,
  `telefono` varchar(16) COLLATE utf8_spanish_ci NULL,
  `cod_pais` int(10) unsigned NOT NULL,
  `cod_estado` int(10) unsigned NOT NULL,
  `cod_ciudad` int(10) unsigned NOT NULL,
  `cod_comuna` int(10) unsigned NULL,
  `cod_ciu_comu` int(10) unsigned NULL,
  `cod_corregimiento` int(10) unsigned NULL,
  `cod_vereda` int(10) unsigned NULL,
  `cod_barrio` int(10) unsigned NULL,
  `direccion` varchar(100) COLLATE utf8_spanish_ci NOT NULL,
  `fecha_inicio_usuario` TIMESTAMP NOT NULL,
  `actualizacion_usuario` TIMESTAMP NOT NULL DEFAULT NOW() ON UPDATE NOW(),
  PRIMARY KEY (`id_user`),
  KEY `fkcodtipousuarioiu_tipodeusuario_idx` (`cod_tipo_usuario`),
  KEY `fkcodareaformacioniu_areaformacion_idx` (`cod_area_formacion`),
  KEY `fkcodareaconocimientoiu_areaconocimiento_idx` (`cod_area_conocimiento`),
  KEY `fkcodtipodocumentoiu_tipodocumento_idx` (`cod_tipo_documento`),
  KEY `fkcodpais_pais_idx` (`cod_pais`),
  KEY `fkcodestadoiu_estados_idx` (`cod_estado`),
  KEY `fkcodciudadiu_ciudades_idx` (`cod_ciudad`),
  KEY `fkcodcomumaiu_comunas_idx` (`cod_comuna`),
  KEY `fkcodciucomuiu_ciudadcomunas_idx`(`cod_ciu_comu`),
  KEY `fkcodcorregimientoiu_corregimiento_idx` (`cod_corregimiento`),
  KEY `fkcodveredaiu_vereda_idx` (`cod_vereda`),
  KEY `fkcodbarrioiu_barrio_idx` (`cod_barrio`),
  CONSTRAINT `fkcodtipousuarioiu_tipodeusuario` FOREIGN KEY (`cod_tipo_usuario`) REFERENCES `tipo_de_usuario` (`cod_tipo_usuario`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `fkcodareaformacioniu_areaformacion` FOREIGN KEY (`cod_area_formacion`) REFERENCES `area_formacion` (`cod_area_formacion`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `fkcodknowareaiu_areaconocimiento_idx` FOREIGN KEY (`cod_area_conocimiento`) REFERENCES `area_conocimiento` (`cod_area_conocimiento`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `fkcodtipodocumentoiu_tipodocumento` FOREIGN KEY (`cod_tipo_documento`) REFERENCES `tipo_documento` (`cod_tipo_documento`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `fkcodpais_pais` FOREIGN KEY (`cod_pais`) REFERENCES `pais` (`cod_pais`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `fkcodestadoiu_estados` FOREIGN KEY (`cod_estado`) REFERENCES `estados` (`cod_estado`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `fkcodciudadiu_ciudades` FOREIGN KEY (`cod_ciudad`) REFERENCES `ciudades` (`cod_ciudad`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `fkcodcomumaiu_comunas` FOREIGN KEY (`cod_comuna`) REFERENCES `comunas` (`cod_comuna`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `fkcodciucomuiu_ciudadcomunas` FOREIGN KEY (`cod_ciu_comu`) REFERENCES `ciudadcomunas` (`cod_ciu_comu`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `fkcodcorregimientoiu_corregimiento` FOREIGN KEY (`cod_corregimiento`) REFERENCES `corregimiento` (`cod_corregimiento`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `fkcodveredaiu_vereda` FOREIGN KEY (`cod_vereda`) REFERENCES `vereda` (`cod_vereda`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `fkcodbarrioiu_barrio` FOREIGN KEY (`cod_barrio`) REFERENCES `barrio` (`cod_barrio`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;


DROP TABLE IF EXISTS `categorias_proyectos`;

CREATE TABLE `categorias_proyectos` (
  `cod_categorias_proyectos` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name_categorias_proyectos` varchar(100) COLLATE utf8_spanish_ci NOT NULL,
  `fecha_inicio_usuario` TIMESTAMP NOT NULL,
  `actualizacion_usuario` TIMESTAMP NOT NULL DEFAULT NOW() ON UPDATE NOW(),
  PRIMARY KEY (`cod_categorias_proyectos`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;


DROP TABLE IF EXISTS `estado_proyectos`;

CREATE TABLE `estado_proyectos` (
  `cod_estado_proyectos` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name_estado_proyectos` varchar(100) COLLATE utf8_spanish_ci NOT NULL,
  `fecha_inicio_usuario` TIMESTAMP NOT NULL,
  `actualizacion_usuario` TIMESTAMP NOT NULL DEFAULT NOW() ON UPDATE NOW(),
  PRIMARY KEY (`cod_estado_proyectos`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

DROP TABLE IF EXISTS `ideas`;

CREATE TABLE `ideas` (
  `cod_idea` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `cod_categorias_proyectos` int(10) unsigned NOT NULL,
  `id_user` int(10) unsigned NOT NULL,
  `titulo_idea` varchar(100) COLLATE utf8_spanish_ci NOT NULL,
  `detalles_idea` text COLLATE utf8_spanish_ci NOT NULL,
  `fecha_inicio_usuario` TIMESTAMP NOT NULL,
  `actualizacion_usuario` TIMESTAMP NOT NULL DEFAULT NOW() ON UPDATE NOW(),
  PRIMARY KEY (`cod_idea`),
  KEY `fkcodcategoriasproyectosci_categoriasproyectos_idx` (`cod_categorias_proyectos`),
  KEY `fkiduserfi_users_idx` (`id_user`),
  CONSTRAINT `fkcodcategoriasproyectosci_categoriasproyectos` FOREIGN KEY (`cod_categorias_proyectos`) REFERENCES `categorias_proyectos` (`cod_categorias_proyectos`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `fkiduserci_users` FOREIGN KEY (`id_user`) REFERENCES `users` (`id_user`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;


DROP TABLE IF EXISTS `fases_proyecto`;

CREATE TABLE `fases_proyecto`(
 `cod_fases_proyecto` int(10) unsigned NOT NULL AUTO_INCREMENT,
 `nombre_fases_proyecto` varchar(100) COLLATE utf8_spanish_ci NOT NULL,
 `duracion_fases_proyecto` varchar(30) COLLATE utf8_spanish_ci NOT NULL,
 `fecha_inicio_usuario` TIMESTAMP NOT NULL,
  `actualizacion_usuario` TIMESTAMP NOT NULL DEFAULT NOW() ON UPDATE NOW(),
  PRIMARY KEY (`cod_fases_proyecto`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

 DROP TABLE IF EXISTS `proyecto`;

CREATE TABLE `PROYECTO` (
  `cod_proyecto` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nombre_proyecto` varchar(100) COLLATE utf8_spanish_ci NOT NULL,
  `cod_categorias_proyectos` int(10) unsigned NOT NULL,
  `cod_idea` int(10) unsigned NOT NULL,
  `cod_estado_proyectos` int(10) unsigned NOT NULL,
  `cod_fases_proyecto` int(10) unsigned NOT NULL,
  `progreso_proyecto` varchar(10) COLLATE utf8_spanish_ci NOT NULL,
  `fecha_inicio_usuario` TIMESTAMP NOT NULL,
  `actualizacion_usuario` TIMESTAMP NOT NULL DEFAULT NOW() ON UPDATE NOW(),
  PRIMARY KEY (`cod_proyecto`),
  KEY `fkcodcategoriasproyectosp_categoriasproyectos_idx` (`cod_categorias_proyectos`),
  KEY `fkcodideap_idea_idx` (`cod_idea`),
  KEY `fkcodestadoproyectosp_estadoproyectos_idx` (`cod_estado_proyectos`),
  KEY `fkcodfasesproyectop_fasesproyecto_idx` (`cod_fases_proyecto`),
  CONSTRAINT `fkcodcategoriasproyectosp_categoriasproyectos` FOREIGN KEY (`cod_categorias_proyectos`) REFERENCES `categorias_proyectos` (`cod_categorias_proyectos`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `fkcodideap_idea` FOREIGN KEY (`cod_idea`) REFERENCES `ideas` (`cod_idea`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `fkcodestadoproyectosp_estadoproyectos` FOREIGN KEY (`cod_estado_proyectos`) REFERENCES `estado_proyectos` (`cod_estado_proyectos`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `fkcodfasesproyectop_fasesproyecto` FOREIGN KEY (`cod_fases_proyecto`) REFERENCES `fases_proyecto` (`cod_fases_proyecto`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

 DROP TABLE IF EXISTS `clases_categorias`;

 CREATE TABLE `clases_categorias`(
   `cod_clases_categorias` int(10) unsigned NOT NULL AUTO_INCREMENT,
   `nombre_clases_categorias` varchar(100) COLLATE utf8_spanish_ci NOT NULL,
   `fecha_inicio_usuario` TIMESTAMP NOT NULL,
   `actualizacion_usuario` TIMESTAMP NOT NULL DEFAULT NOW() ON UPDATE NOW(),
   PRIMARY KEY (`cod_clases_categorias`)
 ) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;


 DROP TABLE IF EXISTS `clases`;

  CREATE TABLE `clases` (
    `cod_clases` int(10) unsigned NOT NULL AUTO_INCREMENT,
    `nombre_clases` varchar(100) COLLATE utf8_spanish_ci NOT NULL,
    `cod_clases_categorias` int(10) unsigned NOT NULL,
    `fecha_inicio_usuario` TIMESTAMP NOT NULL,
    `actualizacion_usuario` TIMESTAMP NOT NULL DEFAULT NOW() ON UPDATE NOW(),
    PRIMARY KEY (`cod_clases`),
    KEY `fkcodclasescategoriasc_clasescategorias_idx` (`cod_clases_categorias`),
    CONSTRAINT `fkcodclasescategoriasc_clasescategorias` FOREIGN KEY (`cod_clases_categorias`) REFERENCES `clases_categorias` (`cod_clases_categorias`) ON DELETE CASCADE ON UPDATE NO ACTION
  ) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;


  DROP TABLE IF EXISTS`clases_proyecto`;

  CREATE TABLE `clases_proyecto` (
    `cod_clases_proyecto` int(10) unsigned NOT NULL AUTO_INCREMENT,
    `cod_proyecto` int(10) unsigned NOT NULL,
    `cod_clases` int(10) unsigned NOT NULL,
    `fecha_inicio_usuario` TIMESTAMP NOT NULL,
    `actualizacion_usuario` TIMESTAMP NOT NULL DEFAULT NOW() ON UPDATE NOW(),
    PRIMARY KEY (`cod_clases_proyecto`),
    KEY `fkcodproyectocl_proyecto_idx` (`cod_proyecto`),
    KEY `fkcodclasescl_clases_idx` (`cod_clases`),
    CONSTRAINT `fkcodproyectocl_proyecto` FOREIGN KEY (`cod_proyecto`) REFERENCES `proyecto` (`cod_proyecto`) ON DELETE CASCADE ON UPDATE NO ACTION,
    CONSTRAINT `fkcodclasescl_clases` FOREIGN KEY (`cod_clases`) REFERENCES `clases` (`cod_clases`) ON DELETE CASCADE ON UPDATE NO ACTION
  ) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

  DROP TABLE IF EXISTS `proyecto_usuario`;

  CREATE TABLE `proyecto_usuario` (
    `cod_proyecto_usuario` int(10) unsigned NOT NULL AUTO_INCREMENT,
    `cod_proyecto` int(10) unsigned NOT NULL,
    `id_user` int(10) unsigned NOT NULL,
    `fecha_inicio_usuario` TIMESTAMP NOT NULL,
    `actualizacion_usuario` TIMESTAMP NOT NULL DEFAULT NOW() ON UPDATE NOW(),
    PRIMARY KEY (`cod_proyecto_usuario`),
    KEY `fkidproproyectopro_proyecto_idx` (`cod_proyecto`),
    KEY `fkiduserpro_users_idx` (`id_user`),
    CONSTRAINT `fkidproproyectopro_proyecto` FOREIGN KEY (`cod_proyecto`) REFERENCES `proyecto` (`cod_proyecto`) ON DELETE CASCADE ON UPDATE NO ACTION,
    CONSTRAINT `fkiduser_users` FOREIGN KEY (`id_user`) REFERENCES `users` (`id_user`) ON DELETE CASCADE ON UPDATE NO ACTION
  ) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;


DROP TABLE IF EXISTS `descripcion_proyecto`;

  CREATE TABLE `descripcion_proyecto`(
  `cod_descripcion_proyecto` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `cod_proyecto` int(10) unsigned NOT NULL,
  `texto_descripcion_proyecto` text COLLATE utf8_spanish_ci NOT NULL,
  `fecha_inicio_usuario` TIMESTAMP NOT NULL,
  `actualizacion_usuario` TIMESTAMP NOT NULL DEFAULT NOW() ON UPDATE NOW(),
  PRIMARY KEY (`cod_descripcion_proyecto`),
  KEY `fkcodproyecto_proyecto_idx` (`cod_proyecto`),
  CONSTRAINT `fkcodproyecto_proyecto` FOREIGN KEY (`cod_proyecto`) REFERENCES `proyecto` (`cod_proyecto`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;


DROP TABLE IF EXISTS `subdominios`;

CREATE TABLE `subdominios`(
  `cod_subdominios` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `cod_proyecto` int(10) unsigned NOT NULL,
  `url_subdominios` text COLLATE utf8_spanish_ci NOT NULL,
  `fecha_inicio_usuario` TIMESTAMP NOT NULL,
  `actualizacion_usuario` TIMESTAMP NOT NULL DEFAULT NOW() ON UPDATE NOW(),
  PRIMARY KEY (`cod_subdominios`),
  KEY `fkcodproyectocs_proyecto_idx` (`cod_proyecto`),
  CONSTRAINT `fkcodproyectocs_proyecto` FOREIGN KEY (`cod_proyecto`) REFERENCES `proyecto` (`cod_proyecto`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;


DROP TABLE IF EXISTS `definicion_categoria`;

CREATE TABLE `definicion_categoria` (
  `cod_definicion_categoria` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nombre_definicion_categoria` varchar(100) COLLATE utf8_spanish_ci NOT NULL,
  `fecha_inicio_usuario` TIMESTAMP NOT NULL,
  `actualizacion_usuario` TIMESTAMP NOT NULL DEFAULT NOW() ON UPDATE NOW(),
  PRIMARY KEY (`cod_definicion_categoria`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;


DROP TABLE IF EXISTS `definicion`;

CREATE TABLE `definicion` (
  `cod_definicion` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `cod_definicion_categoria` int(10) unsigned NOT NULL,
  `detalles_definicion` text COLLATE utf8_spanish_ci NOT NULL,
  `fecha_inicio_usuario` TIMESTAMP NOT NULL,
  `actualizacion_usuario` TIMESTAMP NOT NULL DEFAULT NOW() ON UPDATE NOW(),
  PRIMARY KEY (`cod_definicion`),
  KEY `fkcoddefinicioncategoria_definicioncategoria_idx` (`cod_definicion_categoria`),
  CONSTRAINT `fkcoddefinicioncategoria_definicioncategoria` FOREIGN KEY (`cod_definicion_categoria`) REFERENCES `definicion_categoria` (`cod_definicion_categoria`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

DROP TABLE IF EXISTS `condiciones_proyecto`;

CREATE TABLE `condiciones_proyecto` (
`cod_condiciones_proyecto` int(10) unsigned NOT NULL AUTO_INCREMENT,
`cod_definicion` int(10) unsigned NOT NULL,
`combre_condiciones_proyecto` varchar(30) COLLATE utf8_spanish_ci NOT NULL,
`fecha_inicio_usuario` TIMESTAMP NOT NULL,
`actualizacion_usuario` TIMESTAMP NOT NULL DEFAULT NOW() ON UPDATE NOW(),
PRIMARY KEY (`cod_condiciones_proyecto`),
KEY `fkcoddefinicioncd_definicion_idx` (`cod_definicion`),
CONSTRAINT `fkcoddefinicioncd_definicion` FOREIGN KEY (`cod_definicion`) REFERENCES `definicion` (`cod_definicion`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;


DROP TABLE IF EXISTS `foro`;

CREATE TABLE `foro` (
  `cod_foro` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `cod_proyecto` int(10) unsigned NOT NULL,
  `id_user` int(10) unsigned NOT NULL,
  `nombre_foro` text COLLATE utf8_spanish_ci NOT NULL,
  `fecha_inicio_usuario` TIMESTAMP NOT NULL,
  `actualizacion_usuario` TIMESTAMP NOT NULL DEFAULT NOW() ON UPDATE NOW(),
  PRIMARY KEY (`cod_foro`),
  KEY `fkcodproyectof_proyecto_idx` (`cod_proyecto`),
  KEY `fkiduserf_users_idx` (`id_user`),
  CONSTRAINT `fkcodproyectof_proyecto` FOREIGN KEY (`cod_proyecto`) REFERENCES `proyecto` (`cod_proyecto`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `fkiduserf_users` FOREIGN KEY (`id_user`) REFERENCES `users` (`id_user`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;


DROP TABLE IF EXISTS `preguntas_foro`;

CREATE TABLE `preguntas_foro`(
`cod_preguntas_foro` int(10) unsigned NOT NULL AUTO_INCREMENT,
`cod_foro` int(10) unsigned NOT NULL,
`id_user` int(10) unsigned NOT NULL,
`preguntas_para_foro` text COLLATE utf8_spanish_ci NOT NULL,
`fecha_inicio_usuario` TIMESTAMP NOT NULL,
`actualizacion_usuario` TIMESTAMP NOT NULL DEFAULT NOW() ON UPDATE NOW(),
PRIMARY KEY (`cod_preguntas_foro`),
KEY `fkcodforopre_foro_idx` (`cod_foro`),
KEY `fkiduserpre_users_idx` (`id_user`),
CONSTRAINT `fkcodforopre_foro` FOREIGN KEY (`cod_foro`) REFERENCES `foro` (`cod_foro`) ON DELETE CASCADE ON UPDATE NO ACTION,
CONSTRAINT `fkiduserpre_users` FOREIGN KEY (`id_user`) REFERENCES `users` (`id_user`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

DROP TABLE IF EXISTS `categoria_imagen`;

CREATE TABLE `categoria_imagen`(
`cod_categoria_imagen` int(10) unsigned NOT NULL AUTO_INCREMENT,
`nombre_categoria_imagen` text COLLATE utf8_spanish_ci NOT NULL,
`fecha_inicio_usuario` TIMESTAMP NOT NULL,
`actualizacion_usuario` TIMESTAMP NOT NULL DEFAULT NOW() ON UPDATE NOW(),
PRIMARY KEY (`cod_categoria_imagen`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

DROP TABLE IF EXISTS `imagen`;

CREATE TABLE `imagen`(
`cod_imagen` int(10) unsigned NOT NULL AUTO_INCREMENT,
`nombre_imagen` varchar(200) COLLATE utf8_spanish_ci NOT NULL,
`id_user` int(10) unsigned NULL,
`cod_proyecto` int(10) unsigned NULL,
`cod_idea` int(10) unsigned NULL,
`cod_categoria_imagen` int(10) unsigned NOT NULL,
`fecha_inicio_usuario` TIMESTAMP NOT NULL,
`actualizacion_usuario` TIMESTAMP NOT NULL DEFAULT NOW() ON UPDATE NOW(),
PRIMARY KEY (`cod_imagen`),
KEY `fkcodproyectoma_proyecto_idx` (`cod_proyecto`),
KEY `fkiduserima_users_idx` (`id_user`),
KEY `fkcodideaima_ideas_idx` (`cod_idea`),
KEY `fkcodcategoriaimagenma_categoriaimagen_idx` (`cod_categoria_imagen`),
CONSTRAINT `fkcodproyectoma_proyecto` FOREIGN KEY (`cod_proyecto`) REFERENCES `proyecto` (`cod_proyecto`) ON DELETE CASCADE ON UPDATE NO ACTION,
CONSTRAINT `fkiduserima_users` FOREIGN KEY (`id_user`) REFERENCES `users` (`id_user`) ON DELETE CASCADE ON UPDATE NO ACTION,
CONSTRAINT `fkcodideaima_ideas` FOREIGN KEY (`cod_idea`) REFERENCES `ideas` (`cod_idea`) ON DELETE CASCADE ON UPDATE NO ACTION,
CONSTRAINT `fkcodcategoriaimagenma_categoriaimagen` FOREIGN KEY (`cod_categoria_imagen`) REFERENCES `categoria_imagen` (`cod_categoria_imagen`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;
