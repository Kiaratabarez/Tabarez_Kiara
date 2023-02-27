/*DROP DATABASE IF EXISTS elsistema;
CREATE DATABASE elsistema CHARACTER SET utf8mb4;
USE elsistema;
CREATE TABLE departamentos (
iddepartamento INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
nombre VARCHAR(100) NOT NULL,
presupuesto DOUBLE UNSIGNED NOT NULL,
estado boolean NOT NULL
);
CREATE TABLE empleados (
idemplaedo INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
cuil_cuit VARCHAR(15) NOT NULL UNIQUE,
nombre VARCHAR(100) NOT NULL,
apellido VARCHAR(100) NOT NULL,
id_departamento INT UNSIGNED,
estado BOOLEAN,
FOREIGN KEY (id_departamento) REFERENCES departamentos(iddepartamento)
);
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

CREATE TABLE Países (
  id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
  Nombre  VARCHAR(45) NOT NULL );
  
CREATE TABLE Provincias (
  id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
  Nombre VARCHAR(45) NOT NULL,
  id_paises INT UNSIGNED,
  FOREIGN KEY (id_paises) REFERENCES Países(id));
  
CREATE TABLE Localidades (
  id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
  Nombre VARCHAR(45) NOT NULL,
  Codigo_Postal  INT NOT NULL,
  id_provincias INT UNSIGNED,
  FOREIGN KEY (id_provincias) REFERENCES Provincias (id));
  

ALTER TABLE empleados
ADD Dirección varchar (45),
ADD Email varchar (50),
ADD Telefono INT,
ADD fecha_ingreso date,
ADD tms timestamp,
ADD id_localidad INT UNSIGNED,
ADD FOREIGN KEY (id_localidad) REFERENCES Localidades (id);

ALTER TABLE departamentos
ADD gasto INT,
ADD tms timestamp;*/

