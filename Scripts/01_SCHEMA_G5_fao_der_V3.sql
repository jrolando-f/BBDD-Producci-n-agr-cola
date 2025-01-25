-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema g5_fao_der
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema g5_fao_der
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `g5_fao_der` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci ;
USE `g5_fao_der` ;

-- -----------------------------------------------------
-- Table `g5_fao_der`.`agrup_items`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `g5_fao_der`.`agrup_items` (
  `Agrup_Code` VARCHAR(100) NOT NULL,
  `Item_Group` TEXT NOT NULL,
  PRIMARY KEY (`Agrup_Code`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `g5_fao_der`.`continente`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `g5_fao_der`.`continente` (
  `id_continente` INT NOT NULL,
  `nombre` VARCHAR(100) NULL DEFAULT NULL,
  PRIMARY KEY (`id_continente`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `g5_fao_der`.`units`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `g5_fao_der`.`units` (
  `unit` VARCHAR(50) NOT NULL,
  `Description` TEXT NOT NULL,
  PRIMARY KEY (`unit`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `g5_fao_der`.`elementos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `g5_fao_der`.`elementos` (
  `Element_Code` INT NOT NULL,
  `Element` TEXT NOT NULL,
  `Unit` VARCHAR(50) NOT NULL,
  `Description` TEXT NULL DEFAULT NULL,
  PRIMARY KEY (`Element_Code`),
  CONSTRAINT `fk_unit_elemt`
    FOREIGN KEY (`Unit`)
    REFERENCES `g5_fao_der`.`units` (`unit`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;

CREATE INDEX `fk_unit_elemt_idx` ON `g5_fao_der`.`elementos` (`Unit` ASC) VISIBLE;


-- -----------------------------------------------------
-- Table `g5_fao_der`.`flags`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `g5_fao_der`.`flags` (
  `Flag` VARCHAR(1) NOT NULL,
  `Description` TEXT NOT NULL,
  PRIMARY KEY (`Flag`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `g5_fao_der`.`item`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `g5_fao_der`.`item` (
  `item_Code_id` INT NOT NULL,
  `Item_desc` TEXT NULL DEFAULT NULL,
  `Description` TEXT NULL DEFAULT NULL,
  PRIMARY KEY (`item_Code_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `g5_fao_der`.`sub_regiones`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `g5_fao_der`.`sub_regiones` (
  `Region_Code` INT NOT NULL,
  `Region` TEXT NOT NULL,
  `continente_id` INT NULL DEFAULT NULL,
  PRIMARY KEY (`Region_Code`),
  CONSTRAINT `fk_continente`
    FOREIGN KEY (`continente_id`)
    REFERENCES `g5_fao_der`.`continente` (`id_continente`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;

CREATE INDEX `fk_continente_idx` ON `g5_fao_der`.`sub_regiones` (`continente_id` ASC) VISIBLE;


-- -----------------------------------------------------
-- Table `g5_fao_der`.`region_pais`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `g5_fao_der`.`region_pais` (
  `Pais_Code` INT NOT NULL,
  `Pais` TEXT NOT NULL,
  `Region_Code` INT NOT NULL,
  PRIMARY KEY (`Pais_Code`),
  CONSTRAINT `fk_sub_reg`
    FOREIGN KEY (`Region_Code`)
    REFERENCES `g5_fao_der`.`sub_regiones` (`Region_Code`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;

CREATE INDEX `fk_sub_reg_idx` ON `g5_fao_der`.`region_pais` (`Region_Code` ASC) VISIBLE;


-- -----------------------------------------------------
-- Table `g5_fao_der`.`fao_data`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `g5_fao_der`.`fao_data` (
  `Pais_Code` INT NOT NULL,
  `Item_Code_id` INT NOT NULL,
  `Element_Code` INT NOT NULL,
  `Code_year` INT NOT NULL,
  `Unit` VARCHAR(50) NOT NULL,
  `valor` DOUBLE NOT NULL,
  `Flag` VARCHAR(1) NULL DEFAULT NULL,
  `id_produccion` INT NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id_produccion`),
  CONSTRAINT `fk_element`
    FOREIGN KEY (`Element_Code`)
    REFERENCES `g5_fao_der`.`elementos` (`Element_Code`),
  CONSTRAINT `fk_flag`
    FOREIGN KEY (`Flag`)
    REFERENCES `g5_fao_der`.`flags` (`Flag`),
  CONSTRAINT `fk_item`
    FOREIGN KEY (`Item_Code_id`)
    REFERENCES `g5_fao_der`.`item` (`item_Code_id`),
  CONSTRAINT `fk_pais`
    FOREIGN KEY (`Pais_Code`)
    REFERENCES `g5_fao_der`.`region_pais` (`Pais_Code`))
ENGINE = InnoDB
AUTO_INCREMENT = 496253
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;

CREATE UNIQUE INDEX `restricc_fks` USING BTREE ON `g5_fao_der`.`fao_data` (`Pais_Code`, `Item_Code_id`, `Element_Code`, `Code_year`, `Flag`, `Unit`) VISIBLE;

CREATE INDEX `fk_pais_idx` ON `g5_fao_der`.`fao_data` (`Pais_Code` ASC) INVISIBLE;

CREATE INDEX `fk_flag_idx` ON `g5_fao_der`.`fao_data` (`Flag` ASC) VISIBLE;

CREATE INDEX `fk_prod_idx` ON `g5_fao_der`.`fao_data` (`Item_Code_id` ASC) VISIBLE;

CREATE INDEX `fk_element_idx` ON `g5_fao_der`.`fao_data` (`Element_Code` ASC) VISIBLE;


-- -----------------------------------------------------
-- Table `g5_fao_der`.`items_agrup`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `g5_fao_der`.`items_agrup` (
  `Item_Code` INT NOT NULL,
  `Agrup_Code` VARCHAR(100) NOT NULL,
  CONSTRAINT `fk_agrup_items`
    FOREIGN KEY (`Agrup_Code`)
    REFERENCES `g5_fao_der`.`agrup_items` (`Agrup_Code`),
  CONSTRAINT `fk_items_agrup`
    FOREIGN KEY (`Item_Code`)
    REFERENCES `g5_fao_der`.`item` (`item_Code_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;

CREATE INDEX `fk_item_agrup_idx` ON `g5_fao_der`.`items_agrup` (`Item_Code` ASC) VISIBLE;

CREATE INDEX `fk_agrup_item_idx` ON `g5_fao_der`.`items_agrup` (`Agrup_Code` ASC) VISIBLE;

CREATE INDEX `fk_items_agrup_idx` ON `g5_fao_der`.`items_agrup` (`Item_Code` ASC) VISIBLE;

CREATE INDEX `fk_agrup_items_idx` ON `g5_fao_der`.`items_agrup` (`Agrup_Code` ASC) VISIBLE;


-- -----------------------------------------------------
-- Table `g5_fao_der`.`promedio_5`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `g5_fao_der`.`promedio_5` (
  `Pais_Code` INT NOT NULL,
  `Item_Code_id` INT NOT NULL,
  `Element_Code` INT NOT NULL,
  `Unit` VARCHAR(50) NOT NULL,
  `valor` DOUBLE NOT NULL,
  PRIMARY KEY (`Pais_Code`, `Item_Code_id`, `Element_Code`),
  CONSTRAINT `fk_element0`
    FOREIGN KEY (`Element_Code`)
    REFERENCES `g5_fao_der`.`elementos` (`Element_Code`),
  CONSTRAINT `fk_item0`
    FOREIGN KEY (`Item_Code_id`)
    REFERENCES `g5_fao_der`.`item` (`item_Code_id`),
  CONSTRAINT `fk_pais0`
    FOREIGN KEY (`Pais_Code`)
    REFERENCES `g5_fao_der`.`region_pais` (`Pais_Code`))
ENGINE = InnoDB
AUTO_INCREMENT = 496253
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;

CREATE UNIQUE INDEX `restricc_fks` USING BTREE ON `g5_fao_der`.`promedio_5` (`Pais_Code`, `Item_Code_id`, `Element_Code`, `Unit`) VISIBLE;

CREATE INDEX `fk_pais_idx` ON `g5_fao_der`.`promedio_5` (`Pais_Code` ASC) INVISIBLE;

CREATE INDEX `fk_prod_idx` ON `g5_fao_der`.`promedio_5` (`Item_Code_id` ASC) VISIBLE;

CREATE INDEX `fk_element_idx` ON `g5_fao_der`.`promedio_5` (`Element_Code` ASC) VISIBLE;


-- -----------------------------------------------------
-- Table `g5_fao_der`.`pruebas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `g5_fao_der`.`pruebas` (
  `id_prod` INT NOT NULL,
  `pais_code` INT NULL,
  `Pais` VARCHAR(100) NULL,
  `element_code` INT NULL,
  `valor` DOUBLE NULL)
ENGINE = InnoDB;

USE `g5_fao_der` ;

-- -----------------------------------------------------
-- procedure promedio_dato
-- -----------------------------------------------------

DELIMITER $$
USE `g5_fao_der`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `promedio_dato`(    IN desde INT,    IN hasta INT)
BEGIN
	SELECT sub_regiones.Region, region_pais.Pais , item.Item_desc, elementos.Element,
	fd.unit, ROUND(AVG(fd.valor),2) AS promedio_element FROM sub_regiones 
	INNER JOIN  region_pais ON sub_regiones.Region_Code = region_pais.Region_Code 
	INNER JOIN fao_data AS fd ON region_pais.Pais_Code = fd.Pais_Code 
	INNER JOIN item ON item.item_Code_id = fd.Item_Code_id 
	INNER JOIN elementos ON elementos.Element_Code = fd.Element_Code
	WHERE 
	sub_regiones.Region = "South America"  AND Code_year >= desde AND Code_year <=hasta
	GROUP BY region_pais.Pais_code , item.item_Code_id, fd.Element_Code
	ORDER BY region_pais.Pais, item.Item_desc;
END$$

DELIMITER ;

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
