use ch54_monkys_tower;
/*
  La sentencia SELECT en MySQL se utiliza para consultar 
  y recuperar datos de una o más tablas de una base de datos. 
  Es una de las operaciones más fundamentales y utilizadas en SQL.

  SELECT [column_name(s) | *]
	FROM table_name
	[WHERE condition]
	[GROUP BY column_name(s)]
	[HAVING condition]
	[ORDER BY column_name(s) ASC|DESC]
	[LIMIT count];
*/

-- Usa el comodin * para seleccionar todas las columnas
SELECT * FROM users;

-- Especificar las columnas que se quieren obtener
SELECT id, email, phone_number FROM users;

-- Usar un alias para el nombre de las columnas
SELECT 
	id AS identificador,
    email AS "correo electrónico",
    phone_number AS "número de telefóno"
    FROM users;
    
-- ordenar de manera ascendente o descendente las columnas
SELECT id, email, first_name, last_name 
	FROM users
    ORDER BY first_name ASC, last_name;
    
-- limitar numero de resultados
SELECT *
	FROM users
    ORDER BY id
    LIMIT 10;

-- limitar el número de resultado y el inicio de los mismos
SELECT *
	FROM users
    ORDER BY id
    LIMIT 10 OFFSET 15; -- comenzar en el registro 16
    
    
-- mostrar los registros donde el hombre sea "Charles"
SELECT *
	FROM users
    WHERE first_name = "Charles"
    ORDER BY last_name;
    
-- mostrar los registros donde el hombre sea "Charles" o "Michael"
SELECT *
	FROM users
    WHERE first_name = "Charles" OR first_name = "Michael"
    ORDER BY last_name;
    
SELECT *
	FROM users
    WHERE first_name IN ("Charles", "Michael")
    ORDER BY last_name;
    -- TODOS MENOS ESOS NOMBRES
SELECT *
	FROM users
    WHERE first_name NOT IN ("Charles", "Michael")
    ORDER BY last_name;
    
-- SELECCIONA UN RANGO

SELECT *
	FROM users
    WHERE created_at > "2025-01-01" and created_at <= "2025-03-31";
    
SELECT *
	FROM users
    WHERE created_at BETWEEN "2025-01-01" AND "2025-03-31";
    -- NO ESTAN EN EL RANGO
SELECT *
	FROM users
    WHERE created_at NOT BETWEEN "2025-01-01" AND "2025-03-31";

/* COUNT(*): Cuenta el número total de filas en una 
      tabla o grupo, incluyendo filas con valores NULL y duplicados.
   COUNT(column_name): Cuenta el número de filas donde 
      column_name no es NULL. Ignora los valores nulos.
   COUNT(DISTINCT column_name): Cuenta el número de valores únicos
      y no nulos en una columna.
*/

-- Contabilizar numero de registros
SELECT COUNT(*) AS "Total de usuarios"
	FROM users;

/*
	DISTINC : Eliminar filas duplicadas de un resultado de una consulta SELECT. 
    Devuelve únicamente los valores únicos
*/

SELECT COUNT(DISTINCT first_name)
	FROM users;
    
/*
  Patrones de búsqueda
  Comodín _ : busqueda de cualquier caracter
  Comodín % : busqueda de cualquier número de caracteres
*/

-- muestra los usuarios que tengan el email @gmail.commit
SELECT *
	FROM users
    WHERE email LIKE "%@gmail.com";