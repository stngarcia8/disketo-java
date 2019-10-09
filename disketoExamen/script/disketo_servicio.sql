SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


-- drop database disketo_ejercicio;
CREATE DATABASE IF NOT EXISTS disketo_ejercicio DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE disketo_ejercicio;


-- Creando tablas...
CREATE TABLE estado (
  idEstado int(2) NOT NULL AUTO_INCREMENT,
  nombreEstado varchar(25) NOT NULL,
  CONSTRAINT pk_estado PRIMARY KEY (idEstado),
  CONSTRAINT u_nombreEstado UNIQUE (nombreEstado)
    ) ENGINE=InnoDB DEFAULT CHARSET=utf8;


CREATE TABLE genero (
  idGenero int(4) NOT NULL AUTO_INCREMENT,
  nombreGenero varchar(50) NOT NULL,
  CONSTRAINT pk_genero PRIMARY KEY (idGenero),
  CONSTRAINT u_nombreGenero UNIQUE (nombreGenero)
    ) ENGINE=InnoDB DEFAULT CHARSET=utf8;


CREATE TABLE artista (
  idArtista int(6) NOT NULL AUTO_INCREMENT,
  nombreArtista varchar(50) NOT NULL,
  origenArtista varchar(50),
  formadoArtista int(4),
    tematicaArtista varchar(100),
  idGenero int(4) NOT NULL,
  idEstado int(2) NOT NULL,
  CONSTRAINT pk_artista PRIMARY KEY (idArtista),
    CONSTRAINT fk_artista_genero FOREIGN KEY (idGenero)
      REFERENCES genero (idGenero)
	  ON UPDATE NO ACTION ON DELETE NO ACTION,
	    CONSTRAINT fk_artista_estado FOREIGN KEY (idEstado)
      REFERENCES estado (idEstado) 
ON UPDATE NO ACTION ON DELETE NO ACTION	  
      ) ENGINE=InnoDB DEFAULT CHARSET=utf8;


-- Creando estados.
INSERT INTO estado (nombreEstado) VALUES ('Active');
INSERT INTO estado (nombreEstado) VALUES ('Split-up');
INSERT INTO estado (nombreEstado) VALUES ('RIP');
INSERT INTO estado (nombreEstado) VALUES ('On hold');
INSERT INTO estado (nombreEstado) VALUES ('Changed name');
INSERT INTO estado (nombreEstado) VALUES ('Unknown');
commit;

-- Creando generos
INSERT INTO genero (nombreGenero) VALUES('Alternative Metal');
INSERT INTO genero (nombreGenero) VALUES('Avant-Garde Metal');
INSERT INTO genero (nombreGenero) VALUES('Black Metal');
INSERT INTO genero (nombreGenero) VALUES('Crossover');
INSERT INTO genero (nombreGenero) VALUES('Dark Metal');
INSERT INTO genero (nombreGenero) VALUES('Death Metal');
INSERT INTO genero (nombreGenero) VALUES('Deathcore');
INSERT INTO genero (nombreGenero) VALUES('Doom Metal');
INSERT INTO genero (nombreGenero) VALUES('Drone Metal');
INSERT INTO genero (nombreGenero) VALUES('Epic Metal');
INSERT INTO genero (nombreGenero) VALUES('Experimental Metal');
INSERT INTO genero (nombreGenero) VALUES('Folk Metal');
INSERT INTO genero (nombreGenero) VALUES('Glam Metal');
INSERT INTO genero (nombreGenero) VALUES('Glam Rock');
INSERT INTO genero (nombreGenero) VALUES('Gothic Metal');
INSERT INTO genero (nombreGenero) VALUES('Grindcore');
INSERT INTO genero (nombreGenero) VALUES('Groove Metal');
INSERT INTO genero (nombreGenero) VALUES('Grunge');
INSERT INTO genero (nombreGenero) VALUES('Hard & Heavy');
INSERT INTO genero (nombreGenero) VALUES('Hard Rock');
INSERT INTO genero (nombreGenero) VALUES('Hardcore');
INSERT INTO genero (nombreGenero) VALUES('Heavy Metal');
INSERT INTO genero (nombreGenero) VALUES('Horror Metal');
INSERT INTO genero (nombreGenero) VALUES('Industrial Metal');
INSERT INTO genero (nombreGenero) VALUES('Instrumental metal');
INSERT INTO genero (nombreGenero) VALUES('Math Metal');
INSERT INTO genero (nombreGenero) VALUES('Mathcore');
INSERT INTO genero (nombreGenero) VALUES('Metalcore');
INSERT INTO genero (nombreGenero) VALUES('Modern Metal');
INSERT INTO genero (nombreGenero) VALUES('Neo-Classical Metal');
INSERT INTO genero (nombreGenero) VALUES('Nu-Metal');
INSERT INTO genero (nombreGenero) VALUES('Pagan Metal');
INSERT INTO genero (nombreGenero) VALUES('Post-Metal');
INSERT INTO genero (nombreGenero) VALUES('Power Metal');
INSERT INTO genero (nombreGenero) VALUES('Progressive Metal');
INSERT INTO genero (nombreGenero) VALUES('Rock');
INSERT INTO genero (nombreGenero) VALUES('Sludge Metal');
INSERT INTO genero (nombreGenero) VALUES('Sludgecore');
INSERT INTO genero (nombreGenero) VALUES('Southern Metal');
INSERT INTO genero (nombreGenero) VALUES('Speed Metal');
INSERT INTO genero (nombreGenero) VALUES('Stoner Metal');
INSERT INTO genero (nombreGenero) VALUES('Sympho Metal');
INSERT INTO genero (nombreGenero) VALUES('Thrash Metal');
INSERT INTO genero (nombreGenero) VALUES('Thrashcore');
INSERT INTO genero (nombreGenero) VALUES('Viking Metal');
INSERT INTO genero (nombreGenero) VALUES('Metal');
commit;

