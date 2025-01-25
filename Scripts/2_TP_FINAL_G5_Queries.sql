# Búsqueda por clave país!!!! primero Argentina segundo Francia!!!! ;)
SELECT * FROM region_pais 
WHERE region_pais.Pais_Code = 9 or  region_pais.Pais_Code = 68;


#Búsqueda una tabla por 2 claves (en realidad usamos 3 FK dada la cantidad de datos, item 15 trigo)
Select * from fao_data 
where Pais_Code =9 and Item_Code_id =15 and Code_year=2022;
# desde continente a paises (países de  America)
SELECT continente.nombre as Continente, sub_regiones.Region, region_pais.Pais_Code, region_pais.Pais FROM region_pais 
INNER JOIN sub_regiones ON  region_pais.Region_Code = sub_regiones.Region_Code
INNER JOIN continente ON sub_regiones.continente_id = continente.id_continente
WHERE continente.nombre = 'America'
ORDER BY  region_pais.Pais;

# desde pais a continente primero Argentina segundo Francia!!!! ;)
SELECT continente.nombre as Continente, sub_regiones.Region, region_pais.Pais_Code, region_pais.Pais FROM region_pais 
INNER JOIN sub_regiones ON  region_pais.Region_Code = sub_regiones.Region_Code
INNER JOIN continente ON sub_regiones.continente_id = continente.id_continente
WHERE region_pais.Pais = "Argentina" or  region_pais.Pais = "France"
ORDER BY sub_regiones.Region, region_pais.Pais;

# desde pais a sub_region, todos los países que empiezan por A 
SELECT sub_regiones.Region,  region_pais.Pais FROM region_pais 
INNER JOIN sub_regiones ON  region_pais.Region_Code = sub_regiones.Region_Code
WHERE region_pais.Pais LIKE "A%"
ORDER BY sub_regiones.Region, region_pais.Pais;

# desde pais a sub_region, todos los países que empiezan por A 
SELECT sub_regiones.Region,  region_pais.Pais FROM region_pais 
INNER JOIN sub_regiones ON  region_pais.Region_Code = sub_regiones.Region_Code
WHERE sub_regiones.Region LIKE "%Eu%"
ORDER BY sub_regiones.Region, region_pais.Pais;

#Promedio de rendimientos en sudamerica de los distintos items para 2022
SELECT sub_regiones.Region , fd.Item_Code_id, item.Item_desc, ROUND(avg(fd.valor),2) as promedio_2022, fd.Unit
from sub_regiones inner join region_pais on region_pais.Region_Code = sub_regiones.Region_Code
inner join fao_data as fd on  region_pais.Pais_Code =  fd.Pais_Code inner join
item on item.item_Code_id = fd.Item_Code_id
where sub_regiones.Region = "South America" and fd.Code_year = 2022 and fd.Element_Code > 5409 
and fd.Element_Code < 5423 and fd.valor >0
group by fd.Item_Code_id, fd.Element_Code
Order by Item_desc;



create table promedio_5 select fd.Pais_Code, fd.Item_Code_id, fd.Element_Code , Round(avg(fd.valor),2) as promedio ,  fd.Unit
from fao_data as fd 
group by fd.Pais_Code, fd.Item_Code_id, fd.Element_Code;



##DROP INDEX continente ON continente;

#Queries Generales
#cuales son los 5 paises, con mayor superficie promedio cultivada de maiz 2017-2022
SELECT item.Item_desc, region_pais.Pais,elementos.Element_Code,  ROUND(AVG(fd.valor)) as produccion_promedio, fd.Unit, fd.Code_year 
FROM  region_pais 
INNER JOIN fao_data AS fd ON region_pais.Pais_Code = fd.Pais_Code 
INNER JOIN item ON item.item_Code_id = fd.Item_Code_id 
INNER JOIN elementos ON elementos.Element_Code = fd.Element_Code
WHERE item.Item_desc  like "Maize%"  and Code_year >= 2017  and Code_year <= 2022  and fd.Element_Code =5312 
GROUP BY region_pais.Pais_code , item.item_Code_id, fd.Element_Code
order by produccion_promedio desc 
limit 5;

#cuales son los 5 paises, con mayor superficie promedio cultivada de maiz 2017-2022
SELECT item.Item_desc, region_pais.Pais,elementos.Element_Code,  ROUND(AVG(fd.valor)) as produccion_promedio, fd.Unit, fd.Code_year 
FROM  region_pais 
INNER JOIN fao_data AS fd ON region_pais.Pais_Code = fd.Pais_Code 
INNER JOIN item ON item.item_Code_id = fd.Item_Code_id 
INNER JOIN elementos ON elementos.Element_Code = fd.Element_Code
WHERE item.Item_desc  like "Maize%"  and Code_year >= 2017  and Code_year <= 2022  and fd.Element_Code =5312 
GROUP BY region_pais.Pais_code , item.item_Code_id, fd.Element_Code
order by produccion_promedio desc 
limit 5;


#Creación tabla promedio 5 años de todo para el trigger que va a actualizar los promedios 
create table promedio_5 select fd.Pais_Code, fd.Item_Code_id, fd.Element_Code , Round(avg(fd.valor),2) as promedio ,  fd.Unit
from fao_data as fd 
where fd.Code_year > 2017 and fd.valor > 0
group by fd.Pais_Code, fd.Item_Code_id, fd.Element_Code;

ALTER TABLE `promedio_5` ADD UNIQUE `promedio_fx`(`Pais_Code`, `Item_Code_id`, `Element_Code`);