use g5_fao_der;
select * from fao_data;
flush tables;
#  <<<<<     Comparacion 1   Joins vs Subselect join     >>>>>
# OPTIMA  
 SELECT BENCHMARK(10000000,  (Select count(item.Item_desc)  FROM sub_regiones 
INNER JOIN  region_pais ON sub_regiones.Region_Code = region_pais.Region_Code 
INNER JOIN fao_data AS fd ON region_pais.Pais_Code = fd.Pais_Code 
INNER JOIN item ON item.item_Code_id = fd.Item_Code_id 
INNER JOIN items_agrup ON items_agrup.Item_Code = item.item_Code_id
INNER JOIN agrup_items ON agrup_items.Agrup_Code = items_agrup.Agrup_Code
INNER JOIN elementos ON elementos.Element_Code = fd.Element_Code
WHERE agrup_items.Agrup_Code= 1714 and Code_year > 2011   ));
flush tables;
# QUERY SUBOPTIMA 
 SELECT BENCHMARK(10000000, (Select  count(item_Crops.Item_desc)  FROM
 (SELECT sub_regiones.Region, region_pais.Pais, region_Pais.Pais_Code FROM  sub_regiones 
 INNER JOIN region_pais on sub_regiones.Region_Code = region_pais.Region_Code ) AS region_SA  INNER JOIN 
 (SELECT * FROM fao_data AS fd GROUP BY fd.Pais_code , fd.item_Code_id, fd.Element_Code) AS promedio
ON region_SA.Pais_Code = promedio.Pais_Code INNER JOIN
(SELECT item.item_Code_id, item.Item_desc, agrup_items.item_Group, items_agrup.Agrup_Code FROM item 
INNER JOIN items_agrup ON items_agrup.Item_Code = item.item_Code_id  INNER JOIN agrup_items ON 
agrup_items.Agrup_Code = items_agrup.Agrup_Code ) AS item_Crops ON item_Crops.item_Code_id = promedio.Item_Code_id 
INNER JOIN  elementos ON elementos.Element_Code = promedio.Element_Code
WHERE item_crops.Agrup_Code= 1714  and  Code_year >2011 ));
flush tables;
##  <<<<<     Comparacion 2   Joins vs subselect con joins  >>>>> 
#QUERY OPTIMA  
 SELECT BENCHMARK(20000000,  (select count(promedio) from (SELECT ROUND(AVG(fd.valor),2) as promedio FROM sub_regiones 
right JOIN  region_pais ON sub_regiones.Region_Code = region_pais.Region_Code 
right JOIN fao_data AS fd ON region_pais.Pais_Code = fd.Pais_Code 
left JOIN item ON item.item_Code_id = fd.Item_Code_id 
left JOIN elementos ON elementos.Element_Code = fd.Element_Code
WHERE fd.Code_year > 1970 GROUP BY region_pais.Pais_code , item.item_Code_id, fd.Element_Code ) as promedio));
flush tables;
# QUERY SUBOPTIMA
 SELECT BENCHMARK(20000000,  ( SELECT count(datos.promedio)  FROM
 (SELECT sub_regiones.Region, region_pais.Pais, region_Pais.Pais_Code FROM 
sub_regiones INNER JOIN region_pais on sub_regiones.Region_Code = region_pais.Region_Code) AS region_join  INNER JOIN
(SELECT fd.Pais_Code,fd.Item_Code_id, fd.Element_Code, fd.unit, ROUND(AVG(fd.valor),2) as promedio
FROM fao_data AS fd WHERE Code_year >1970  GROUP BY fd.Pais_code , fd.item_Code_id, fd.Element_Code ) AS datos
ON region_join.Pais_Code = datos.Pais_Code
INNER JOIN item ON item.item_Code_id = datos.Item_Code_id 
INNER JOIN elementos ON elementos.Element_Code = datos.Element_Code ));
flush tables;
#<<<<<<<<<<<<<<<<     Comparacion 3 Joins vs Subselects WHERE IN   <<<<<  
# Optima 
 SELECT BENCHMARK(3000000,  (SELECT count(datos.Element_Code) from (SELECT fd.Pais_Code,fd.Item_Code_id, fd.Element_Code,  
fd.unit, fd.valor , fd.Code_year FROM fao_data AS fd
INNER JOIN item ON item.item_Code_id = fd.Item_Code_id 
INNER JOIN items_agrup ON items_agrup.Item_Code = item.item_Code_id
WHERE  items_agrup.Agrup_Code = 1714 and fd.Code_year > 1970) as datos ));
flush tables;
#suboptima  where in  
 SELECT BENCHMARK(3000000,  (SELECT count(*) from ( Select * from
(SELECT fd.Pais_Code,fd.Item_Code_id, fd.Element_Code,  fd.unit, fd.valor , fd.Code_year
FROM fao_data AS fd )as datos
WHERE datos.Item_Code_id in 
(select item.item_Code_id  from item where item.item_Code_id in 
(SELECT Item_Code from items_Agrup where Agrup_Code = 1714))
and Code_year > 1970) as datos));
flush tables;
#<<<<<<<<<<<<<<<<     Comparacion 4 Joins vs Subselects WHERE IN <<<<< 
# Optima 
 SELECT BENCHMARK(400000,  (SELECT count(*) FROM fao_data AS fd
INNER JOIN item ON item.item_Code_id = fd.Item_Code_id  INNER JOIN items_agrup ON items_agrup.Item_Code = item.item_Code_id
WHERE   items_agrup.Agrup_Code = "1714"  and fd.Code_year > 2000));
flush tables;
# suboptima con where in  
 SELECT BENCHMARK(400000,  (Select count(*) from (SELECT fd.Pais_Code,fd.Item_Code_id, fd.Element_Code,  
fd.unit, fd.valor , fd.Code_year FROM fao_data AS fd ) as datos
WHERE datos.Item_Code_id in  (select item.item_Code_id  from item where item.item_Code_id in 
(SELECT Item_Code from items_Agrup where Agrup_Code = "1714")) and Code_year > 2000));
flush tables;
