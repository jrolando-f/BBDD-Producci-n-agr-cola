#SELECT * FROM g5_fao_der.fao_data;
use g5_fao_der;
/*#Drop table pruebas;
create table pruebas
select  distinct fao_data.id_produccion as id_prod, fao_data.Pais_Code as Pais_Code, region_pais.Pais as Pais,
 fao_data.Element_Code as element_code, fao_data.valor as valor
from fao_data inner join region_pais on  fao_data.Pais_Code = region_pais.Pais_Code
order by Pais; 
Drop table pruebas2;
create table pruebas2
select  distinct fao_data.id_produccion as id_prod, fao_data.Pais_Code as Pais_Code, region_pais.Pais as Pais,
 fao_data.Element_Code as element_code, fao_data.valor as valor
from fao_data inner join region_pais on  fao_data.Pais_Code = region_pais.Pais_Code
order by valor;  */

flush table;
SHOW INDEX FROM pruebas;


flush table;
select * from pruebas
where element_code >5410 
Order by Pais_Code;
flush table;
select * from pruebas
where element_code >5410 
order by Pais ;

flush table;
ALTER TABLE `g5_fao_der`.`pruebas` 
ADD INDEX `index_pais_code` (`Pais_Code` ASC) VISIBLE;  
SHOW INDEX FROM pruebas;
flush table;
ALTER TABLE `g5_fao_der`.`pruebas` 
ADD INDEX `index_pais` (`Pais` ASC) VISIBLE;  
SHOW INDEX FROM pruebas;

flush table;

select * from pruebas
where element_code >5410 
Order by Pais_Code;

flush table;
select * from pruebas
where element_code >5410 
order by Pais desc ;

drop index index_pais_code on pruebas;
drop index index_pais on pruebas;
SHOW INDEX FROM pruebas;

/*

flush table;
SHOW INDEX FROM pruebas;

flush table;
select * from pruebas
Order by valor;
flush table;

ALTER TABLE `g5_fao_der`.`pruebas` 
ADD INDEX `index_valor` (`valor` ASC) ;  
SHOW INDEX FROM pruebas;

flush table;
select * from pruebas
Order by valor;

flush table;
drop index index_valor on pruebas;
*/
select count(*) from pruebas;

