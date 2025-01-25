----------------------
-- FUNCTION_TIGGERS
----------------------

----------------------------------------------------------------
--      Devuelve tuplas de una tabla
--DROP FUNCTION tabla() ;
CREATE OR REPLACE function tabla() returns table (Region_Code int,Pais text) as $$
BEGIN
	return query
		select "region_pais"."Region_Code","region_pais"."Pais" from "region_pais"
		where "region_pais"."Pais" like 'B%'order by "region_pais"."Pais";
end;
$$ language plpgsql;

select tabla();

 ----------------------------------------------------------------
--      Devuelve el valor de una funcion resumen

--DROP FUNCTION cantidad1() ;
CREATE OR REPLACE function cantidad() returns INT as $$

DECLARE
    cant INT DEFAULT 0;
   BEGIN
	SELECT COUNT(*) into cant FROM "elementos";
    RETURN cant;
END;
$$LANGUAGE plpgsql;

select cantidad();

	
----------------------------------------------------------------
--      Devuelve tuplas con los promedios para southamerica (lo que era el SP)
--DROP FUNCTION promedio_south_america(integer,integer);
CREATE OR REPLACE function promedio_south_america( desde INT, hasta INT) returns table(Pais text , item text, elemento text, unit varchar(50), prom float) as $$
BEGIN
	return query
		SELECT 
		"region_pais"."Pais" , "item"."Item_desc", "elementos"."Element",
		"fao_data"."Unit",round( AVG("fao_data"."valor")) FROM "sub_regiones" 
		INNER JOIN  "region_pais" ON "sub_regiones"."Region_Code" = "region_pais"."Region_Code" 
		INNER JOIN "fao_data"  ON "region_pais"."Pais_Code" = "fao_data"."Pais_Code" 
		INNER JOIN "item" ON "item"."item_Code_id" = "fao_data"."item_Code_id" 
		INNER JOIN "elementos" ON "elementos"."Element_Code" = "fao_data"."Element_Code"
		WHERE 
		"sub_regiones"."Region" = 'South America'  AND "fao_data"."Code_Year" >= desde AND "fao_data"."Code_Year" <= hasta
		GROUP BY "region_pais"."Pais" , "item"."Item_desc", "elementos"."Element", "fao_data"."Unit"
		ORDER BY "region_pais"."Pais", "item"."Item_desc";
END ;

$$LANGUAGE plpgsql;

