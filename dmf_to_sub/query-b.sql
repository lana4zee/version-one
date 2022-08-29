SELECT locationentity.name, AVG(`reading`.vpm25), AVG(`reading`.pm25) from reading, locationentity where reading.locationid= locationentity.idlocation_entity and year(`reading`.`datetime`) = '2019' and reading.`datetime` LIKE '%08:00:00+00:00' GROUP BY locationentity.name