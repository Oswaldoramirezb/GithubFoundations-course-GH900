use ch54_monkys_tower;
/*
 Mostrar 10 productos, comenzando con el registro n.11
 Mostrar solo los campos id, name, price
 Ordenar los resultados por el price, name
*/
SELECT id, name, price
	FROM products
    ORDER BY price, name
    LIMIT 10 OFFSET 10;
    
-- Define el valor inicial del rango. 
-- El operador BETWEEN incluye este valor en la búsqueda.
-- cuantos productos hay entre el 100 y 500
SELECT COUNT(*) AS "Productos entre 100 y 500"
FROM products 
WHERE price BETWEEN 100 AND 500;