select promedio_south_america(2000,2020);

 --------------------------------------------------------------
 
 -- function (la misma que en el sql local solo que lo devuelve tipo tuplas
 
create or replace function  promedio_datos(pais varchar(100), produccion varchar(200), elemento varchar(100), desde INT, hasta int) returns float as $$
declare                  
  	promedio_dato float default 0;

begin

	SELECT round(AVG("fao_data"."valor")) INTO "promedio_dato" FROM  "region_pais" 
	INNER JOIN "fao_data"  ON "region_pais"."Pais_Code" = "fao_data"."Pais_Code" 
	INNER JOIN "item" ON "item"."item_Code_id" = "fao_data"."item_Code_id" 
	INNER JOIN "elementos" ON "elementos"."Element_Code" = "fao_data"."Element_Code"
	WHERE "item"."Item_desc" = "produccion" AND "elementos"."Element" = "elemento" and
	"region_pais"."Pais" = "pais" AND "fao_data"."Code_Year" >= "desde" AND "fao_data"."Code_Year" <="hasta"
	GROUP BY "region_pais"."Pais_Code" , "item"."item_Code_id", "fao_data"."Element_Code";

  	return promedio_dato;
end;
$$ language plpgsql;

select promedio_datos('Argentina', 'Wheat','Production', 2000,2020);

----------------------------------------------------------------------------------


CREATE TRIGGER pais_inexistente_trigger
BEFORE INSERT ON fao_data
FOR EACH ROW
EXECUTE FUNCTION pais_inexistente_trigger_func();


INSERT INTO fao_data ("Pais_Code", "item_Code_id", "Element_Code", "Code_Year", "Unit", "valor", "Flag")
VALUES ('569', '572', '6000', '2024', 't', '1000', 'A');

--Query 1: ERROR:  Pais_code 569 no existente en la tabla region_pais
--CONTEXT:  PL/pgSQL function pais_inexistente_trigger_func() line 14 at RAISE


------------------------------------------------------------------------------------

CREATE TRIGGER actualizar_promedio_5
AFTER INSERT ON fao_data
FOR EACH ROW
EXECUTE FUNCTION actualizar_promedio_5_func();

select * from "fao_data" WHERE
"fao_data"."Pais_Code"=9 and "fao_data"."item_Code_id" = 15;


select * from "promedio_5" WHERE
"promedio_5"."Pais_Code"=9 and "promedio_5"."item_Code_id" = 15;

INSERT INTO fao_data ("Pais_Code", "item_Code_id", "Element_Code", "Code_Year", "Unit", "valor", "Flag")
VALUES (9, 15, 5510, 2023, 't',1, 'A');
INSERT INTO fao_data ("Pais_Code", "item_Code_id", "Element_Code", "Code_Year", "Unit", "valor", "Flag")
VALUES (9, 15, 5510, 2024, 't',1, 'A');
INSERT INTO fao_data ("Pais_Code", "item_Code_id", "Element_Code", "Code_Year", "Unit", "valor", "Flag")
VALUES (9, 15, 5510, 2025, 't',1, 'A');


select * from "promedio_5" WHERE
"promedio_5"."Pais_Code"=9 and "promedio_5"."item_Code_id" = 15;

INSERT INTO fao_data ("Pais_Code", "item_Code_id", "Element_Code", "Code_Year", "Unit", "valor", "Flag")
VALUES (9, 15, 5510, 2026, 't',1, 'A');
INSERT INTO fao_data ("Pais_Code", "item_Code_id", "Element_Code", "Code_Year", "Unit", "valor", "Flag")
VALUES (9, 15, 5510, 2027, 't',1, 'A');

DELETE FROM fao_data WHERE "Code_Year">2022;

INSERT INTO promedio_5 ("Pais_Code", "item_Code_id", "Element_Code", "promedio", "Unit") 
    VALUES (9, 15, 5510, 19509855.6, 't')
    ON CONFLICT ("Pais_Code", "item_Code_id", "Element_Code", "Unit") 
    DO UPDATE SET "promedio" = EXCLUDED."promedio";
    

----------------------
-- QUERIES GENERALES
----------------------

select distinct "promedio_5"."Pais_Code" from "public"."promedio_5";
SELECT * FROM "public"."items_agrup" LIMIT 100 OFFSET 0;
SELECT COUNT(*) FROM "elementos";
select max("promedio_5"."Pais_Code") from "public"."promedio_5";
select max("promedio_5"."Pais_Code") from "promedio_5" ;
select "region_pais"."Pais" from "region_pais"
where "region_pais"."Pais" like 'A%';
select count(*) from pruebas;
select count(*) from fao_data;
select * from fao_data;


--#Búsqueda una tabla por 2 claves (en realidad usamos 3 FK dada la cantidad de datos, item 15 trigo)
Select * from "fao_data"
where "fao_data"."Pais_Code" =9 and "fao_data"."item_Code_id" =15 and "fao_data"."Code_Year"=2022;

--# desde continente a paises (países de  America)
SELECT "continente"."nombre" as Continente, "sub_regiones"."Region", "region_pais"."Pais_Code", "region_pais"."Pais"
 FROM region_pais 
INNER JOIN "sub_regiones" ON  "region_pais"."Region_Code" = "sub_regiones"."Region_Code"
INNER JOIN "continente" ON "sub_regiones"."continente_id" = "continente"."id_continente"
WHERE "continente"."nombre" = 'America'
ORDER BY  "region_pais"."Pais";


--# desde pais a continente primero Argentina segundo Francia!!!! ;)
SELECT "continente"."nombre" as Continente, "sub_regiones"."Region", "region_pais"."Pais_Code", "region_pais"."Pais" 
FROM region_pais 
INNER JOIN sub_regiones ON  "region_pais"."Region_Code" = "sub_regiones"."Region_Code"
INNER JOIN continente ON "sub_regiones"."continente_id" = "continente"."id_continente"
WHERE "region_pais"."Pais" = 'Argentina' or  "region_pais"."Pais" = 'France'
ORDER BY "sub_regiones"."Region", "region_pais"."Pais";


--# desde pais a sub_region, todos los países que empiezan por A 
SELECT "sub_regiones"."Region",  "region_pais"."Pais" FROM region_pais 
INNER JOIN sub_regiones ON  "region_pais"."Region_Code" = "sub_regiones"."Region_Code"
WHERE "region_pais"."Pais" LIKE 'A%'
ORDER BY "sub_regiones"."Region", "region_pais"."Pais";


--#Queries Generales
--#cuales son los 5 paises, con mayor superficie promedio cultivada de maiz 2017-2022
-- se usa produccion por que es lo que esta cargado en esta base

SELECT "item"."Item_desc", "region_pais"."Pais","elementos"."Element_Code",  ROUND(AVG(fd.valor)) as produccion_promedio, 
"fd"."Unit"
FROM  region_pais 
INNER JOIN fao_data AS fd ON "region_pais"."Pais_Code" = "fd"."Pais_Code" 
INNER JOIN item ON "item"."item_Code_id" = "fd"."item_Code_id" 
INNER JOIN elementos ON "elementos"."Element_Code" = "fd"."Element_Code"
WHERE  "item"."Item_desc"  like 'Maize%' and "fd"."Code_Year" >= 2017  and "fd"."Code_Year" <= 2022  and "fd"."Element_Code" =5510 
GROUP BY "region_pais"."Pais" , "item"."Item_desc", "elementos"."Element_Code","fd"."Unit"
order by "produccion_promedio" desc 
limit 5;


--------------------------------
-- Prácticas


--Cuales son los paises de America
select continente."nombre", sub_regiones."Region", region_pais."Pais" from continente inner join sub_regiones
on continente."id_continente" = sub_regiones."continente_id"
inner join region_pais on sub_regiones."Region_Code" = region_pais."Region_Code"
Where continente."nombre" = 'America';

--Cuales son los paises de Europa
select continente."nombre", sub_regiones."Region", region_pais."Pais" from continente inner join sub_regiones
on continente."id_continente" = sub_regiones."continente_id"
inner join region_pais on sub_regiones."Region_Code" = region_pais."Region_Code"
Where continente."nombre" = 'Europa' order by sub_regiones."Region", region_pais."Pais";

--Cuales son los  productos de mayor produccion promedio 2000 2010 en toneladas  de la argentina
select item."Item_desc", round(avg(fao_data."valor")) as promedio from item 
inner join fao_data on item."item_Code_id" = fao_data."item_Code_id"
inner join region_pais on region_pais."Pais_Code" = fao_data."Pais_Code"
where region_pais."Pais" = 'Argentina' and fao_data."Unit" = 't'
group by item."Item_desc" order by promedio desc limit 5;


--Cuantos paises pertenecen a europa
Select count(*) from region_pais
inner join sub_regiones on 
region_pais."Region_Code" = sub_regiones."Region_Code"
where sub_regiones."Region" = 'South America';