SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


-- drop database disketo_data2;
CREATE DATABASE IF NOT EXISTS disketo_data2 DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE disketo_data2;



-- Creando tablas...
CREATE TABLE contacto (
    idContacto int(5) NOT NULL AUTO_INCREMENT,
  nombre varchar(30) NOT NULL,
  email varchar(75) NOT NULL,
  telefono varchar(15) NOT NULL,
  motivo varchar(100) NOT NULL,
  texto varchar(255) NOT NULL,
  fecha datetime NOT NULL,
  CONSTRAINT pk_contacto PRIMARY KEY (idContacto)
    ) ENGINE=InnoDB DEFAULT CHARSET=utf8;


CREATE TABLE formato (
  idFormato int(4) NOT NULL AUTO_INCREMENT,
  nombreFormato varchar(25) NOT NULL,
  CONSTRAINT pk_formato PRIMARY KEY (idFormato),
  CONSTRAINT u_nombreFormato UNIQUE (nombreFormato)
     ) ENGINE=InnoDB DEFAULT CHARSET=utf8;


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


CREATE TABLE usuarios (
  id_usuario int(3) NOT NULL AUTO_INCREMENT,
  nombre varchar(30) NOT NULL,
  apellido varchar(30) NOT NULL,
  email varchar(75) NOT NULL,
  password varchar(25) NOT NULL,
  fecha_creacion datetime NOT NULL,
  CONSTRAINT pk_usuario PRIMARY KEY (id_usuario)
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


CREATE TABLE album (
  idAlbum int(6) NOT NULL AUTO_INCREMENT,
  nombreAlbum varchar(255) NOT NULL,
  lanzamientoAlbum int(4) default 0,
  idArtista int(6) NOT NULL,
  CONSTRAINT pk_album PRIMARY KEY (idAlbum),
	    CONSTRAINT fk_artista_album FOREIGN KEY (idArtista)
      REFERENCES artista (idArtista) 
ON UPDATE NO ACTION ON DELETE NO ACTION
      ) ENGINE=InnoDB DEFAULT CHARSET=utf8;


CREATE TABLE discografia (
  idDiscografia int(6) NOT NULL AUTO_INCREMENT,
  nombreDiscografia varchar(50) NOT NULL,
  descripcionDiscografia varchar(100),
  CONSTRAINT pk_discografia PRIMARY KEY (idDiscografia)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


CREATE TABLE discografia_album (
  idDiscografia int(6) not null,
  idAlbum int(6) not null,
      CONSTRAINT fk_detalle_discografia FOREIGN KEY (idDiscografia)
      REFERENCES discografia (idDiscografia) 
      ON UPDATE NO ACTION ON DELETE CASCADE,
	  CONSTRAINT fk_detalle_album FOREIGN KEY (idAlbum)
      REFERENCES album (idAlbum) 
      ON UPDATE NO ACTION ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



CREATE TABLE usuario_discografia (
id_usuario int(3) NOT NULL,
  idDiscografia int(6) not null,
      CONSTRAINT fk_detalle_usuario FOREIGN KEY (id_usuario)
      REFERENCES usuarios (id_usuario) 
      ON UPDATE NO ACTION ON DELETE CASCADE,
	  CONSTRAINT fk_detalle_discousua FOREIGN KEY (idDiscografia)
      REFERENCES discografia (idDiscografia) 
      ON UPDATE NO ACTION ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



CREATE TABLE album_formato (
  idAlbum int(6) not null,
    idFormato int(4) not null,
      CONSTRAINT fk_detalle_albm FOREIGN KEY (idAlbum)
      REFERENCES album (idAlbum) 
      ON UPDATE NO ACTION ON DELETE CASCADE,
	  CONSTRAINT fk_detalle_formato FOREIGN KEY (idFormato)
      REFERENCES formato (idFormato) 
      ON UPDATE NO ACTION ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

  COMMIT;
  
  
  
  
  
  -- Creando formatos.
  INSERT INTO formato (nombreFormato) VALUES ('Casette');
  INSERT INTO formato (nombreFormato) VALUES ('Vinilo');
  INSERT INTO formato (nombreFormato) VALUES ('CD');
    INSERT INTO formato (nombreFormato) VALUES ('Mini disc');
  INSERT INTO formato (nombreFormato) VALUES ('DVD');
  INSERT INTO formato (nombreFormato) VALUES ('DVD9');
  INSERT INTO formato (nombreFormato) VALUES ('VHS');
  INSERT INTO formato (nombreFormato) VALUES ('Blue-Ray');
  INSERT INTO formato (nombreFormato) VALUES ('Musica digital');
  INSERT INTO formato (nombreFormato) VALUES ('Video digital');


-- Creando estados.
INSERT INTO estado (nombreEstado) VALUES ('Active');
INSERT INTO estado (nombreEstado) VALUES ('Split-up');
INSERT INTO estado (nombreEstado) VALUES ('RIP');
INSERT INTO estado (nombreEstado) VALUES ('On hold');
INSERT INTO estado (nombreEstado) VALUES ('Changed name');
INSERT INTO estado (nombreEstado) VALUES ('Unknown');


-- Creando generos
INSERT INTO genero (nombreGenero) VALUES('Alternative Metal');
INSERT INTO genero (nombreGenero) VALUES('Avant-Garde Metal');
INSERT INTO genero (nombreGenero) VALUES('Black Metal');
INSERT INTO genero (nombreGenero) VALUES('Crossover');
INSERT INTO genero (nombreGenero) VALUES('Dark Metal');
INSERT INTO genero (nombreGenero) VALUES('Death Metal');
#¡REF!
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


-- Creando artistas.
INSERT INTO artista (nombreArtista, origenArtista, formadoArtista, tematicaArtista, idGenero, idEstado) VALUES('Abysmal Torment','Malta',2000,'Gore.',6,1);
INSERT INTO artista (nombreArtista, origenArtista, formadoArtista, tematicaArtista, idGenero, idEstado) VALUES('Alice in chains','USA',1987,'Depression, drugs, suicide, death, pain.',22,1);
INSERT INTO artista (nombreArtista, origenArtista, formadoArtista, tematicaArtista, idGenero, idEstado) VALUES('Amon Amarth','Sweden',1992,'Vikings, warfare, Norse mythology, destruction.',45,1);
INSERT INTO artista (nombreArtista, origenArtista, formadoArtista, tematicaArtista, idGenero, idEstado) VALUES('Anthrax','USA',1981,'Humour, hardship, social issues, anti-fascism.',40,1);
INSERT INTO artista (nombreArtista, origenArtista, formadoArtista, tematicaArtista, idGenero, idEstado) VALUES('Brutal Truth','USA',1990,'Social issues, environment, politics, drugs.',16,2);
INSERT INTO artista (nombreArtista, origenArtista, formadoArtista, tematicaArtista, idGenero, idEstado) VALUES('Cannibal Corpse','USA',1988,'Gore, death, torture, cannibalism, zombies.',6,1);
INSERT INTO artista (nombreArtista, origenArtista, formadoArtista, tematicaArtista, idGenero, idEstado) VALUES('Dark Funeral','Sweden',1993,'Satanism, anti-christianity, death, armageddon.',2,1);
INSERT INTO artista (nombreArtista, origenArtista, formadoArtista, tematicaArtista, idGenero, idEstado) VALUES('DAVID GILMOUR','United kingdom',1963,'N/A',20,1);
INSERT INTO artista (nombreArtista, origenArtista, formadoArtista, tematicaArtista, idGenero, idEstado) VALUES('Dimmu Borgir','Norway',1993,'Satanism, anti-Christianity, death, misanthropy.',42,1);
INSERT INTO artista (nombreArtista, origenArtista, formadoArtista, tematicaArtista, idGenero, idEstado) VALUES('Dissection','Sweden',1989,'Death, occultism, chaos, anti-cosmic Satanism.',6,2);
INSERT INTO artista (nombreArtista, origenArtista, formadoArtista, tematicaArtista, idGenero, idEstado) VALUES('Dream theater','USA',1986,'Philosophy, emotions, addictions, phantasy, feelings.',35,1);
INSERT INTO artista (nombreArtista, origenArtista, formadoArtista, tematicaArtista, idGenero, idEstado) VALUES('Fear factory','USA',1990,'Technology, anti-religion, hate, society, sci-fi.',24,1);
INSERT INTO artista (nombreArtista, origenArtista, formadoArtista, tematicaArtista, idGenero, idEstado) VALUES('Hypocrisy','Sweden',1990,'Satanism, alien, new world order, science fiction.',6,1);
INSERT INTO artista (nombreArtista, origenArtista, formadoArtista, tematicaArtista, idGenero, idEstado) VALUES('Immolation','USA',1988,'Anti-religion, atheism, society, politics, inner struggles.',6,1);
INSERT INTO artista (nombreArtista, origenArtista, formadoArtista, tematicaArtista, idGenero, idEstado) VALUES('Immortal','Norway',1991,'Grimness, winter, war, winterdemmons, blashyrkh.',2,1);
INSERT INTO artista (nombreArtista, origenArtista, formadoArtista, tematicaArtista, idGenero, idEstado) VALUES('Incantation','USA',1989,'Satanism, occultism, anti-Christianity, blasphemy.',2,1);
INSERT INTO artista (nombreArtista, origenArtista, formadoArtista, tematicaArtista, idGenero, idEstado) VALUES('Iron maiden','United kingdom',1975,'History, literature, war, mythology, society, religion.',22,1);
INSERT INTO artista (nombreArtista, origenArtista, formadoArtista, tematicaArtista, idGenero, idEstado) VALUES('Kataklysm','Canada',1991,'Mysticisms, abstract, history, war, materialism.',2,1);
INSERT INTO artista (nombreArtista, origenArtista, formadoArtista, tematicaArtista, idGenero, idEstado) VALUES('Liquid Tension Experiment','USA',1997,'Instrumental.',34,6);
INSERT INTO artista (nombreArtista, origenArtista, formadoArtista, tematicaArtista, idGenero, idEstado) VALUES('Marduk','Sweden',1990,'Satanism, anti-Christianity, blasphemy, death, war, history.',2,1);
INSERT INTO artista (nombreArtista, origenArtista, formadoArtista, tematicaArtista, idGenero, idEstado) VALUES('Morbid Angel','USA',1983,'Ancient ones, occultism, blasphemy, Satanism, anti-religion, death.',6,1);
INSERT INTO artista (nombreArtista, origenArtista, formadoArtista, tematicaArtista, idGenero, idEstado) VALUES('Mortician','USA',1989,'Horror movies, gore.',6,1);
INSERT INTO artista (nombreArtista, origenArtista, formadoArtista, tematicaArtista, idGenero, idEstado) VALUES('Napalm death','United kingdom',1981,'Political unrest, hate, anti-fascism, social issues.',16,1);
INSERT INTO artista (nombreArtista, origenArtista, formadoArtista, tematicaArtista, idGenero, idEstado) VALUES('Opeth','Sweden',1990,'Nature, death, love, heartbreak, sorrow, seasons, occultism.',6,1);
INSERT INTO artista (nombreArtista, origenArtista, formadoArtista, tematicaArtista, idGenero, idEstado) VALUES('Satyricon','Norway',1991,'Mysticism, nature, apocalypse, anti-Christianity.',2,1);
INSERT INTO artista (nombreArtista, origenArtista, formadoArtista, tematicaArtista, idGenero, idEstado) VALUES('Setherial','Sweden',1993,'Satanism, death, darkness.',2,1);
INSERT INTO artista (nombreArtista, origenArtista, formadoArtista, tematicaArtista, idGenero, idEstado) VALUES('Slayer','USA',1981,'Satan, anti-religion, murder, war, politics.',43,1);
INSERT INTO artista (nombreArtista, origenArtista, formadoArtista, tematicaArtista, idGenero, idEstado) VALUES('Stormtroopers Of Death','USA',1985,'Humor, parody, politics, violence.',43,2);
INSERT INTO artista (nombreArtista, origenArtista, formadoArtista, tematicaArtista, idGenero, idEstado) VALUES('Strapping Young Lad','Canada',1994,'Anger, emotions, violence, humour.',6,2);
INSERT INTO artista (nombreArtista, origenArtista, formadoArtista, tematicaArtista, idGenero, idEstado) VALUES('Terrorizer','USA',1987,'Death, politics, social issues, violence.',16,1);
INSERT INTO artista (nombreArtista, origenArtista, formadoArtista, tematicaArtista, idGenero, idEstado) VALUES('Tool','USA',1990,'N/A',1,1);
INSERT INTO artista (nombreArtista, origenArtista, formadoArtista, tematicaArtista, idGenero, idEstado) VALUES('Type O Negative','USA',1990,'Depression, death, relationships, love, dark humour.',15,2);
INSERT INTO artista (nombreArtista, origenArtista, formadoArtista, tematicaArtista, idGenero, idEstado) VALUES('Vader','Poland',1983,'Necronomicon, magic, anti-religion, war, darkness.',6,1);
INSERT INTO artista (nombreArtista, origenArtista, formadoArtista, tematicaArtista, idGenero, idEstado) VALUES('Vital Remains','USA',1988,'Satanism, occultism, anti-Christianity, death.',6,1);
INSERT INTO artista (nombreArtista, origenArtista, formadoArtista, tematicaArtista, idGenero, idEstado) VALUES('War','Sweden',1995,'Satanism, war, hatred.',2,2);


-- Creando albums
INSERT INTO album (nombreAlbum, lanzamientoAlbum, idArtista) VALUES( 'Incised Wound Suicide', 2004,1);
INSERT INTO album (nombreAlbum, lanzamientoAlbum, idArtista) VALUES( 'Epoch Of Methodic Carnage', 2006,1);
INSERT INTO album (nombreAlbum, lanzamientoAlbum, idArtista) VALUES( 'Omnicide', 2009,1);
INSERT INTO album (nombreAlbum, lanzamientoAlbum, idArtista) VALUES( 'Cultivate The Apostate', 2015,1);
INSERT INTO album (nombreAlbum, lanzamientoAlbum, idArtista) VALUES( 'Dirt', 1992,2);
INSERT INTO album (nombreAlbum, lanzamientoAlbum, idArtista) VALUES( 'Sap', 1992,2);
INSERT INTO album (nombreAlbum, lanzamientoAlbum, idArtista) VALUES( 'Jar Of Flies', 1994,2);
INSERT INTO album (nombreAlbum, lanzamientoAlbum, idArtista) VALUES( 'Alice In Chains', 1995,2);
INSERT INTO album (nombreAlbum, lanzamientoAlbum, idArtista) VALUES( 'Bank Heist', 1998,2);
INSERT INTO album (nombreAlbum, lanzamientoAlbum, idArtista) VALUES( 'Nothing Safe', 1999,2);
INSERT INTO album (nombreAlbum, lanzamientoAlbum, idArtista) VALUES( 'The Devil Put Dinosaurs', 2013,2);
INSERT INTO album (nombreAlbum, lanzamientoAlbum, idArtista) VALUES( 'Versus The World', 2001,3);
INSERT INTO album (nombreAlbum, lanzamientoAlbum, idArtista) VALUES( 'Fate Of Norns', 2004,3);
INSERT INTO album (nombreAlbum, lanzamientoAlbum, idArtista) VALUES( 'With Oden On Our Side', 2006,3);
INSERT INTO album (nombreAlbum, lanzamientoAlbum, idArtista) VALUES( 'Twilight Of The Thunder God', 2008,3);
INSERT INTO album (nombreAlbum, lanzamientoAlbum, idArtista) VALUES( 'Hymns To The Rising Sun', 2010,3);
INSERT INTO album (nombreAlbum, lanzamientoAlbum, idArtista) VALUES( 'Surtur Rising', 2011,3);
INSERT INTO album (nombreAlbum, lanzamientoAlbum, idArtista) VALUES( 'Deceiver of The Gods', 2013,3);
INSERT INTO album (nombreAlbum, lanzamientoAlbum, idArtista) VALUES( 'Jomsviking', 2016,3);
INSERT INTO album (nombreAlbum, lanzamientoAlbum, idArtista) VALUES( 'Fistful Of Metal', 1983,4);
INSERT INTO album (nombreAlbum, lanzamientoAlbum, idArtista) VALUES( 'Spreading The Disease', 1985,4);
INSERT INTO album (nombreAlbum, lanzamientoAlbum, idArtista) VALUES( 'Among The Living', 1987,4);
INSERT INTO album (nombreAlbum, lanzamientoAlbum, idArtista) VALUES( 'Fistful Of Anthrax (Japan Polystar P33R-20007)', 1987,4);
INSERT INTO album (nombreAlbum, lanzamientoAlbum, idArtista) VALUES( 'State Of Euphoria', 1988,4);
INSERT INTO album (nombreAlbum, lanzamientoAlbum, idArtista) VALUES( 'Persistence Of Time', 1989,4);
INSERT INTO album (nombreAlbum, lanzamientoAlbum, idArtista) VALUES( 'Sound Of White Noise', 1993,4);
INSERT INTO album (nombreAlbum, lanzamientoAlbum, idArtista) VALUES( 'Extreme Conditions Demand Extreme Responses', 1992,5);
INSERT INTO album (nombreAlbum, lanzamientoAlbum, idArtista) VALUES( 'Need To Control', 1994,5);
INSERT INTO album (nombreAlbum, lanzamientoAlbum, idArtista) VALUES( 'Kill Trend Suicide', 1996,5);
INSERT INTO album (nombreAlbum, lanzamientoAlbum, idArtista) VALUES( 'Sounds Of The Animal Kingdom', 1997,5);
INSERT INTO album (nombreAlbum, lanzamientoAlbum, idArtista) VALUES( 'Evolution Through Revolution', 2009,5);
INSERT INTO album (nombreAlbum, lanzamientoAlbum, idArtista) VALUES( 'Eaten Back To Life (Re-Released)', 1990,6);
INSERT INTO album (nombreAlbum, lanzamientoAlbum, idArtista) VALUES( 'Butchered At Birth', 1991,6);
INSERT INTO album (nombreAlbum, lanzamientoAlbum, idArtista) VALUES( 'Tomb Of The Mutilated', 1992,6);
INSERT INTO album (nombreAlbum, lanzamientoAlbum, idArtista) VALUES( 'The Bleeding', 1994,6);
INSERT INTO album (nombreAlbum, lanzamientoAlbum, idArtista) VALUES( 'Vile', 1996,6);
INSERT INTO album (nombreAlbum, lanzamientoAlbum, idArtista) VALUES( 'Gallery Of Suicide', 1998,6);
INSERT INTO album (nombreAlbum, lanzamientoAlbum, idArtista) VALUES( 'Bloodthirst', 1999,6);
INSERT INTO album (nombreAlbum, lanzamientoAlbum, idArtista) VALUES( 'Live Cannibalism', 2000,6);
INSERT INTO album (nombreAlbum, lanzamientoAlbum, idArtista) VALUES( 'Gore Obsessed', 2002,6);
INSERT INTO album (nombreAlbum, lanzamientoAlbum, idArtista) VALUES( 'Worm Infested [EP]', 2002,6);
INSERT INTO album (nombreAlbum, lanzamientoAlbum, idArtista) VALUES( 'The Wretched Spawn', 2004,6);
INSERT INTO album (nombreAlbum, lanzamientoAlbum, idArtista) VALUES( 'Kill', 2006,6);
INSERT INTO album (nombreAlbum, lanzamientoAlbum, idArtista) VALUES( 'Evisceration Plague', 2009,6);
INSERT INTO album (nombreAlbum, lanzamientoAlbum, idArtista) VALUES( 'Torture', 2012,6);
INSERT INTO album (nombreAlbum, lanzamientoAlbum, idArtista) VALUES( 'A Skeletal Domain', 2014,6);
INSERT INTO album (nombreAlbum, lanzamientoAlbum, idArtista) VALUES( 'The Secrets Of The Black Arts', 1996,7);
INSERT INTO album (nombreAlbum, lanzamientoAlbum, idArtista) VALUES( 'Vobiscum Satanas', 1996,7);
INSERT INTO album (nombreAlbum, lanzamientoAlbum, idArtista) VALUES( 'In The Sign (EP)', 2000,7);
INSERT INTO album (nombreAlbum, lanzamientoAlbum, idArtista) VALUES( 'Teach Children To Worship Satan (EP)', 2000,7);
INSERT INTO album (nombreAlbum, lanzamientoAlbum, idArtista) VALUES( 'Diabolis Interium', 2001,7);
INSERT INTO album (nombreAlbum, lanzamientoAlbum, idArtista) VALUES( 'Under Wings Of Hell (Split With Infernal)', 2002,7);
INSERT INTO album (nombreAlbum, lanzamientoAlbum, idArtista) VALUES( 'De Profundis Clamavi Ad Te Domine (Live Album)', 2004,7);
INSERT INTO album (nombreAlbum, lanzamientoAlbum, idArtista) VALUES( 'Attera Totus Sanctus', 2005,7);
INSERT INTO album (nombreAlbum, lanzamientoAlbum, idArtista) VALUES( 'Angelus Exuro Pro Eternus', 2009,7);
INSERT INTO album (nombreAlbum, lanzamientoAlbum, idArtista) VALUES( 'Nail Them To The Cross (single)', 2015,7);
INSERT INTO album (nombreAlbum, lanzamientoAlbum, idArtista) VALUES( 'Where Shadows Forever Reign', 2016,7);
INSERT INTO album (nombreAlbum, lanzamientoAlbum, idArtista) VALUES( 'David Gilmour', 1978,8);
INSERT INTO album (nombreAlbum, lanzamientoAlbum, idArtista) VALUES( 'About Face', 1984,8);
INSERT INTO album (nombreAlbum, lanzamientoAlbum, idArtista) VALUES( 'Kabuki Fever', 1984,8);
INSERT INTO album (nombreAlbum, lanzamientoAlbum, idArtista) VALUES( 'On an Island', 2006,8);
INSERT INTO album (nombreAlbum, lanzamientoAlbum, idArtista) VALUES( 'Live in Gdańsk', 2008,8);
INSERT INTO album (nombreAlbum, lanzamientoAlbum, idArtista) VALUES( 'Rattle That Lock', 2015,8);
INSERT INTO album (nombreAlbum, lanzamientoAlbum, idArtista) VALUES( 'L.A 3rd Night', 2016,8);
INSERT INTO album (nombreAlbum, lanzamientoAlbum, idArtista) VALUES( 'Stormblåst', 1996,9);
INSERT INTO album (nombreAlbum, lanzamientoAlbum, idArtista) VALUES( 'Enthrone Darkness Triumphant', 1997,9);
INSERT INTO album (nombreAlbum, lanzamientoAlbum, idArtista) VALUES( 'Spiritual Black Dimensions', 1999,9);
INSERT INTO album (nombreAlbum, lanzamientoAlbum, idArtista) VALUES( 'Puritanical Euphoric Misanthropia', 2001,9);
INSERT INTO album (nombreAlbum, lanzamientoAlbum, idArtista) VALUES( 'World Misanthropy', 2002,9);
INSERT INTO album (nombreAlbum, lanzamientoAlbum, idArtista) VALUES( 'Death Cult Armageddon', 2003,9);
INSERT INTO album (nombreAlbum, lanzamientoAlbum, idArtista) VALUES( 'In Sorte Diaboli', 2007,9);
INSERT INTO album (nombreAlbum, lanzamientoAlbum, idArtista) VALUES( 'Abrahadabra', 2010,9);
INSERT INTO album (nombreAlbum, lanzamientoAlbum, idArtista) VALUES( 'Into Infinite Obscurity (EP) 192kbps', 1991,10);
INSERT INTO album (nombreAlbum, lanzamientoAlbum, idArtista) VALUES( 'The Somberlain 320kbps', 1993,10);
INSERT INTO album (nombreAlbum, lanzamientoAlbum, idArtista) VALUES( 'Storm of the Lights Bane 320kbps', 1995,10);
INSERT INTO album (nombreAlbum, lanzamientoAlbum, idArtista) VALUES( 'Reinkaos 320kbps', 2006,10);
INSERT INTO album (nombreAlbum, lanzamientoAlbum, idArtista) VALUES( 'When Dream And Day Unite', 1989,11);
INSERT INTO album (nombreAlbum, lanzamientoAlbum, idArtista) VALUES( 'Images and Words', 1992,11);
INSERT INTO album (nombreAlbum, lanzamientoAlbum, idArtista) VALUES( 'Awake', 1994,11);
INSERT INTO album (nombreAlbum, lanzamientoAlbum, idArtista) VALUES( 'A Change of Seasons', 1995,11);
INSERT INTO album (nombreAlbum, lanzamientoAlbum, idArtista) VALUES( 'Falling Into Infinity', 1997,11);
INSERT INTO album (nombreAlbum, lanzamientoAlbum, idArtista) VALUES( 'Metropolis Pt.2 Scenes From A Memory', 1999,11);
INSERT INTO album (nombreAlbum, lanzamientoAlbum, idArtista) VALUES( 'Train of Thought', 2003,11);
INSERT INTO album (nombreAlbum, lanzamientoAlbum, idArtista) VALUES( 'Octavarium', 2005,11);
INSERT INTO album (nombreAlbum, lanzamientoAlbum, idArtista) VALUES( 'Systematic Chaos', 2007,11);
INSERT INTO album (nombreAlbum, lanzamientoAlbum, idArtista) VALUES( 'Black Clouds and Silver Linings', 2009,11);
INSERT INTO album (nombreAlbum, lanzamientoAlbum, idArtista) VALUES( 'Soul Of A New Machine', 1992,12);
INSERT INTO album (nombreAlbum, lanzamientoAlbum, idArtista) VALUES( 'Demanufacture', 1996,12);
INSERT INTO album (nombreAlbum, lanzamientoAlbum, idArtista) VALUES( 'Obsolete', 1998,12);
INSERT INTO album (nombreAlbum, lanzamientoAlbum, idArtista) VALUES( 'Digimortal', 2001,12);
INSERT INTO album (nombreAlbum, lanzamientoAlbum, idArtista) VALUES( 'Archetype', 2004,12);
INSERT INTO album (nombreAlbum, lanzamientoAlbum, idArtista) VALUES( 'Penetralia', 1992,13);
INSERT INTO album (nombreAlbum, lanzamientoAlbum, idArtista) VALUES( 'Osculum Obscenum', 1993,13);
INSERT INTO album (nombreAlbum, lanzamientoAlbum, idArtista) VALUES( 'The Fourth Dimension', 1994,13);
INSERT INTO album (nombreAlbum, lanzamientoAlbum, idArtista) VALUES( 'Abducted', 1996,13);
INSERT INTO album (nombreAlbum, lanzamientoAlbum, idArtista) VALUES( 'The Final Chapter', 1997,13);
INSERT INTO album (nombreAlbum, lanzamientoAlbum, idArtista) VALUES( 'Hypocrisy', 1999,13);
INSERT INTO album (nombreAlbum, lanzamientoAlbum, idArtista) VALUES( 'Hypocrisy Destroys Wacken', 1999,13);
INSERT INTO album (nombreAlbum, lanzamientoAlbum, idArtista) VALUES( 'The Arrival', 2004,13);
INSERT INTO album (nombreAlbum, lanzamientoAlbum, idArtista) VALUES( 'Virus', 2005,13);
INSERT INTO album (nombreAlbum, lanzamientoAlbum, idArtista) VALUES( 'Dawn Of Possession', 1991,14);
INSERT INTO album (nombreAlbum, lanzamientoAlbum, idArtista) VALUES( 'Failures For Gods', 1999,14);
INSERT INTO album (nombreAlbum, lanzamientoAlbum, idArtista) VALUES( 'Close to a World Below', 2000,14);
INSERT INTO album (nombreAlbum, lanzamientoAlbum, idArtista) VALUES( 'Unholy Cult', 2002,14);
INSERT INTO album (nombreAlbum, lanzamientoAlbum, idArtista) VALUES( 'Harnessing Ruin', 2005,14);
INSERT INTO album (nombreAlbum, lanzamientoAlbum, idArtista) VALUES( 'Shadows In The Light', 2007,14);
INSERT INTO album (nombreAlbum, lanzamientoAlbum, idArtista) VALUES( 'Majesty and Decay', 2010,14);
INSERT INTO album (nombreAlbum, lanzamientoAlbum, idArtista) VALUES( 'Kingdom Of Conspiracy', 2013,14);
INSERT INTO album (nombreAlbum, lanzamientoAlbum, idArtista) VALUES( 'Atonement', 2017,14);
INSERT INTO album (nombreAlbum, lanzamientoAlbum, idArtista) VALUES( 'Diabolical Fullmoon Mysticism', 1991,15);
INSERT INTO album (nombreAlbum, lanzamientoAlbum, idArtista) VALUES( 'Pure Holocaust', 1993,15);
INSERT INTO album (nombreAlbum, lanzamientoAlbum, idArtista) VALUES( 'Battles In The North', 1996,15);
INSERT INTO album (nombreAlbum, lanzamientoAlbum, idArtista) VALUES( 'Blizzard Beasts', 1997,15);
INSERT INTO album (nombreAlbum, lanzamientoAlbum, idArtista) VALUES( 'Onward To Golgotha', 1992,16);
INSERT INTO album (nombreAlbum, lanzamientoAlbum, idArtista) VALUES( 'Mortal Throne Of Nazarene', 1992,16);
INSERT INTO album (nombreAlbum, lanzamientoAlbum, idArtista) VALUES( 'The Forsaken Mourning Of Angelic Anguish', 1997,16);
INSERT INTO album (nombreAlbum, lanzamientoAlbum, idArtista) VALUES( 'Diabolical Conquest', 1998,16);
INSERT INTO album (nombreAlbum, lanzamientoAlbum, idArtista) VALUES( 'The Infernal Storm', 2000,16);
INSERT INTO album (nombreAlbum, lanzamientoAlbum, idArtista) VALUES( 'Live Blasphemy', 2001,16);
INSERT INTO album (nombreAlbum, lanzamientoAlbum, idArtista) VALUES( 'Blasphemy', 2002,16);
INSERT INTO album (nombreAlbum, lanzamientoAlbum, idArtista) VALUES( 'Iron Maiden', 1980,17);
INSERT INTO album (nombreAlbum, lanzamientoAlbum, idArtista) VALUES( 'Killers', 1981,17);
INSERT INTO album (nombreAlbum, lanzamientoAlbum, idArtista) VALUES( 'The Number of the Beast', 1982,17);
INSERT INTO album (nombreAlbum, lanzamientoAlbum, idArtista) VALUES( 'Piece of Mind', 1983,17);
INSERT INTO album (nombreAlbum, lanzamientoAlbum, idArtista) VALUES( 'Powerslave', 1984,17);
INSERT INTO album (nombreAlbum, lanzamientoAlbum, idArtista) VALUES( 'Live after Death', 1985,17);
INSERT INTO album (nombreAlbum, lanzamientoAlbum, idArtista) VALUES( 'Somewere in Time', 1986,17);
INSERT INTO album (nombreAlbum, lanzamientoAlbum, idArtista) VALUES( 'Seventh Son of a Seventh Son', 1988,17);
INSERT INTO album (nombreAlbum, lanzamientoAlbum, idArtista) VALUES( 'No Prayer for the Dying', 1990,17);
INSERT INTO album (nombreAlbum, lanzamientoAlbum, idArtista) VALUES( 'Fear of the Dark', 1992,17);
INSERT INTO album (nombreAlbum, lanzamientoAlbum, idArtista) VALUES( 'The X Factor', 1995,17);
INSERT INTO album (nombreAlbum, lanzamientoAlbum, idArtista) VALUES( 'Virus', 1996,17);
INSERT INTO album (nombreAlbum, lanzamientoAlbum, idArtista) VALUES( 'Virtual XI', 1998,17);
INSERT INTO album (nombreAlbum, lanzamientoAlbum, idArtista) VALUES( 'Brave New World', 2000,17);
INSERT INTO album (nombreAlbum, lanzamientoAlbum, idArtista) VALUES( 'Rock in Rio', 2002,17);
INSERT INTO album (nombreAlbum, lanzamientoAlbum, idArtista) VALUES( 'Dance of Death', 2003,17);
INSERT INTO album (nombreAlbum, lanzamientoAlbum, idArtista) VALUES( 'A Matter of Life and Death', 2006,17);
INSERT INTO album (nombreAlbum, lanzamientoAlbum, idArtista) VALUES( 'The Final Frontier', 2010,17);
INSERT INTO album (nombreAlbum, lanzamientoAlbum, idArtista) VALUES( 'En Vivo!', 2012,17);
INSERT INTO album (nombreAlbum, lanzamientoAlbum, idArtista) VALUES( 'The Book of Souls', 2015,17);
INSERT INTO album (nombreAlbum, lanzamientoAlbum, idArtista) VALUES( 'Sorcery', 1995,18);
INSERT INTO album (nombreAlbum, lanzamientoAlbum, idArtista) VALUES( 'The Mystical Gate Of Reincarnation', 1993,18);
INSERT INTO album (nombreAlbum, lanzamientoAlbum, idArtista) VALUES( 'The Temple Of Knowledge', 1996,18);
INSERT INTO album (nombreAlbum, lanzamientoAlbum, idArtista) VALUES( 'Liquid Tension Experiment', 1998,19);
INSERT INTO album (nombreAlbum, lanzamientoAlbum, idArtista) VALUES( 'Liquid Tension Experiment II', 1999,19);
INSERT INTO album (nombreAlbum, lanzamientoAlbum, idArtista) VALUES( 'LTE Live 2008', 2009,19);
INSERT INTO album (nombreAlbum, lanzamientoAlbum, idArtista) VALUES( 'Dark Endless', 1992,20);
INSERT INTO album (nombreAlbum, lanzamientoAlbum, idArtista) VALUES( 'Opus Nocturne', 1992,20);
INSERT INTO album (nombreAlbum, lanzamientoAlbum, idArtista) VALUES( 'Heaven Shall Burn... When We Are Gathered', 1996,20);
INSERT INTO album (nombreAlbum, lanzamientoAlbum, idArtista) VALUES( 'Panzer Division', 1999,20);
INSERT INTO album (nombreAlbum, lanzamientoAlbum, idArtista) VALUES( 'La Grande Danse Macabre', 2001,20);
INSERT INTO album (nombreAlbum, lanzamientoAlbum, idArtista) VALUES( 'World Funeral', 2003,20);
INSERT INTO album (nombreAlbum, lanzamientoAlbum, idArtista) VALUES( 'Plague Angel', 2004,20);
INSERT INTO album (nombreAlbum, lanzamientoAlbum, idArtista) VALUES( 'Rom', 2007,20);
INSERT INTO album (nombreAlbum, lanzamientoAlbum, idArtista) VALUES( 'Frontschwein', 2015,20);
INSERT INTO album (nombreAlbum, lanzamientoAlbum, idArtista) VALUES( 'Abominations Of Desolation (original in 1986)', 1991,21);
INSERT INTO album (nombreAlbum, lanzamientoAlbum, idArtista) VALUES( 'Altars Of Madness', 1989,21);
INSERT INTO album (nombreAlbum, lanzamientoAlbum, idArtista) VALUES( 'Blessed Are The Sick', 1991,21);
INSERT INTO album (nombreAlbum, lanzamientoAlbum, idArtista) VALUES( 'Covenant', 1993,21);
INSERT INTO album (nombreAlbum, lanzamientoAlbum, idArtista) VALUES( 'Domination', 1995,21);
INSERT INTO album (nombreAlbum, lanzamientoAlbum, idArtista) VALUES( 'Entangled In Chaos', 1996,21);
INSERT INTO album (nombreAlbum, lanzamientoAlbum, idArtista) VALUES( 'Formulas Fatal to the Flesh', 1998,21);
INSERT INTO album (nombreAlbum, lanzamientoAlbum, idArtista) VALUES( 'Gateways To Annihilation', 2000,21);
INSERT INTO album (nombreAlbum, lanzamientoAlbum, idArtista) VALUES( 'Heretic', 2003,21);
INSERT INTO album (nombreAlbum, lanzamientoAlbum, idArtista) VALUES( 'House By The Cemetery', 1995,22);
INSERT INTO album (nombreAlbum, lanzamientoAlbum, idArtista) VALUES( 'Hacked Up For Barbecue', 1996,22);
INSERT INTO album (nombreAlbum, lanzamientoAlbum, idArtista) VALUES( 'Zombie Apocalypse', 1998,22);
INSERT INTO album (nombreAlbum, lanzamientoAlbum, idArtista) VALUES( 'Chainsaw Dismemberment', 1999,22);
INSERT INTO album (nombreAlbum, lanzamientoAlbum, idArtista) VALUES( 'Domain of Death', 2001,22);
INSERT INTO album (nombreAlbum, lanzamientoAlbum, idArtista) VALUES( 'Darkest Day Of Horror', 2003,22);
INSERT INTO album (nombreAlbum, lanzamientoAlbum, idArtista) VALUES( 'From Enslavement To Obliteration', 1988,23);
INSERT INTO album (nombreAlbum, lanzamientoAlbum, idArtista) VALUES( 'Harmony Corruption', 1990,23);
INSERT INTO album (nombreAlbum, lanzamientoAlbum, idArtista) VALUES( 'Utopia Banished', 1992,23);
INSERT INTO album (nombreAlbum, lanzamientoAlbum, idArtista) VALUES( 'Diatribes', 1996,23);
INSERT INTO album (nombreAlbum, lanzamientoAlbum, idArtista) VALUES( 'Inside The Torn Apart', 1996,23);
INSERT INTO album (nombreAlbum, lanzamientoAlbum, idArtista) VALUES( 'Order Of The Leech', 2003,23);
INSERT INTO album (nombreAlbum, lanzamientoAlbum, idArtista) VALUES( 'The Code Is Red... Long Live The Code', 2005,23);
INSERT INTO album (nombreAlbum, lanzamientoAlbum, idArtista) VALUES( 'Smear Campaign', 2006,23);
INSERT INTO album (nombreAlbum, lanzamientoAlbum, idArtista) VALUES( 'Time Waits For No Slave', 2009,23);
INSERT INTO album (nombreAlbum, lanzamientoAlbum, idArtista) VALUES( 'Orchid', 1995,24);
INSERT INTO album (nombreAlbum, lanzamientoAlbum, idArtista) VALUES( 'Morningrise', 1996,24);
INSERT INTO album (nombreAlbum, lanzamientoAlbum, idArtista) VALUES( 'My Arms, Your Hearse', 1998,24);
INSERT INTO album (nombreAlbum, lanzamientoAlbum, idArtista) VALUES( 'Still Life', 1999,24);
INSERT INTO album (nombreAlbum, lanzamientoAlbum, idArtista) VALUES( 'Blackwater Park', 2001,24);
INSERT INTO album (nombreAlbum, lanzamientoAlbum, idArtista) VALUES( 'Deliverance', 2002,24);
INSERT INTO album (nombreAlbum, lanzamientoAlbum, idArtista) VALUES( 'Damnation', 2003,24);
INSERT INTO album (nombreAlbum, lanzamientoAlbum, idArtista) VALUES( 'Ghost Reveries', 2006,24);
INSERT INTO album (nombreAlbum, lanzamientoAlbum, idArtista) VALUES( 'The Roundhouse Tapes', 2007,24);
INSERT INTO album (nombreAlbum, lanzamientoAlbum, idArtista) VALUES( 'Watershed', 2008,24);
INSERT INTO album (nombreAlbum, lanzamientoAlbum, idArtista) VALUES( 'Heritage', 2011,24);
INSERT INTO album (nombreAlbum, lanzamientoAlbum, idArtista) VALUES( 'Pale Communion', 2014,24);
INSERT INTO album (nombreAlbum, lanzamientoAlbum, idArtista) VALUES( 'Sorceress', 2016,24);
INSERT INTO album (nombreAlbum, lanzamientoAlbum, idArtista) VALUES( 'Dark Medieval Times', 1993,25);
INSERT INTO album (nombreAlbum, lanzamientoAlbum, idArtista) VALUES( 'The Shadowthrone', 1994,25);
INSERT INTO album (nombreAlbum, lanzamientoAlbum, idArtista) VALUES( 'Nemesis Divina', 1996,25);
INSERT INTO album (nombreAlbum, lanzamientoAlbum, idArtista) VALUES( 'Nord', 1996,26);
INSERT INTO album (nombreAlbum, lanzamientoAlbum, idArtista) VALUES( 'Lords of the Nightrealm', 1997,26);
INSERT INTO album (nombreAlbum, lanzamientoAlbum, idArtista) VALUES( 'Endtime Divine', 2003,26);
INSERT INTO album (nombreAlbum, lanzamientoAlbum, idArtista) VALUES( 'From the Ancient Ruins', 2006,26);
INSERT INTO album (nombreAlbum, lanzamientoAlbum, idArtista) VALUES( 'Death Triumphant', 2006,26);
INSERT INTO album (nombreAlbum, lanzamientoAlbum, idArtista) VALUES( 'Ekpyrosis', 2010,26);
INSERT INTO album (nombreAlbum, lanzamientoAlbum, idArtista) VALUES( 'Show No Mercy', 1983,27);
INSERT INTO album (nombreAlbum, lanzamientoAlbum, idArtista) VALUES( 'Live Undead', 1984,27);
INSERT INTO album (nombreAlbum, lanzamientoAlbum, idArtista) VALUES( 'Hell Awaits', 1985,27);
INSERT INTO album (nombreAlbum, lanzamientoAlbum, idArtista) VALUES( 'Reign In Blood', 1986,27);
INSERT INTO album (nombreAlbum, lanzamientoAlbum, idArtista) VALUES( 'South Of Heaven', 1988,27);
INSERT INTO album (nombreAlbum, lanzamientoAlbum, idArtista) VALUES( 'Seasons In The Abyss', 1988,27);
INSERT INTO album (nombreAlbum, lanzamientoAlbum, idArtista) VALUES( 'Decade Of Aggression', 1991,27);
INSERT INTO album (nombreAlbum, lanzamientoAlbum, idArtista) VALUES( 'Divine Intervention', 1994,27);
INSERT INTO album (nombreAlbum, lanzamientoAlbum, idArtista) VALUES( 'God Hates Us', 2001,27);
INSERT INTO album (nombreAlbum, lanzamientoAlbum, idArtista) VALUES( 'Speak English Or Die', 1985,28);
INSERT INTO album (nombreAlbum, lanzamientoAlbum, idArtista) VALUES( 'Bigger Than The Devil', 1999,28);
INSERT INTO album (nombreAlbum, lanzamientoAlbum, idArtista) VALUES( 'Live At Budokan', 1992,28);
INSERT INTO album (nombreAlbum, lanzamientoAlbum, idArtista) VALUES( 'City', 1999,29);
INSERT INTO album (nombreAlbum, lanzamientoAlbum, idArtista) VALUES( 'Strapping Young Lad', 2003,29);
INSERT INTO album (nombreAlbum, lanzamientoAlbum, idArtista) VALUES( 'For Those Aboot To Rock', 2004,29);
INSERT INTO album (nombreAlbum, lanzamientoAlbum, idArtista) VALUES( 'Alien', 2005,29);
INSERT INTO album (nombreAlbum, lanzamientoAlbum, idArtista) VALUES( 'The New Black', 2006,29);
INSERT INTO album (nombreAlbum, lanzamientoAlbum, idArtista) VALUES( 'World Downfall', 1989,30);
INSERT INTO album (nombreAlbum, lanzamientoAlbum, idArtista) VALUES( 'From The Tomb', 2003,30);
INSERT INTO album (nombreAlbum, lanzamientoAlbum, idArtista) VALUES( 'Darker Days Ahead', 2006,30);
INSERT INTO album (nombreAlbum, lanzamientoAlbum, idArtista) VALUES( 'Aenima', 1996,31);
INSERT INTO album (nombreAlbum, lanzamientoAlbum, idArtista) VALUES( 'Lateralus', 2001,31);
INSERT INTO album (nombreAlbum, lanzamientoAlbum, idArtista) VALUES( '10000 Days', 2006,31);
INSERT INTO album (nombreAlbum, lanzamientoAlbum, idArtista) VALUES( 'Slow, Deep And Hard', 1991,32);
INSERT INTO album (nombreAlbum, lanzamientoAlbum, idArtista) VALUES( 'Bloody Kisses', 1993,32);
INSERT INTO album (nombreAlbum, lanzamientoAlbum, idArtista) VALUES( 'October Rust', 1996,32);
INSERT INTO album (nombreAlbum, lanzamientoAlbum, idArtista) VALUES( 'World Coming Down', 1999,32);
INSERT INTO album (nombreAlbum, lanzamientoAlbum, idArtista) VALUES( 'The Ultimate Incantation', 1992,33);
INSERT INTO album (nombreAlbum, lanzamientoAlbum, idArtista) VALUES( 'Sothis', 1994,33);
INSERT INTO album (nombreAlbum, lanzamientoAlbum, idArtista) VALUES( 'The Darkest Age Live 93', 1994,33);
INSERT INTO album (nombreAlbum, lanzamientoAlbum, idArtista) VALUES( 'De Profundis', 1995,33);
INSERT INTO album (nombreAlbum, lanzamientoAlbum, idArtista) VALUES( 'Future Of The Past', 1996,33);
INSERT INTO album (nombreAlbum, lanzamientoAlbum, idArtista) VALUES( 'Black To The Blind', 1997,33);
INSERT INTO album (nombreAlbum, lanzamientoAlbum, idArtista) VALUES( 'Reborn In Chaos', 1997,33);
INSERT INTO album (nombreAlbum, lanzamientoAlbum, idArtista) VALUES( 'Live in Japan', 1999,33);
INSERT INTO album (nombreAlbum, lanzamientoAlbum, idArtista) VALUES( 'Litany', 2000,33);
INSERT INTO album (nombreAlbum, lanzamientoAlbum, idArtista) VALUES( 'Revelations', 2002,33);
INSERT INTO album (nombreAlbum, lanzamientoAlbum, idArtista) VALUES( 'The Beast', 2004,33);
INSERT INTO album (nombreAlbum, lanzamientoAlbum, idArtista) VALUES( 'Let Us Pray', 1992,34);
INSERT INTO album (nombreAlbum, lanzamientoAlbum, idArtista) VALUES( 'Into Cold Darkness', 1995,34);
INSERT INTO album (nombreAlbum, lanzamientoAlbum, idArtista) VALUES( 'Forever Underground', 1995,34);
INSERT INTO album (nombreAlbum, lanzamientoAlbum, idArtista) VALUES( 'Dawn Of The Apocalypse', 2000,34);
INSERT INTO album (nombreAlbum, lanzamientoAlbum, idArtista) VALUES( 'Dechristianize', 2003,34);
INSERT INTO album (nombreAlbum, lanzamientoAlbum, idArtista) VALUES( 'Horrors Of Hell', 2006,34);
INSERT INTO album (nombreAlbum, lanzamientoAlbum, idArtista) VALUES( 'Icons Of Evil', 2007,34);
INSERT INTO album (nombreAlbum, lanzamientoAlbum, idArtista) VALUES( 'Total War', 1997,35);
INSERT INTO album (nombreAlbum, lanzamientoAlbum, idArtista) VALUES( 'We Are War', 1999,35);



-- Creando relacion de album con formato.
INSERT INTO album_formato (idAlbum, idFormato) VALUES (1, 3);
INSERT INTO album_formato (idAlbum, idFormato) VALUES (2, 3);
INSERT INTO album_formato (idAlbum, idFormato) VALUES (3, 3);
INSERT INTO album_formato (idAlbum, idFormato) VALUES (4, 3);
INSERT INTO album_formato (idAlbum, idFormato) VALUES (5, 3);
INSERT INTO album_formato (idAlbum, idFormato) VALUES (6, 3);
INSERT INTO album_formato (idAlbum, idFormato) VALUES (7, 3);
INSERT INTO album_formato (idAlbum, idFormato) VALUES (8, 3);
INSERT INTO album_formato (idAlbum, idFormato) VALUES (9, 3);
INSERT INTO album_formato (idAlbum, idFormato) VALUES (10, 3);
INSERT INTO album_formato (idAlbum, idFormato) VALUES (11, 3);
INSERT INTO album_formato (idAlbum, idFormato) VALUES (12, 3);
INSERT INTO album_formato (idAlbum, idFormato) VALUES (13, 3);
INSERT INTO album_formato (idAlbum, idFormato) VALUES (14, 3);
INSERT INTO album_formato (idAlbum, idFormato) VALUES (15, 3);
INSERT INTO album_formato (idAlbum, idFormato) VALUES (16, 3);
INSERT INTO album_formato (idAlbum, idFormato) VALUES (17, 3);
INSERT INTO album_formato (idAlbum, idFormato) VALUES (18, 3);
INSERT INTO album_formato (idAlbum, idFormato) VALUES (19, 3);
INSERT INTO album_formato (idAlbum, idFormato) VALUES (20, 3);
INSERT INTO album_formato (idAlbum, idFormato) VALUES (21, 3);
INSERT INTO album_formato (idAlbum, idFormato) VALUES (22, 3);
INSERT INTO album_formato (idAlbum, idFormato) VALUES (23, 3);
INSERT INTO album_formato (idAlbum, idFormato) VALUES (24, 3);
INSERT INTO album_formato (idAlbum, idFormato) VALUES (25, 3);
INSERT INTO album_formato (idAlbum, idFormato) VALUES (26, 3);
INSERT INTO album_formato (idAlbum, idFormato) VALUES (27, 3);
INSERT INTO album_formato (idAlbum, idFormato) VALUES (28, 3);
INSERT INTO album_formato (idAlbum, idFormato) VALUES (29, 3);
INSERT INTO album_formato (idAlbum, idFormato) VALUES (30, 3);
INSERT INTO album_formato (idAlbum, idFormato) VALUES (31, 3);
INSERT INTO album_formato (idAlbum, idFormato) VALUES (32, 3);
INSERT INTO album_formato (idAlbum, idFormato) VALUES (33, 3);
INSERT INTO album_formato (idAlbum, idFormato) VALUES (34, 3);
INSERT INTO album_formato (idAlbum, idFormato) VALUES (35, 3);
INSERT INTO album_formato (idAlbum, idFormato) VALUES (36, 3);
INSERT INTO album_formato (idAlbum, idFormato) VALUES (37, 3);
INSERT INTO album_formato (idAlbum, idFormato) VALUES (38, 3);
INSERT INTO album_formato (idAlbum, idFormato) VALUES (39, 3);
INSERT INTO album_formato (idAlbum, idFormato) VALUES (40, 3);
INSERT INTO album_formato (idAlbum, idFormato) VALUES (41, 3);
INSERT INTO album_formato (idAlbum, idFormato) VALUES (42, 3);
INSERT INTO album_formato (idAlbum, idFormato) VALUES (43, 3);
INSERT INTO album_formato (idAlbum, idFormato) VALUES (44, 3);
INSERT INTO album_formato (idAlbum, idFormato) VALUES (45, 3);
INSERT INTO album_formato (idAlbum, idFormato) VALUES (46, 3);
INSERT INTO album_formato (idAlbum, idFormato) VALUES (47, 3);
INSERT INTO album_formato (idAlbum, idFormato) VALUES (48, 3);
INSERT INTO album_formato (idAlbum, idFormato) VALUES (49, 3);
INSERT INTO album_formato (idAlbum, idFormato) VALUES (50, 3);
INSERT INTO album_formato (idAlbum, idFormato) VALUES (51, 3);
INSERT INTO album_formato (idAlbum, idFormato) VALUES (52, 3);
INSERT INTO album_formato (idAlbum, idFormato) VALUES (53, 3);
INSERT INTO album_formato (idAlbum, idFormato) VALUES (54, 3);
INSERT INTO album_formato (idAlbum, idFormato) VALUES (55, 3);
INSERT INTO album_formato (idAlbum, idFormato) VALUES (56, 3);
INSERT INTO album_formato (idAlbum, idFormato) VALUES (57, 3);
INSERT INTO album_formato (idAlbum, idFormato) VALUES (58, 3);
INSERT INTO album_formato (idAlbum, idFormato) VALUES (59, 3);
INSERT INTO album_formato (idAlbum, idFormato) VALUES (60, 3);
INSERT INTO album_formato (idAlbum, idFormato) VALUES (61, 3);
INSERT INTO album_formato (idAlbum, idFormato) VALUES (62, 3);
INSERT INTO album_formato (idAlbum, idFormato) VALUES (63, 3);
INSERT INTO album_formato (idAlbum, idFormato) VALUES (64, 3);
INSERT INTO album_formato (idAlbum, idFormato) VALUES (65, 3);
INSERT INTO album_formato (idAlbum, idFormato) VALUES (66, 3);
INSERT INTO album_formato (idAlbum, idFormato) VALUES (67, 3);
INSERT INTO album_formato (idAlbum, idFormato) VALUES (68, 3);
INSERT INTO album_formato (idAlbum, idFormato) VALUES (69, 3);
INSERT INTO album_formato (idAlbum, idFormato) VALUES (70, 3);
INSERT INTO album_formato (idAlbum, idFormato) VALUES (71, 3);
INSERT INTO album_formato (idAlbum, idFormato) VALUES (72, 3);
INSERT INTO album_formato (idAlbum, idFormato) VALUES (73, 3);
INSERT INTO album_formato (idAlbum, idFormato) VALUES (74, 3);
INSERT INTO album_formato (idAlbum, idFormato) VALUES (75, 3);
INSERT INTO album_formato (idAlbum, idFormato) VALUES (76, 3);
INSERT INTO album_formato (idAlbum, idFormato) VALUES (77, 3);
INSERT INTO album_formato (idAlbum, idFormato) VALUES (78, 3);
INSERT INTO album_formato (idAlbum, idFormato) VALUES (79, 3);
INSERT INTO album_formato (idAlbum, idFormato) VALUES (80, 3);
INSERT INTO album_formato (idAlbum, idFormato) VALUES (81, 3);
INSERT INTO album_formato (idAlbum, idFormato) VALUES (82, 3);
INSERT INTO album_formato (idAlbum, idFormato) VALUES (83, 3);
INSERT INTO album_formato (idAlbum, idFormato) VALUES (84, 3);
INSERT INTO album_formato (idAlbum, idFormato) VALUES (85, 3);
INSERT INTO album_formato (idAlbum, idFormato) VALUES (86, 3);
INSERT INTO album_formato (idAlbum, idFormato) VALUES (87, 3);
INSERT INTO album_formato (idAlbum, idFormato) VALUES (88, 3);
INSERT INTO album_formato (idAlbum, idFormato) VALUES (89, 3);
INSERT INTO album_formato (idAlbum, idFormato) VALUES (90, 3);
INSERT INTO album_formato (idAlbum, idFormato) VALUES (91, 3);
INSERT INTO album_formato (idAlbum, idFormato) VALUES (92, 3);
INSERT INTO album_formato (idAlbum, idFormato) VALUES (93, 3);
INSERT INTO album_formato (idAlbum, idFormato) VALUES (94, 3);
INSERT INTO album_formato (idAlbum, idFormato) VALUES (95, 3);
INSERT INTO album_formato (idAlbum, idFormato) VALUES (96, 3);
INSERT INTO album_formato (idAlbum, idFormato) VALUES (97, 3);
INSERT INTO album_formato (idAlbum, idFormato) VALUES (98, 3);
INSERT INTO album_formato (idAlbum, idFormato) VALUES (99, 3);
INSERT INTO album_formato (idAlbum, idFormato) VALUES (100, 3);
INSERT INTO album_formato (idAlbum, idFormato) VALUES (101, 3);
INSERT INTO album_formato (idAlbum, idFormato) VALUES (102, 3);
INSERT INTO album_formato (idAlbum, idFormato) VALUES (103, 3);
INSERT INTO album_formato (idAlbum, idFormato) VALUES (104, 3);
INSERT INTO album_formato (idAlbum, idFormato) VALUES (105, 3);
INSERT INTO album_formato (idAlbum, idFormato) VALUES (106, 3);
INSERT INTO album_formato (idAlbum, idFormato) VALUES (107, 3);
INSERT INTO album_formato (idAlbum, idFormato) VALUES (108, 3);
INSERT INTO album_formato (idAlbum, idFormato) VALUES (109, 3);
INSERT INTO album_formato (idAlbum, idFormato) VALUES (110, 3);
INSERT INTO album_formato (idAlbum, idFormato) VALUES (111, 3);
INSERT INTO album_formato (idAlbum, idFormato) VALUES (112, 3);
INSERT INTO album_formato (idAlbum, idFormato) VALUES (113, 3);
INSERT INTO album_formato (idAlbum, idFormato) VALUES (114, 3);
INSERT INTO album_formato (idAlbum, idFormato) VALUES (115, 3);
INSERT INTO album_formato (idAlbum, idFormato) VALUES (116, 3);
INSERT INTO album_formato (idAlbum, idFormato) VALUES (117, 3);
INSERT INTO album_formato (idAlbum, idFormato) VALUES (118, 3);
INSERT INTO album_formato (idAlbum, idFormato) VALUES (119, 3);
INSERT INTO album_formato (idAlbum, idFormato) VALUES (120, 3);
INSERT INTO album_formato (idAlbum, idFormato) VALUES (121, 3);
INSERT INTO album_formato (idAlbum, idFormato) VALUES (122, 3);
INSERT INTO album_formato (idAlbum, idFormato) VALUES (123, 3);
INSERT INTO album_formato (idAlbum, idFormato) VALUES (124, 3);
INSERT INTO album_formato (idAlbum, idFormato) VALUES (125, 3);
INSERT INTO album_formato (idAlbum, idFormato) VALUES (126, 3);
INSERT INTO album_formato (idAlbum, idFormato) VALUES (127, 3);
INSERT INTO album_formato (idAlbum, idFormato) VALUES (128, 3);
INSERT INTO album_formato (idAlbum, idFormato) VALUES (129, 3);
INSERT INTO album_formato (idAlbum, idFormato) VALUES (130, 3);
INSERT INTO album_formato (idAlbum, idFormato) VALUES (131, 3);
INSERT INTO album_formato (idAlbum, idFormato) VALUES (132, 3);
INSERT INTO album_formato (idAlbum, idFormato) VALUES (133, 3);
INSERT INTO album_formato (idAlbum, idFormato) VALUES (134, 3);
INSERT INTO album_formato (idAlbum, idFormato) VALUES (135, 3);
INSERT INTO album_formato (idAlbum, idFormato) VALUES (136, 3);
INSERT INTO album_formato (idAlbum, idFormato) VALUES (137, 3);
INSERT INTO album_formato (idAlbum, idFormato) VALUES (138, 3);
INSERT INTO album_formato (idAlbum, idFormato) VALUES (139, 3);
INSERT INTO album_formato (idAlbum, idFormato) VALUES (140, 3);
INSERT INTO album_formato (idAlbum, idFormato) VALUES (141, 3);
INSERT INTO album_formato (idAlbum, idFormato) VALUES (142, 3);
INSERT INTO album_formato (idAlbum, idFormato) VALUES (143, 3);
INSERT INTO album_formato (idAlbum, idFormato) VALUES (144, 3);
INSERT INTO album_formato (idAlbum, idFormato) VALUES (145, 3);
INSERT INTO album_formato (idAlbum, idFormato) VALUES (146, 3);
INSERT INTO album_formato (idAlbum, idFormato) VALUES (147, 3);
INSERT INTO album_formato (idAlbum, idFormato) VALUES (148, 3);
INSERT INTO album_formato (idAlbum, idFormato) VALUES (149, 3);
INSERT INTO album_formato (idAlbum, idFormato) VALUES (150, 3);
INSERT INTO album_formato (idAlbum, idFormato) VALUES (151, 3);
INSERT INTO album_formato (idAlbum, idFormato) VALUES (152, 3);
INSERT INTO album_formato (idAlbum, idFormato) VALUES (153, 3);
INSERT INTO album_formato (idAlbum, idFormato) VALUES (154, 3);
INSERT INTO album_formato (idAlbum, idFormato) VALUES (155, 3);
INSERT INTO album_formato (idAlbum, idFormato) VALUES (156, 3);
INSERT INTO album_formato (idAlbum, idFormato) VALUES (157, 3);
INSERT INTO album_formato (idAlbum, idFormato) VALUES (158, 3);
INSERT INTO album_formato (idAlbum, idFormato) VALUES (159, 3);
INSERT INTO album_formato (idAlbum, idFormato) VALUES (160, 3);
INSERT INTO album_formato (idAlbum, idFormato) VALUES (161, 3);
INSERT INTO album_formato (idAlbum, idFormato) VALUES (162, 3);
INSERT INTO album_formato (idAlbum, idFormato) VALUES (163, 3);
INSERT INTO album_formato (idAlbum, idFormato) VALUES (164, 3);
INSERT INTO album_formato (idAlbum, idFormato) VALUES (165, 3);
INSERT INTO album_formato (idAlbum, idFormato) VALUES (166, 3);
INSERT INTO album_formato (idAlbum, idFormato) VALUES (167, 3);
INSERT INTO album_formato (idAlbum, idFormato) VALUES (168, 3);
INSERT INTO album_formato (idAlbum, idFormato) VALUES (169, 3);
INSERT INTO album_formato (idAlbum, idFormato) VALUES (170, 3);
INSERT INTO album_formato (idAlbum, idFormato) VALUES (171, 3);
INSERT INTO album_formato (idAlbum, idFormato) VALUES (172, 3);
INSERT INTO album_formato (idAlbum, idFormato) VALUES (173, 3);
INSERT INTO album_formato (idAlbum, idFormato) VALUES (174, 3);
INSERT INTO album_formato (idAlbum, idFormato) VALUES (175, 3);
INSERT INTO album_formato (idAlbum, idFormato) VALUES (176, 3);
INSERT INTO album_formato (idAlbum, idFormato) VALUES (177, 3);
INSERT INTO album_formato (idAlbum, idFormato) VALUES (178, 3);
INSERT INTO album_formato (idAlbum, idFormato) VALUES (179, 3);
INSERT INTO album_formato (idAlbum, idFormato) VALUES (180, 3);
INSERT INTO album_formato (idAlbum, idFormato) VALUES (181, 3);
INSERT INTO album_formato (idAlbum, idFormato) VALUES (182, 3);
INSERT INTO album_formato (idAlbum, idFormato) VALUES (183, 3);
INSERT INTO album_formato (idAlbum, idFormato) VALUES (184, 3);
INSERT INTO album_formato (idAlbum, idFormato) VALUES (185, 3);
INSERT INTO album_formato (idAlbum, idFormato) VALUES (186, 3);
INSERT INTO album_formato (idAlbum, idFormato) VALUES (187, 3);
INSERT INTO album_formato (idAlbum, idFormato) VALUES (188, 3);
INSERT INTO album_formato (idAlbum, idFormato) VALUES (189, 3);
INSERT INTO album_formato (idAlbum, idFormato) VALUES (190, 3);
INSERT INTO album_formato (idAlbum, idFormato) VALUES (191, 3);
INSERT INTO album_formato (idAlbum, idFormato) VALUES (192, 3);
INSERT INTO album_formato (idAlbum, idFormato) VALUES (193, 3);
INSERT INTO album_formato (idAlbum, idFormato) VALUES (194, 3);
INSERT INTO album_formato (idAlbum, idFormato) VALUES (195, 3);
INSERT INTO album_formato (idAlbum, idFormato) VALUES (196, 3);
INSERT INTO album_formato (idAlbum, idFormato) VALUES (197, 3);
INSERT INTO album_formato (idAlbum, idFormato) VALUES (198, 3);
INSERT INTO album_formato (idAlbum, idFormato) VALUES (199, 3);
INSERT INTO album_formato (idAlbum, idFormato) VALUES (200, 3);
INSERT INTO album_formato (idAlbum, idFormato) VALUES (201, 3);
INSERT INTO album_formato (idAlbum, idFormato) VALUES (202, 3);
INSERT INTO album_formato (idAlbum, idFormato) VALUES (203, 3);
INSERT INTO album_formato (idAlbum, idFormato) VALUES (204, 3);
INSERT INTO album_formato (idAlbum, idFormato) VALUES (205, 3);
INSERT INTO album_formato (idAlbum, idFormato) VALUES (206, 3);
INSERT INTO album_formato (idAlbum, idFormato) VALUES (207, 3);
INSERT INTO album_formato (idAlbum, idFormato) VALUES (208, 3);
INSERT INTO album_formato (idAlbum, idFormato) VALUES (209, 3);
INSERT INTO album_formato (idAlbum, idFormato) VALUES (210, 3);
INSERT INTO album_formato (idAlbum, idFormato) VALUES (211, 3);
INSERT INTO album_formato (idAlbum, idFormato) VALUES (212, 3);
INSERT INTO album_formato (idAlbum, idFormato) VALUES (213, 3);
INSERT INTO album_formato (idAlbum, idFormato) VALUES (214, 3);
INSERT INTO album_formato (idAlbum, idFormato) VALUES (215, 3);
INSERT INTO album_formato (idAlbum, idFormato) VALUES (216, 3);
INSERT INTO album_formato (idAlbum, idFormato) VALUES (217, 3);
INSERT INTO album_formato (idAlbum, idFormato) VALUES (218, 3);
INSERT INTO album_formato (idAlbum, idFormato) VALUES (219, 3);
INSERT INTO album_formato (idAlbum, idFormato) VALUES (220, 3);
INSERT INTO album_formato (idAlbum, idFormato) VALUES (221, 3);
INSERT INTO album_formato (idAlbum, idFormato) VALUES (222, 3);
INSERT INTO album_formato (idAlbum, idFormato) VALUES (223, 3);
INSERT INTO album_formato (idAlbum, idFormato) VALUES (224, 3);
INSERT INTO album_formato (idAlbum, idFormato) VALUES (225, 3);
INSERT INTO album_formato (idAlbum, idFormato) VALUES (226, 3);
INSERT INTO album_formato (idAlbum, idFormato) VALUES (227, 3);
INSERT INTO album_formato (idAlbum, idFormato) VALUES (228, 3);
INSERT INTO album_formato (idAlbum, idFormato) VALUES (229, 3);
INSERT INTO album_formato (idAlbum, idFormato) VALUES (230, 3);
INSERT INTO album_formato (idAlbum, idFormato) VALUES (231, 3);
INSERT INTO album_formato (idAlbum, idFormato) VALUES (232, 3);
INSERT INTO album_formato (idAlbum, idFormato) VALUES (233, 3);
INSERT INTO album_formato (idAlbum, idFormato) VALUES (234, 3);
INSERT INTO album_formato (idAlbum, idFormato) VALUES (235, 3);
INSERT INTO album_formato (idAlbum, idFormato) VALUES (236, 3);
INSERT INTO album_formato (idAlbum, idFormato) VALUES (237, 3);
INSERT INTO album_formato (idAlbum, idFormato) VALUES (238, 3);
INSERT INTO album_formato (idAlbum, idFormato) VALUES (239, 3);
INSERT INTO album_formato (idAlbum, idFormato) VALUES (240, 3);
INSERT INTO album_formato (idAlbum, idFormato) VALUES (241, 3);
INSERT INTO album_formato (idAlbum, idFormato) VALUES (242, 3);
INSERT INTO album_formato (idAlbum, idFormato) VALUES (243, 3);
INSERT INTO album_formato (idAlbum, idFormato) VALUES (244, 3);
INSERT INTO album_formato (idAlbum, idFormato) VALUES (245, 3);
INSERT INTO album_formato (idAlbum, idFormato) VALUES (246, 3);
INSERT INTO album_formato (idAlbum, idFormato) VALUES (247, 3);
INSERT INTO album_formato (idAlbum, idFormato) VALUES (248, 3);


-- Creando usuarios.
INSERT INTO usuarios (id_usuario, nombre, apellido, email, password, fecha_creacion) VALUES (NULL, 'Daniel', 'Garcia Asathor', 'stngarcia@gmail.com', 'asathor', '2019-01-01');
INSERT INTO usuarios (id_usuario, nombre, apellido, email, password, fecha_creacion) VALUES (NULL, 'Francisco', 'Reyes', 'freyes@alumnos.duoc.cl', 'freyes', '2019-01-01'); 


-- Confirmando cambios.
commit;


  