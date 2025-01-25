use g5_fao_der;

# STORE PROCEDURE
#  PROMEDIO DEL VALOR (rendimiento , area , produccion) en un PERIODO (desde-hasta inclusive)
DELIMITER //
CREATE  PROCEDURE promedio_dato(    IN desde INT,    IN hasta INT)
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
END //
DELIMITER ;


call promedio_dato(2021,2022);
#<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<

# FUNCTION
#Calcula el promedio para los datos ingresados
DELIMITER //
CREATE FUNCTION promedio_datos(pais varchar(100), produccion varchar(200), elemento varchar(100), desde INT, hasta int)
RETURNS int
DETERMINISTIC
BEGIN
	DECLARE promedio_dato double;
	SELECT ROUND(AVG(fd.valor),2) INTO promedio_dato FROM  region_pais 
	INNER JOIN fao_data AS fd ON region_pais.Pais_Code = fd.Pais_Code 
	INNER JOIN item ON item.item_Code_id = fd.Item_Code_id 
	INNER JOIN elementos ON elementos.Element_Code = fd.Element_Code
	WHERE item.Item_desc = produccion AND elementos.Element = elemento and
	region_pais.Pais = pais  AND Code_year >= desde AND Code_year <=hasta
	GROUP BY region_pais.Pais_code , item.item_Code_id, fd.Element_Code;
    RETURN promedio_dato;
	
END //
DELIMITER ;

SELECT  promedio_datos("Argentina", "Wheat", "Production", 2010,2022);
DROP FUNCTION IF EXISTS promedio_datos;


#><<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<

DELIMITER //
CREATE TRIGGER pais_inexistente_trigger
BEFORE INSERT ON fao_data
FOR EACH ROW
BEGIN
    DECLARE pais_existente INT;
    DECLARE mensaje VARCHAR(255);
    -- Verificar si el nuevo Pais_Code existe en la tabla region_pais
    SELECT COUNT(*) INTO pais_existente FROM region_pais WHERE Pais_Code = NEW.Pais_Code;
    -- Si el Pais_Code no existe, generar un mensaje de error
    IF pais_existente = 0 THEN
        SET mensaje = CONCAT('Pais_code ', NEW.Pais_Code, ' no existente en la tabla region_pais');
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = mensaje;
    END IF;
END//
DELIMITER ;
INSERT INTO fao_data (Pais_Code, Item_Code_id, Element_Code, Code_year, Unit, valor, Flag)
VALUES ('569', '572', '6000', '2024', 't', '1000', 'A');


#><<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
/*
#Creación tabla promedio 5 años de todo para el trigger que va a actualizar los promedios 
create table promedio_5 select fd.Pais_Code, fd.Item_Code_id, fd.Element_Code , Round(avg(fd.valor),2) as promedio ,  fd.Unit
from fao_data as fd 
where fd.Code_year > 2017 and fd.valor > 0
group by fd.Pais_Code, fd.Item_Code_id, fd.Element_Code;

ALTER TABLE `promedio_5` ADD UNIQUE `promedio_fx`(`Pais_Code`, `Item_Code_id`, `Element_Code`);
*/

#Trigger que actualiza la tabla de promedios 5 ultimos años cada vez que se ingresa un registro en la tabla fao_data

DELIMITER //
CREATE TRIGGER actualizar_promedio_5
after INSERT ON fao_data
FOR EACH ROW
BEGIN
    DECLARE promedio Double;
    -- Calcular nuevo promedio
    SELECT Round(Avg(valor),2) INTO promedio FROM fao_data  WHERE Pais_Code = NEW.Pais_Code
    and Item_Code_id = new.Item_Code_id and Element_Code = new.Element_Code and 
    Code_year > (new.Code_year-5) and Unit = new.Unit;
    -- Actualizo el nuevo promedio
    SET SQL_SAFE_UPDATES = 0;
    REPLACE INTO promedio_5 (Pais_Code, Item_Code_id, Element_Code, promedio, Unit) 
    VALUES(NEW.Pais_Code, new.Item_Code_id, new.Element_Code, promedio, new.Unit);
    SET SQL_SAFE_UPDATES = 1;

END//
DELIMITER ;

INSERT INTO fao_data (Pais_Code, Item_Code_id, Element_Code, Code_year, Unit, valor, Flag)
VALUES (9, 15, 5419, 2023, '100 g/ha',1, 'A');
INSERT INTO fao_data (Pais_Code, Item_Code_id, Element_Code, Code_year, Unit, valor, Flag)
VALUES (9, 15, 5419, 2024, '100 g/ha',1, 'A');
INSERT INTO fao_data (Pais_Code, Item_Code_id, Element_Code, Code_year, Unit, valor, Flag)
VALUES (9, 15, 5419, 2025, '100 g/ha',1, 'A');


SET SQL_SAFE_UPDATES = 0;
select * from fao_data where Code_year >2022;
DELETE FROM fao_data WHERE Code_year>2022;
DROP TRIGGER actualizar_promedio_5;


    