/*nsertar 5 registros en cada tabla de: paises, provincias, localidades, departamentos,
empleados.

INSERT INTO países (id, Nombre) 
VALUES 
('0002', 'Argentina'),
('0003', 'Brasil'), 
('0004', 'Chile'),  
('0005', 'Paraguay'),
('0006', 'Bolivia');

INSERT INTO provincias (id, nombre, id_paises)
VALUES
 ('001', 'Misiones', '0002'),
 ('002', 'Amazonas', '0003'),
 ('003', 'Antofagasta', '0004'),
 ('004', 'Central', '0005'),
 ('005', 'La Paz', '0006');
 
 INSERT INTO localidades (id, nombre, Codigo_Postal, id_provincias)
 VALUES
 ('001','Posadas', '3300','001'),
 ('002', 'Rio', '3010', '002'),
 ('003', 'Santiago', '3011', '003'),
 ('004', 'Areguá', '3012', '004'),
 ('005', 'La Paz', '3013', '005');
 
 INSERT INTO departamentos (iddepartamento, nombre, presupuesto, estado, gasto, tms)
 VALUES 
 ('010','Susan','120000','0','1000', '2020-01-01 03:14:07'),
 ('011','Sergio','130000','1','2000', '2020-02-02 04:14:07'), 
 ('012','Milena','140000','1','3000', '2020-03-03 05:14:07'),
 ('013','Javier','150000','0','4000', '2020-04-04 06:14:07'),
 ('014','Patricia','160000','0','5000', '2020-05-05 07:14:07');
 
 INSERT INTO empleados (idemplaedo, cuil_cuit, nombre, apellido, id_departamento, estado, Dirección, Email, Telefono, fecha_ingreso, tms, id_localidad)
 VALUES 
 ('01', '26589', 'Olga', 'Rodrigez', '010', '0', 'calle 176 7131','laolga15@gmail.com','376476239','2020-03-25','2020-03-25 07:14:08','001'),
 ('02', '45815', 'Ruben', 'Gonzalez', '011', '1', 'calle 149 1831','ruben16@gmail.com','376472969','2020-04-18','2020-04-18 18:14:07','002'),
 ('03', '39273', 'Carlota', 'Torres', '012', '0', 'calle 192 7261','carlota17@gmail.com','376409129','2020-05-05','2020-05-05 05:14:07','003'),
 ('04', '17548', 'Steff' , 'Ferrary', '013','0', 'calle 191 9431','steff18@gmail.com','376449279','2020-06-14','2020-06-14 11:14:07','004'), 
 ('05', '82452', 'Lucas', 'Cunha', '014', '1', 'calle 143 7278','lucas19@gmail.com','376404819','2020-07-06','2020-07-06 10:14:07','005');

Rename table pedidos TO Movimientos 

CREATE TABLE Cajas (
id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
horainicio datetime,
hoacierre datetime,
Estado BOOLEAN,
tms timestamp);


CREATE TABLE Proveedores (
id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
razon_social VARCHAR (45) NOT NULL,
Nombre VARCHAR(45) NOT NULL,
Apellido VARCHAR(45) NOT NULL,
Naturaleza VARCHAR(20) NOT NULL,
cuit INT,
Estado BOOLEAN,
tms timestamp,
id_localidad INT UNSIGNED,
FOREIGN KEY (id_localidad) REFERENCES Localidades(id));


CREATE TABLE Marcas (
id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
Nombre VARCHAR(45) NOT NULL,
Descripcion VARCHAR (150),
Imagen BLOB,
Estado BOOLEAN,
tms timestamp,
id_proveedor INT UNSIGNED,
FOREIGN KEY (id_proveedor) REFERENCES Proveedores(id));


CREATE TABLE Productos (
  id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
  Nombre VARCHAR(45) NOT NULL,
  Descripcion VARCHAR (150),
  Stock INT,
  Precio VARCHAR (45),
  Estado BOOLEAN,
  tms timestamp,
  id_marca INT UNSIGNED,
  FOREIGN KEY (id_marca) REFERENCES Marcas(id)); 
  
 
  
   INSERT INTO Cajas (id,horainicio, hoacierre, Estado, tms)
 VALUES
 ('001', '2020-09-09 17:23:30', '2020-09-09 17:23:30', '1', '2020-03-22 07:14:08'),
 ('002', '2020-10-10 18:23:30', '2020-10-10 18:23:30', '0', '2020-04-30 07:14:08'),
 ('003', '2020-11-22 19:23:30', '2020-11-22 19:23:30', '1', '2020-05-10 07:14:08'),
 ('004', '2020-12-01 20:23:30', '2020-12-01 20:23:30', '0', '2020-06-03 07:14:08'),
 ('005', '2020-07-20 21:23:30', '2020-07-20 21:23:30', '1', '2020-07-14 07:14:08');

INSERT INTO Proveedores (id, razon_social, nombre, apellido, naturaleza ,cuit,id_localidad , estado,tms)
 VALUES
 ('001','insumos', 'Juan', 'Arguello', 'Juridica', '394751', '001', '1', '2020-03-22 07:14:08'),
 ('002','insumos', 'Jorge', 'Ferreira', 'Fisica', '019832', '002', '0', '2020-03-22 07:14:08'),
 ('003','insumos', 'Lucas', 'Guismin', 'Juridica', '937162', '003', '1', '2020-03-22 07:14:08'),
 ('004','insumos', 'Eduardo', 'Rodriguez', 'Fisica', '847613', '004', '0', '2020-03-22 07:14:08'),
 ('005','insumos', 'Liliana', 'Fernandez', 'Fisica', '090876', '005', '1', '2020-03-22 07:14:08'); 
 
  INSERT INTO Marcas (id, nombre, Descripcion, id_proveedor, estado, tms)
 VALUES
 ('001', 'Ala', 'sabor lavanda', '001', '1', '2020-07-22 06:14:08'),
 ('002', 'Coca', 'sabor cola', '002', '0', '2020-03-12 07:14:08'),
 ('003', 'Tang', 'sabor de todo un poco', '003', '0', '2020-02-13 08:14:08'),
 ('004', 'Bimbo', 'sabor pan', '004', '1', '2020-09-14 09:14:08'),
 ('005', 'Arcor', 'sabor frutilla', '005', '1', '2020-05-15 10:14:08'); 
 
  INSERT INTO Productos (id, nombre, descripcion, id_marca , stock, precio, estado, tms)
 VALUES
 ('0001', 'Jabon', 'limpia bien', '001', '100', '200', '1', '2020-05-12 06:14:08'),
 ('0002', 'Gaseosa', 'limpia tornillos', '002', '300', '500', '1', '2020-05-12 06:14:08'),
 ('0003', 'Jugo en sobre', 'diabetes', '003', '1500', '30', '0', '2020-05-12 06:14:08'),
 ('0004', 'Pan', 'riquisimo', '004', '100', '250', '0', '2020-05-12 06:14:08'),
 ('0005', 'Mermelada', 'muy dulce', '005', '800', '300', '1', '2020-05-12 06:14:08'); 
 
 Select nombre, presupuesto, gasto, (presupuesto - gasto) as diferencia from departamentos where estado = 1; 
 
SELECT l.nombre, p.nombre FROM localidades l INNER JOIN países p ON l.id=p.id;

UPDATE empleados
SET  Telefono = '376415693' 
WHERE idemplaedo=1 ; 

UPDATE empleados, localidades
SET  empleados.fecha_ingreso = '2021-05-20',  localidades.Nombre = 'Panambi'
WHERE empleados.idemplaedo = 2 and localidades.id = 2; 

INSERT INTO vendedores (id, nombre, apellido, cuitcuil, comisión)
 VALUES
 ('001', 'Juan', 'Rodriguez', '283746', '20.5'),
 ('002', 'Jorge', 'Fernandez', '093812', '15'),
 ('003', 'Lucas', 'Guismin', '836712', '10.5'),
 ('004', 'Jesica', 'Tabarez', '370954', '30'),
 ('005', 'Sol', 'Gonzalez', '99887', '25.4'); 
 


ALTER TABLE movimientos
ADD estado BOOLEAN,
ADD tms timestamp, 
ADD tipo_movimiento varchar(45), 
ADD id_producto INT UNSIGNED,
ADD FOREIGN KEY (id_producto) REFERENCES productos (id); 


INSERT INTO clientes (id, nombre, apellido, cuitcuil, ciudad, categoría)
 VALUES
('0001', 'Esteban', 'Gutierrez', '092345', 'Posadas', '1'),
('0002', 'Ezequiel', 'Delgado', '123456', 'Ituzaingo', '2'),
('0003', 'Matias', 'Tasara', '039671', 'Buenos aires', '3'),
('0004', 'Juliana', 'Sotelo', '275599', 'ushuaia', '4'),
('0005', 'Josefina', 'Barrera', '295584', 'Candelaria', '4'); 


 INSERT INTO movimientos (id, cantidad, fecha, id_cliente, id_vendedor, estado, tms, tipo_movimiento, id_producto)
 VALUES
 ('0001', '10', '2021-05-15', '0001', '001', '1', '2020-07-22 06:14:08', 'ingreso', '0001'),
 ('0002', '20', '2021-06-22', '0002', '002', '0', '2020-03-12 07:14:08', 'egreso', '0002'),
 ('0003', '17', '2021-07-09', '0003', '003', '0', '2020-02-13 08:14:08', 'pedido', '0003'),
 ('0004', '24', '2021-08-01', '0004', '004', '1', '2020-09-14 09:14:08', 'ingreso', '0004'),
 ('0005', '33', '2021-09-25', '0005', '005', '1', '2020-05-15 10:14:08', 'egreso', '0005'); 
 
 
 UPDATE movimientos
SET  movimientos.estado = '0'
WHERE movimientos.id = 4 and movimientos.id = 5; 

ALTER TABLE localidades
ADD id_paises INT UNSIGNED,
ADD FOREIGN KEY (id_paises) REFERENCES países (id); 

SELECT nombre FROM localidades order by paises; 

select nombre 
    from localidades
order by nombre from países; 

UPDATE productos p
JOIN movimientos m ON p.id = m.id_producto
SET p.Stock = 
  CASE m.tipo_movimiento
    WHEN 'ingreso' THEN p.Stock + m.cantidad
    WHEN 'egreso' THEN p.Stock - m.cantidad
    ELSE p.Stock
  END; 
 
CREATE TABLE Parametros (
id  INT UNSIGNED AUTO_INCREMENT PRIMARY KEY, 
tms timestamp,
cosas json DEFAULT NULL, 
id_usuario INT); 

INSERT INTO parametros (id, tms, cosas, id_usuario)
VALUES 
('001','2020-07-22 06:14:08','{"idDeLaCosa": 101, "permisos": "PUT, GET"}','001'),
('002','2020-08-22 07:14:08','{"vistasPermitidas": "menuPrincipal,menuSecundario,ventas,estadisticaVentas,listaCliente", "grupo": "ventas"}','002'),
('003','2020-09-22 08:14:08','{"zonaHoraria": "America/Argentina/BuenosAires"}','003'),
('004','2020-10-22 09:14:08','{"fechaInicioActividades": "01/01/2019", "mesAperturaCaja": "Enero", "mesCierreCaja":"Diciembre"}','004'),
('005','2020-11-22 10:14:08','{"balancesAniosAnteriores": {"2019": {"ingreso": "7374901.93","egreso":"3732538,75"},"2020":{"ingreso": "27442665,12","egreso": "8522331,82"},"2021": {"ingreso":"31634912,57","egreso": "9757142,66"}}}','005');

*/


 
   
    