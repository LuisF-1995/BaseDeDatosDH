-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema spotify_clase9
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema spotify_clase9
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `spotify_clase9` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci ;
USE `spotify_clase9` ;

-- -----------------------------------------------------
-- Table `spotify_clase9`.`discografica`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `spotify_clase9`.`discografica` (
  `id_discografica` MEDIUMINT NOT NULL AUTO_INCREMENT,
  `nombre_discografica` VARCHAR(200) NULL DEFAULT NULL,
  `pais_discografica` VARCHAR(200) NULL DEFAULT NULL,
  PRIMARY KEY (`id_discografica`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `spotify_clase9`.`artista`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `spotify_clase9`.`artista` (
  `id_artista` INT NOT NULL AUTO_INCREMENT,
  `nombre_artista` VARCHAR(200) NULL DEFAULT NULL,
  `imagen` VARCHAR(300) NULL DEFAULT NULL,
  `GENERO_id_genero` SMALLINT NOT NULL,
  PRIMARY KEY (`id_artista`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `spotify_clase9`.`album`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `spotify_clase9`.`album` (
  `id_album` INT NOT NULL AUTO_INCREMENT,
  `titulo` VARCHAR(150) NULL DEFAULT NULL,
  `anio_publicacion` DATE NULL DEFAULT NULL,
  `imagen_portada` VARCHAR(300) NULL DEFAULT NULL,
  `FK_DISCOGRAFICA` MEDIUMINT NULL DEFAULT NULL,
  `artista_id_artista` INT NOT NULL,
  PRIMARY KEY (`id_album`),
  INDEX `FK_DISCOGRAFICA` (`FK_DISCOGRAFICA` ASC) VISIBLE,
  INDEX `fk_album_artista1_idx` (`artista_id_artista` ASC) VISIBLE,
  CONSTRAINT `FK_DISCOGRAFICA`
    FOREIGN KEY (`FK_DISCOGRAFICA`)
    REFERENCES `spotify_clase9`.`discografica` (`id_discografica`),
  CONSTRAINT `fk_album_artista1`
    FOREIGN KEY (`artista_id_artista`)
    REFERENCES `spotify_clase9`.`artista` (`id_artista`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `spotify_clase9`.`usuario`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `spotify_clase9`.`usuario` (
  `id_usuario` INT NOT NULL AUTO_INCREMENT,
  `email` VARCHAR(100) NULL DEFAULT NULL,
  `contrasena` VARCHAR(50) NULL DEFAULT NULL,
  `sexo` VARCHAR(50) NULL DEFAULT NULL,
  `cod_postal` MEDIUMINT NULL DEFAULT NULL,
  `fecha_nac` DATE NULL DEFAULT NULL,
  `pais` VARCHAR(200) NULL DEFAULT NULL,
  PRIMARY KEY (`id_usuario`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `spotify_clase9`.`playlist`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `spotify_clase9`.`playlist` (
  `id_playlist` INT NOT NULL AUTO_INCREMENT,
  `titulo` VARCHAR(200) NULL DEFAULT NULL,
  `fecha_creacion` DATE NULL DEFAULT NULL,
  `FK_id_usuario` INT NULL DEFAULT NULL,
  `num_canciones` INT NULL DEFAULT NULL,
  PRIMARY KEY (`id_playlist`),
  INDEX `FK_id_usuario` (`FK_id_usuario` ASC) VISIBLE,
  CONSTRAINT `FK_id_usuario`
    FOREIGN KEY (`FK_id_usuario`)
    REFERENCES `spotify_clase9`.`usuario` (`id_usuario`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `spotify_clase9`.`cancion`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `spotify_clase9`.`cancion` (
  `id_cancion` BIGINT NOT NULL AUTO_INCREMENT,
  `titulo` VARCHAR(200) NULL DEFAULT NULL,
  `duracion` INT NULL DEFAULT NULL,
  `num_reproducciones` BIGINT NULL DEFAULT NULL,
  `likes` BIGINT NULL DEFAULT NULL,
  `album_id_album` INT NOT NULL,
  `playlist_id_playlist` INT NOT NULL,
  PRIMARY KEY (`id_cancion`),
  INDEX `fk_cancion_album1_idx` (`album_id_album` ASC) VISIBLE,
  INDEX `fk_cancion_playlist1_idx` (`playlist_id_playlist` ASC) VISIBLE,
  CONSTRAINT `fk_cancion_album1`
    FOREIGN KEY (`album_id_album`)
    REFERENCES `spotify_clase9`.`album` (`id_album`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_cancion_playlist1`
    FOREIGN KEY (`playlist_id_playlist`)
    REFERENCES `spotify_clase9`.`playlist` (`id_playlist`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `spotify_clase9`.`GENERO`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `spotify_clase9`.`GENERO` (
  `idGENERO` INT NOT NULL AUTO_INCREMENT,
  `NOMBRE` VARCHAR(45) NULL,
  `artista_id_artista` INT NOT NULL,
  INDEX `fk_GENERO_artista1_idx` (`artista_id_artista` ASC) VISIBLE,
  PRIMARY KEY (`idGENERO`),
  CONSTRAINT `fk_GENERO_artista1`
    FOREIGN KEY (`artista_id_artista`)
    REFERENCES `spotify_clase9`.`artista` (`id_artista`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
