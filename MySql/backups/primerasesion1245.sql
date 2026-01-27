select * from ch54_monkys_tower.addresses;

DELETE FROM ch54_monkys_tower.addresses WHERE id = 20;
DELETE FROM `ch54_monkys_tower`.`addresses` WHERE id = 20;
DELETE FROM `ch54_monkys_tower`.`addresses` WHERE id = 19;


-- Seleccionar la DB a usar
USE ch54_monkys_tower;
-- Mostrar todos los campos de la tabla addresses
SELECT * FROM addresses;
-- Mostrar todos los campos de la DB y la tabla
-- nota: de esta forma no es necesario seleccionar previamente la DB
SELECT * FROM ch54_monkys_tower.addresses;


use ch54_monkys_tower;
INSERT INTO `addresses` (`user_id`, `address`, `city`, `state`, `postal_code`, `country`) 
	VALUES (22, 'Av. siempre viva', 'Juárez', 'Colima', '70287', 'Mexico');
    
-- Establecer el contador a un valor determinado
ALTER TABLE addresses AUTO_INCREMENT = 17;