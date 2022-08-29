SELECT locationentity.name, AVG(`reading`.vpm25), AVG(`reading`.pm25) from reading, locationentity where reading.locationid = locationentity.idlocation_entity and year(`reading`.`datetime`) >= '2010-01-01' 
and year(`reading`.`datetime`) <= '2019-12-31' 
and reading.`datetime` LIKE '%08:00:00+00:00' GROUP BY locationentity.name;
