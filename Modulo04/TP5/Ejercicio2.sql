/*DROP DATABASE IF EXISTS ventas;
CREATE DATABASE ventas CHARACTER SET utf8mb4;
USE ventas;
CREATE TABLE clientes (
id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
nombre VARCHAR(30) NOT NULL,
apellido VARCHAR(30) NOT NULL,
cuitcuil VARCHAR(20),
ciudad VARCHAR(100),
categoría INT UNSIGNED
);
CREATE TABLE vendedores (
id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
nombre VARCHAR(30) NOT NULL,
apellido VARCHAR(30) NOT NULL,
cuitcuil VARCHAR(20),
comisión FLOAT
);
CREATE TABLE pedidos (
id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
cantidad DOUBLE NOT NULL,
fecha DATE,
id_cliente INT UNSIGNED NOT NULL,
id_vendedor INT UNSIGNED NOT NULL,
FOREIGN KEY (id_cliente) REFERENCES clientes(id),
FOREIGN KEY (id_vendedor) REFERENCES vendedores(id)
);
INSERT INTO clientes VALUES(1, 'Aarón', 'Rivero', '20-4148122-1', 'Garuhape',
100);
INSERT INTO clientes VALUES(2, 'Adela', 'Salas', '27-42482596-3', 'Capiovi',
200);
INSERT INTO clientes VALUES(3, 'Adolfo', 'Rubio', '23-37928596-3', 'Posadas',
NULL);
INSERT INTO clientes VALUES(4, 'Adrián', 'Suárez', NULL, 'Jaén', 300);
INSERT INTO clientes VALUES(5, 'Marcos', 'Loyola', '24-42481327-3', 'Posadas',
200);
INSERT INTO clientes VALUES(6, 'María', 'Santana', '27-38771523-1', 'Obera',
100);
INSERT INTO clientes VALUES(7, 'Pilar', 'Ruiz', NULL, 'Sevilla', 300);
INSERT INTO clientes VALUES(8, 'Pepe', 'Ruiz', '20-27436152-2', 'Iguazu', 200);
INSERT INTO clientes VALUES(9, 'Guillermo', 'López', '20-42481328-1',
'Andresito', 225);
INSERT INTO clientes VALUES(10, 'Daniel', 'Santana', '20-40159624-3',
'Apostoles', 125);
INSERT INTO vendedores VALUES(1, 'Daniel', 'Sáez', '24-38481296-3', 0.15);
INSERT INTO vendedores VALUES(2, 'Juan', 'Gómez', '20-39231523-3', 0.13);
INSERT INTO vendedores VALUES(3, 'Diego','Flores', '20-38481221-3', 0.11);
INSERT INTO vendedores VALUES(4, 'Marta','Herrera', '27-40481736-1', 0.14);
INSERT INTO vendedores VALUES(5, 'Antonia','Carretero', '20-31481370-7', 0.12);
INSERT INTO vendedores VALUES(6, 'Manuel','Domínguez', '20-29876342-3', 0.13);
INSERT INTO vendedores VALUES(7, 'Antonio','Vega', '20-32521596-3', 0.11);
INSERT INTO vendedores VALUES(8, 'Alfredo','Ruiz', '20-42436477-3', 0.05);
INSERT INTO pedidos VALUES(1, 150.5, '2020-10-05', 5, 2);
INSERT INTO pedidos VALUES(2, 270.65, '2019-09-10', 1, 5);
INSERT INTO pedidos VALUES(3, 65.26, '2022-10-05', 2, 1);
INSERT INTO pedidos VALUES(4, 110.5, '2021-08-17', 8, 3);
INSERT INTO pedidos VALUES(5, 948.5, '2021-09-10', 5, 2);
INSERT INTO pedidos VALUES(6, 2400.6, '2021-07-27', 7, 1);
INSERT INTO pedidos VALUES(7, 5760, '2018-09-10', 2, 1);
INSERT INTO pedidos VALUES(8, 1983.43, '2021-10-10', 4, 6);
INSERT INTO pedidos VALUES(9, 2480.4, '2019-10-10', 8, 3);
INSERT INTO pedidos VALUES(10, 250.45, '2018-06-27', 8, 2);
INSERT INTO pedidos VALUES(11, 75.29, '2021-08-17', 3, 7);
INSERT INTO pedidos VALUES(12, 3045.6, '2022-04-25', 2, 1);
INSERT INTO pedidos VALUES(13, 545.75, '2022-01-25', 6, 1);
INSERT INTO pedidos VALUES(14, 145.82, '2022-02-02', 6, 1);
INSERT INTO pedidos VALUES(15, 370.85, '2021-03-11', 1, 5);
INSERT INTO pedidos VALUES(16, 2389.23, '2021-03-11', 1, 5);
INSERT INTO pedidos VALUES(17, 275.93, '2021-08-17', 2, 5);
INSERT INTO pedidos VALUES(18, 328.34, '2021-08-17', 1, 3);
INSERT INTO pedidos VALUES(19, 1838.66, '2020-03-19', 3, 4);
INSERT INTO pedidos VALUES(20, 2598.23, '2020-05-21', 5, 1);*/