-- Creando artistas.
INSERT INTO artista (nombreArtista, origenArtista, formadoArtista, tematicaArtista, idGenero, idEstado) VALUES('Al Namrood', 'Saudi Arabia', 2008, 'Ancient history, evil, darkness, anti-religion.', 3, 1);
INSERT INTO artista (nombreArtista, origenArtista, formadoArtista, tematicaArtista, idGenero, idEstado) VALUES('Amorphis', 'Findland', 1990, 'War, death, finnish legends, Kalevala.', 17, 1);
INSERT INTO artista (nombreArtista, origenArtista, formadoArtista, tematicaArtista, idGenero, idEstado) VALUES('Annihilator', 'Canada', 1984, 'Metal, perversion, mental demons, paranoia, psychology, disorder.', 17, 1);
INSERT INTO artista (nombreArtista, origenArtista, formadoArtista, tematicaArtista, idGenero, idEstado) VALUES('Arch Enemy', 'Sweden', 1995, 'Darkness, humanity, anti-religion, rebellion, society.', 6, 1);
INSERT INTO artista (nombreArtista, origenArtista, formadoArtista, tematicaArtista, idGenero, idEstado) VALUES('Black sabbath', 'United kingdom', 1969, 'Doom, drugs, life, death, religion.', 22, 1);
INSERT INTO artista (nombreArtista, origenArtista, formadoArtista, tematicaArtista, idGenero, idEstado) VALUES('Brujeria', 'Mexico', 1989, 'Drug smuggling, mexican pride, satanism, sex, gore, racism.', 6, 1);
INSERT INTO artista (nombreArtista, origenArtista, formadoArtista, tematicaArtista, idGenero, idEstado) VALUES('Cryptopsy', 'Canada', 1992, 'Horror, blasphemy, gore, death, mutilation, insanity.', 6, 1);
INSERT INTO artista (nombreArtista, origenArtista, formadoArtista, tematicaArtista, idGenero, idEstado) VALUES('Danzig', 'USA', 1987, 'Life, death, darkness, religion, sex, drugs, pain, Satan.', 22, 1);
INSERT INTO artista (nombreArtista, origenArtista, formadoArtista, tematicaArtista, idGenero, idEstado) VALUES('Darkthrone', 'Norway', 1987, 'Anti-religion, satan, occultism, rebellion, metal.', 6, 1);
INSERT INTO artista (nombreArtista, origenArtista, formadoArtista, tematicaArtista, idGenero, idEstado) VALUES('Death', 'USA', 1984, 'Death, gore, society, enlightenment.', 6, 2);
INSERT INTO artista (nombreArtista, origenArtista, formadoArtista, tematicaArtista, idGenero, idEstado) VALUES('Dio', 'USA', 1982, 'Heroic fantasy, metaphors, human issues, death.', 22, 2);
INSERT INTO artista (nombreArtista, origenArtista, formadoArtista, tematicaArtista, idGenero, idEstado) VALUES('Exhumed', 'USA', 1990, 'Gore, death, necrophilia, pathology, political.', 6, 1);
INSERT INTO artista (nombreArtista, origenArtista, formadoArtista, tematicaArtista, idGenero, idEstado) VALUES('Faith No More', 'USA', 1982, 'Struggles, indifference, silliness.', 2, 1);
INSERT INTO artista (nombreArtista, origenArtista, formadoArtista, tematicaArtista, idGenero, idEstado) VALUES('God Dethroned', 'Netherland', 1991, 'Death, war, Satanism, ancient ones, world war.', 6, 1);
INSERT INTO artista (nombreArtista, origenArtista, formadoArtista, tematicaArtista, idGenero, idEstado) VALUES('God is an astronaut', 'Ireland', 2002, 'N/A', 20, 1);
INSERT INTO artista (nombreArtista, origenArtista, formadoArtista, tematicaArtista, idGenero, idEstado) VALUES('Grave', 'Sweden', 1988, 'Death, gore, anti-christianity.', 6, 1);
INSERT INTO artista (nombreArtista, origenArtista, formadoArtista, tematicaArtista, idGenero, idEstado) VALUES('Hate Eternal', 'USA', 1997, 'The ancient ones, domination.', 6, 1);
INSERT INTO artista (nombreArtista, origenArtista, formadoArtista, tematicaArtista, idGenero, idEstado) VALUES('Illdisposed', 'Denmark', 1991, 'Metal, conflict, hate.', 6, 1);
INSERT INTO artista (nombreArtista, origenArtista, formadoArtista, tematicaArtista, idGenero, idEstado) VALUES('Impaled Nazarene', 'Finland', 1990, 'Satanism, goats, nuclear warfare, sex, violence, politics, finish patriotism.', 3, 1);
INSERT INTO artista (nombreArtista, origenArtista, formadoArtista, tematicaArtista, idGenero, idEstado) VALUES('Infernal Torment', 'Denmark', 1992, 'Satanism, sex, death, perversion.', 6, 2);
INSERT INTO artista (nombreArtista, origenArtista, formadoArtista, tematicaArtista, idGenero, idEstado) VALUES('Krabathor', 'Czech Republic', 1984, 'Anti-christianity, death, violence.', 6, 1);
commit;
