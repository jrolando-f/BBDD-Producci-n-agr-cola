CREATE SCHEMA g5_fao;


/* <<<<<<<<<<<   SECCION OPERACIONES SOBRE UNA TABLA    >>>>>>>>>>>>>>   */

# Creación de tabla

- -----------------------------------------------------
-- Table `g5_fao`.`sub_regiones`
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

#Se crea la foreign key
CREATE INDEX  `fk_continente_idx` ON `g5_fao_der`.`sub_regiones` (`continente_id` ASC) VISIBLE;

# se muestra la tabla despues de cargar los datos
select * from sub_regiones;


Create table agrup_items select distinct Agrup_Code, Item_Group
from grupos_items;

/*/////////////////////////////*/

# Durante el proceso de generación / normalizacion de la base de datos 
# se usaron distintas sentencias DDL para modificar las tablas y se generaron PK, FK e índices
 
ALTER TABLE `g5_fao_der`.`region_pais` 
DROP COLUMN `Region`;

ALTER TABLE `g5_fao`.`america_produccion` 
ADD COLUMN `id_produccion` INT NOT NULL AUTO_INCREMENT AFTER `Flag`,
CHANGE COLUMN `Pais_Code` `Pais_Code` INT NOT NULL ,
CHANGE COLUMN `Area` `Area` TEXT NOT NULL ,
CHANGE COLUMN `Flag` `Flag` VARCHAR(1) NULL DEFAULT NULL ,
ADD PRIMARY KEY (`id_produccion`),
ADD INDEX `fk_pais_idx` (`Pais_Code` ASC) VISIBLE,
ADD INDEX `fk_flag_idx` (`Flag` ASC) VISIBLE,
ADD INDEX `fk_Item_idx` (`Item Code` ASC) VISIBLE;
;


# Eliminación de registro  

select * from fao_data 
where Pais_Code = 109 and item_Code_id = 572 and Code_Year < 1963;
DELETE FROM `fao_data` WHERE	
Pais_Code = 109 and item_Code_id = 572 and 
Element_Code = 5510 and Code_Year = 1961;
select * from fao_data 
where Pais_Code = 109 and item_Code_id = 572 and Code_Year < 1963;

# Se carga el registro borrado es necesario deshabilitar un trigger para evitar una modificación 
# no deseada dado que se trata de un dato viejo...
DROP TRIGGER actualizar_promedio_5;
INSERT INTO `fao_data` VALUES 	
(109,572,5510,1961,'t',2887,'A',1);
select * from fao_data 
where Pais_Code = 109 and item_Code_id = 572 and Code_Year < 1963;

#Actualización (requiere SET SQL_SAFE_UPDATES = 0;) 
# si se actualiza por un campo que no es clave primaria
# cambia Argentina por Arg en el campo País

SET SQL_SAFE_UPDATES = 0;
select * from region_pais group by Pais;
UPDATE region_pais SET Pais = "Arg"
WHERE Pais ="Argentina";
select * from region_pais group by Pais;

# Para restaurar lo cambiado
select * from region_pais group by Pais;
UPDATE region_pais SET Pais = "Argentina"
WHERE Pais ="Arg";
select * from region_pais group by Pais;

/*  CREACION DE INDICES YA SEA POR QUE SE VA A USAR ESE CAMPO PARA AGRUPACIONES U ORDENAMIENTO
    O POR QUE SE REQUIEREN RESTRICCIONES ADICIONALES     */
# uso de índice único para establecer la restricción necesaria para no cargar 2 veces un mismo dato

# DROP INDEX `restrict` on fao_data ;
SHOW INDEXES FROM fao_data;
ALTER TABLE `g5_fao_der`.`fao_data` 
ADD UNIQUE INDEX `restrict` (`Pais_Code` ASC, `Item_Code_id` ASC, `Element_Code` ASC, 
`Code_year` ASC, `Unit` ASC, `Flag` ASC) VISIBLE;
SHOW INDEXES FROM fao_data;

# Creación de índice para Nombre de continentes		
#DROP INDEX  `continente` on continente;
SHOW INDEXES FROM continente;		
ALTER TABLE `g5_fao_der`.`continente` 
ADD INDEX `continente` (`nombre` ASC) VISIBLE;
SHOW INDEXES FROM continente;