Select fecha, id, id_cliente, id_vendedor, cantidad from pedidos ORDER BY fecha DESC; 
Select id, cantidad, fecha, id_cliente, id_vendedor from pedidos LIMIT 2; 
Select distinct id_cliente from pedidos; 
Select * from pedidos WHERE fecha BETWEEN '2022-01-01' and '2022-12-31' and cantidad>500; 
Select concat(nombre,' ', apellido) vendedores from vendedores where comisión BETWEEN '0.05' and '0.11'; 
Select MAX(comisión) from vendedores; 
Select id, apellido, nombre from clientes where cuitcuil IS NOT NULL ORDER BY apellido, nombre ASC; 
Select nombre from clientes WHERE nombre LIKE 'A%n' OR nombre LIKE 'P%'ORDER BY nombre ASC; 
Select nombre from clientes WHERE nombre NOT LIKE 'A%' ORDER BY nombre ASC; 
Select distinct nombre from vendedores WHERE nombre LIKE '%el' OR nombre LIKE '%o'; 
Select distinct c.id, c.nombre, c.apellido from clientes c INNER JOIN pedidos p ON c.id = p.id_cliente ORDER BY c.apellido ASC; 
Select * FROM pedidos p INNER JOIN clientes c ON c.id = p.id_cliente ORDER BY c.nombre, c.apellido, c.cuitcuil, c.ciudad, c.categorÍa ASC; 
Select * FROM pedidos p INNER JOIN vendedores v ON v.id = p.id_vendedor ORDER BY v.nombre, v.apellido, v.cuitcuil, v.comisión ASC; 
Select c.*, p.*, v.* FROM clientes c INNER JOIN pedidos p ON c.id = p.id_cliente INNER JOIN vendedores v ON v.id = p.id; 
Select * from clientes c INNER JOIN pedidos p ON c.id = p.id_cliente WHERE p.fecha BETWEEN '2022-01-01' and '2022-12-31' and p.cantidad BETWEEN '300' and '1000'; 
Select v.nombre, v.apellido from vendedores v INNER JOIN pedidos p ON v.id = p.id_vendedor INNER JOIN clientes c ON c.id = p.id_cliente WHERE c.nombre='María' and c.apellido='Santana'; 
Select c.nombre from clientes c INNER JOIN pedidos p ON c.id = p.id_cliente INNER JOIN vendedores v ON v.id = p.id_vendedor WHERE v.nombre='Daniel' and v.apellido='Saez'; 
Select * from clientes c LEFT JOIN pedidos p ON c.id = p.id_cliente ORDER  BY  c.apellido, c.nombre ASC; 
Select * from vendedores v LEFT JOIN pedidos p ON v.id = p.id_vendedor ORDER  BY  v.apellido, v.nombre ASC; 
Select * from clientes c LEFT JOIN pedidos p ON c.id = p.id_cliente WHERE p.id_cliente IS NULL; 
Select * from vendedores v LEFT JOIN pedidos p ON v.id = p.id_vendedor WHERE p.id_cliente IS NULL; 
SELECT  c.apellido, c.nombre from clientes c LEFT JOIN pedidos p ON c.id = p.id_cliente WHERE p.id_cliente IS NULL  UNION  
SELECT  v.apellido, v.nombre from vendedores v LEFT JOIN pedidos p ON v.id = p.id_vendedor WHERE p.id_vendedor IS NULL;  
Select sum(cantidad) from pedidos; 
Select AVG(cantidad) from pedidos; 
Select COUNT(distinct id_vendedor) vendedores FROM pedidos; 
Select COUNT(*) from clientes; 
Select MAX(cantidad) from pedidos; 
Select MIN(cantidad) from pedidos; 
Select ciudad, MAX(categoría) from clientes GROUP BY ciudad; 
Select c.id, c.nombre, c.apellido, p.fecha, MAX(p.cantidad) from clientes c INNER JOIN pedidos p ON c.id = p.id_cliente GROUP BY c.id, p.fecha; 
SELECT c.id, c.nombre, c.apellido, p.fecha, MAX(p.cantidad) from clientes c INNER JOIN pedidos p ON c.id = p.id_cliente 
GROUP BY c.id, p.fecha HAVING MAX(p.cantidad) > 2000; 
Select  v.id,  v.nombre, v.apellido, MAX(p.cantidad) from pedidos p RIGHT JOIN vendedores v ON p.id_vendedor = v.id 
WHERE p.fecha = ' 2021-08-17' GROUP BY v.id; 
Select c.id, c.nombre, c.apellido, COUNT(p.id) from clientes c LEFT JOIN pedidos p ON c.id = p.id_cliente GROUP BY c.id; 
Select c.id, c.nombre, c.apellido, COUNT(p.id) from clientes c LEFT JOIN pedidos p ON c.id = p.id_cliente WHERE YEAR(p.fecha) = 2020 GROUP BY c.id; 
Select YEAR(fecha) año, MAX(cantidad) cantidad from pedidos GROUP BY YEAR(fecha) ;
Select YEAR(fecha) año, COUNT(cantidad) cantidad from pedidos GROUP BY YEAR(fecha) ;
Select * from pedidos WHERE id_cliente = (Select id from clientes WHERE nombre = 'Adela' and apellido = 'Salas'); 
Select COUNT(*) from pedidos WHERE id_vendedor = (Select id from vendedores WHERE nombre = 'Daniel' and apellido = 'Sáez'); 
Select * from clientes WHERE id = (Select id_cliente from pedidos WHERE cantidad = (Select MAX(cantidad) from pedidos WHERE YEAR(fecha) = 2020)); 
Select fecha, cantidad from clientes c INNER JOIN pedidos p ON c.id = p.id_cliente WHERE c.nombre = 'Pepe' and apellido = 'Ruiz' AND p.cantidad = (SELECT MIN(cantidad) from clientes c INNER JOIN pedidos p ON c.id = p.id_cliente   
WHERE c.nombre = 'Pepe' and apellido = 'Ruiz'); 
Select * from clientes WHERE id NOT IN (Select id_cliente from pedidos); 
Select * from vendedores WHERE id NOT IN (Select id_vendedor from pedidos); 
Select * from clientes c WHERE NOT EXISTS (Select id_cliente from pedidos p WHERE c.id = p.id_cliente); 
Select * from vendedores v WHERE  NOT  EXISTS  (Select  id_vendedor  FROM  pedidos p WHERE v.id = p.id_vendedor); 
