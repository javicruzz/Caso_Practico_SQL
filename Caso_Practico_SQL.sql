-- a) Crear la base de datos con el archivo create_restaurant_db.sql

-- b) Explorar la tabla “menu_items” para conocer los productos del menú.

SELECT * FROM menu_items;

-- 1.- Realizar consultas para contestar las siguientes preguntas
-- Encontrar el número de artículos en el menú.

SELECT COUNT (menu_item_id) AS "Número de artículos en el menú" 
FROM menu_items;

-- Respuesta: 32 articulos

-- ¿Cuál es el artículo menos caro y el más caro en el menú?

SELECT item_name, price 
FROM menu_items 
ORDER BY price ASC
LIMIT 1;

SELECT item_name, price 
FROM menu_items 
ORDER BY price DESC
LIMIT 1;

-- Respuesta
-- Menos caro: Edamame
-- Mas caro: Shrimp Scampi

-- ¿Cuántos platos americanos hay en el menú?

SELECT COUNT (*) AS "Platos americanos"
FROM menu_items WHERE category = 'American';

-- Respuesta: 6 platos americanos

-- ¿Cuál es el precio promedio de los platos?

SELECT AVG (price) AS "precio promedio de los platos"
FROM menu_items;

-- Respuesta: El precio promedio de los platos es 13.2859375000000000

--

-- c) Explorar la tabla “order_details” para conocer los datos que han sido recolectados.

SELECT * FROM order_details;

-- 1.- Realizar consultas para contestar las siguientes preguntas:
-- ¿Cuántos pedidos únicos se realizaron en total?

SELECT COUNT(DISTINCT order_id) AS "Pedidos únicos que se realizaron en total"
FROM order_details;

-- Respuesta: 5370 pedidos unicos

-- ¿Cuáles son los 5 pedidos que tuvieron el mayor número de artículos?

SELECT order_id, COUNT (item_id)
FROM order_details
GROUP BY order_id
ORDER BY COUNT (item_id) DESC
LIMIT 5;

-- ¿Cuándo se realizó el primer pedido y el último pedido?

SELECT order_date AS "Primer pedido"
FROM order_details
ORDER BY order_date ASC
LIMIT 1;

SELECT order_date AS "Ultimo pedido"
FROM order_details
ORDER BY order_date DESC
LIMIT 1;

-- Respuesta
-- Primer pedid: 2023-01-01
-- Ultimo pedido: 2023-03-31

-- ¿Cuántos pedidos se hicieron entre el '2023-01-01' y el '2023-01-05'?

SELECT COUNT(DISTINCT order_id) AS "Total de pedidos"
FROM order_details
WHERE order_date BETWEEN '2023-01-01' AND '2023-01-05';

SELECT COUNT(*) AS "Total de pedidos"
FROM order_details
WHERE order_date BETWEEN '2023-01-01' AND '2023-01-05';

-- Respuesta
-- Pedidos unicos: 308
-- Pedidos totales: 702

--

-- d) Usar ambas tablas para conocer la reacción de los clientes respecto al menú.
/* 1.- Realizar un left join entre entre order_details y menu_items con el identificador
item_id(tabla order_details) y menu_item_id(tabla menu_items). */

SELECT *
FROM order_details AS t1
LEFT JOIN menu_items AS t2
ON t1.item_id=t2.menu_item_id;

/* e) Una vez que hayas explorado los datos en las tablas correspondientes y respondido las
preguntas planteadas, realiza un análisis adicional utilizando este join entre las tablas. El
objetivo es identificar 5 puntos clave que puedan ser de utilidad para los dueños del
restaurante en el lanzamiento de su nuevo menú. Para ello, cre */

-- Articulos mas comprados

SELECT t1.item_name, COUNT(t2.item_id) AS "Veces que se compro el articulo"
FROM order_details AS t2
LEFT JOIN menu_items AS t1 ON t2.item_id = t1.menu_item_id
GROUP BY t1.item_name
ORDER BY "Veces que se compro el articulo" DESC;

--