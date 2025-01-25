
use g5_fao_der;
flush tables;
#<<<<<<<<  Compracion agrupando  por campos texto  y numerico indexado	
# Optima   / Subóptima			
SELECT region_pais.Pais , item.Item_desc, elementos.Element,
fd.unit, sum(fd.valor) AS suma FROM sub_regiones 
INNER JOIN  region_pais ON sub_regiones.Region_Code = region_pais.Region_Code 
INNER JOIN fao_data AS fd ON region_pais.Pais_Code = fd.Pais_Code 
INNER JOIN item ON item.item_Code_id = fd.Item_Code_id 
INNER JOIN items_agrup ON items_agrup.Item_Code = item.item_Code_id
INNER JOIN elementos ON elementos.Element_Code = fd.Element_Code
GROUP BY region_pais.Pais_code , fd.item_Code_id, fd.Element_Code
order BY region_pais.Pais_Code ;

flush tables;
SELECT region_pais.Pais , item.Item_desc, elementos.Element,
fd.unit, sum(fd.valor) AS suma FROM sub_regiones 
INNER JOIN  region_pais ON sub_regiones.Region_Code = region_pais.Region_Code 
INNER JOIN fao_data AS fd ON region_pais.Pais_Code = fd.Pais_Code 
INNER JOIN item ON item.item_Code_id = fd.Item_Code_id 
INNER JOIN items_agrup ON items_agrup.Item_Code = item.item_Code_id
INNER JOIN elementos ON elementos.Element_Code = fd.Element_Code
GROUP BY region_pais.Pais , item.Item_desc, elementos.Element_Code
order BY region_pais.Pais  ;
;
show indexes from region_pais;