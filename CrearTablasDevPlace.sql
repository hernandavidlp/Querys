/*Creo la BD si no está creada ya*/
if DB_ID(N'Devplace') IS NULL
create database Devplace;
go
use Devplace;

/*Creo la tabla Proveedor*/
create table proveedor (
codigo int,
razon_social varchar(50),
cuit varchar(11),
direccion varchar(150)
);

/*Creo la tabla Clientes*/
create table clientes(
codigo int,
dni int,
nombre varchar(50),
apellido varchar(50),
fecha_nacimiento date,
email varchar(50),
telefono varchar(12),
direccion varchar(100)
);

/*Creo la tabla producto*/
create table productos(
codigo int,
descripcion varchar(100),
cantidad int default 1,
precio float default 0,
codigo_proveedor int
);

/*Creo la tabla Vendedor*/
create table vendedor(
codigo int,
dni int,
nombre varchar(50),
apellido varchar(50),
fecha_nacimiento date,
profesion varchar(35),
email varchar(50),
telefono varchar(12),
direccion varchar(100)
);

/*Creo la tabla ventas*/
create table ventas(
nro_factura varchar(15), 
fechayhora_venta datetime,
formadepago varchar(30), --VER--
tipodeentrega varchar(50), --VER
totalventa float,
codigo_vendedor int,
codigo_cliente int
);

--CREO TABLA DETALLE VENTAS--
create table detalle_ventas(
nro_factura varchar(15),
precio float,
cantidad int default 1,
codigo_producto int,
subtotal float
);

--VER-- DEBERIA CREARSE ESTA TABLA
create table formadepago(
codigo int,
descripcion varchar(20)
);

--TABLA NUEVA VER--
create table formapago_ventas(
codigo int,
nro_factura_venta varchar(15),
codigo_formapago int,
cuotas tinyint
);



--Para describir la tabla--
use Devplace;
go
exec sp_help 'dbo.clientes';

--otra forma (short form)--
/*Con la forma corta hay que completar todos los campos de la tabla*/

/*
nro_factura varchar(15), 
fechayhora_venta datetime,
formadepago varchar(30), --VER--
tipodeentrega varchar(50), --VER
totalventa float,
codigo_vendedor int,
codigo_cliente int*/

--El comando Truncate VACIA una tabla--
truncate table clientes;

--Agregar restriccion al campo producto para que código sea unico--
alter table productos 
add constraint uni_producto 
unique (codigo); 

--clientes y proveedores 10 registros y productos 20;
--CREAR 20 REGISTROS DE PRODUCTOS--
use Devplace; --listo
insert into productos(codigo, descripcion, cantidad, precio, codigo_proveedor)
values(1, 'Monitor LG 19"', 1, 15900, 1),
(2, 'Procesador Intel i5"', 1, 45870, 1),
(3, 'Mother ASUS GHG-bn2"', 1, 18460, 1),
(4, 'Placa de Video Gforce 2500', 1, 87000, 1),
(5, 'Monitor Asus 24"', 1, 47000.68, 1),
(6, 'Procesador AMD Ryzen',1, 35570.45, 1),
(7, 'Monitor Philips 20"', 1, 15700, 1),
(8, 'Mother Gigabyte klo-f4"', 1, 13900, 1),
(9, 'Lecto-Grabadora DVD', 1, 3560.12, 1),
(10, 'Parlantes Genius 3W RmS', 1, 19690.56, 1),
(11, 'Monitor LG 18.5"', 1, 14500.20, 1),
(12, 'Procesador Intel i3 10th"', 1, 39600.45, 1),
(13, 'Mother ASUS H2B-llk"', 1, 15700, 1),
(14, 'Placa de Video ATI Radeon 800', 1, 75800, 1),
(15, 'Parlantes Edifier 5.1 8W', 1, 33200.70, 1),
(16, 'Procesador AMD Ryzen II',28, 39400.20, 1),
(17, 'Mouse Genius Gamer Pro', 30, 1900, 1),
(18, 'Teclado Mecanico Gamer Pro', 20, 4800, 1),
(19, 'Disco Externo Seagate 2TB', 10, 7900.10, 1),
(20, 'Disco SSD WD 460GB', 1, 5900.30, 1);

--CREAR 10 CLIENTES-- listo
use Devplace;
insert into clientes(codigo, dni, nombre, apellido, fecha_nacimiento, email, telefono, direccion)
values(1, 29789462, 'Lucia', 'Ruzchik', '1980/05/04', 'lu.ruschik_80@hotmail.com', '3754-421587', 'Av. Belgrano 540');
insert into clientes(codigo, dni, nombre, apellido, fecha_nacimiento, email, telefono, direccion)
values(2, 30795123, 'Lucas Daniel', 'Dimarcio', '1970-02-18', 'ludanieldima@gmail.com', '376-4435578', 'Mitre 1890');
insert into clientes(codigo, dni, nombre, apellido, fecha_nacimiento, email, telefono, direccion)
values(3, 25498234, 'Susana', 'Perez', '1979-12-05', 'susiperez@hotmail.com', '3754-422378', 'El Timbo 10');
insert into clientes(codigo, dni, nombre, apellido, fecha_nacimiento, email, telefono, direccion)
values(4, 29723461, 'Rojelio', 'Kreckzowski', '1965-04-30', 'rojeliok65@gmail.com', '3755-432978', 'Av. Blasparera 798');
insert into clientes(codigo, dni, nombre, apellido, fecha_nacimiento, email, telefono, direccion)
values(5, 20589645, 'Andres', 'Lezcano', '1981-07-01', 'lezcano_andres@gmail.com', '3754-412312', 'Av. Velezsarfield 554')
insert into clientes(codigo, dni, nombre, apellido, fecha_nacimiento, email, telefono, direccion)
values(6, 22795345, 'Roxana Daniela', 'Burbich', '1990-11-04', 'roxidani@hotmail.com', '3754-422103', 'Cordoba 724');
insert into clientes(codigo, dni, nombre, apellido, fecha_nacimiento, email, telefono, direccion)
values(7, 29634522, 'Analia', 'Dremich', '1979-10-16', 'ana1979_dre@yahoo.com.ar', '376-4495420', 'Las toscas 321');
insert into clientes(codigo, dni, nombre, apellido, fecha_nacimiento, email, telefono, direccion)
values(8, 24563122, 'Esteban', 'Bonotti', '1982-03-25', 'esteban82bonotti@gmail.com', '3755-457812', 'Mecking y San Luis');
insert into clientes(codigo, dni, nombre, apellido, fecha_nacimiento, email, telefono, direccion)
values(9, 28345678, 'Julio Andres', 'Ledezma', '1980-11-28', 'ledezmaju@hotmail.com', '3755-478999', 'Av. Belgrano 774');
insert into clientes(codigo, dni, nombre, apellido, fecha_nacimiento, email, telefono, direccion)
values(10, 31245852, 'Pedro Dario', 'Adruk', '1984-12-24', 'pedrodar@outlook.com', '3754-424714', 'San Juan 178');

--CREAR 10 VENDEDORES-- listo
Use Devplace;
insert into vendedor(codigo, dni, nombre, apellido, fecha_nacimiento, email, telefono, direccion, profesion)
values(1, 25787936, 'Rossana', 'Dimarcio', '19800504', 'rosasna19@hotmail.com', '3754-421587', 'Av. Belgrano 540','Vendedor Senior');
insert into vendedor(codigo, dni, nombre, apellido, fecha_nacimiento, email, telefono, direccion, profesion)
values(2, 30465123, 'Lucas Angel', 'Ropper', '19700218', 'lucas_a@gmail.com', '376-4435578', 'Mitre 1890','Contador');
insert into vendedor(codigo, dni, nombre, apellido, fecha_nacimiento, email, telefono, direccion, profesion)
values(3, 27463452, 'Adriana', 'Gonzalez', '19791205', 'adry_90@hotmail.com', '3754-422378', 'El Timbo 10','Motomandadista');
insert into vendedor(codigo, dni, nombre, apellido, fecha_nacimiento, email, telefono, direccion, profesion)
values(4, 21458764, 'Rojelio', 'Perez', '19650430', '', '3755-432978', 'Av. Blasparera 798','Repositor');
insert into vendedor(codigo, dni, nombre, apellido, fecha_nacimiento, email, telefono, direccion, profesion)
values(5, 20548978, 'Gimena', 'Diaz', '19810701', 'gimena_2@gmail.com', '3754-412312', 'Av. Velezsarfield 554','Ing. de Software');
insert into vendedor(codigo, dni, nombre, apellido, fecha_nacimiento, email, telefono, direccion, profesion)
values(6, 29768459, 'Susana Abigail', 'Gonzalez', '19901104', 'susyabi@hotmail.com', '3754-422103', 'Cordoba 724','Lic. en Administracion');
insert into vendedor(codigo, dni, nombre, apellido, fecha_nacimiento, email, telefono, direccion, profesion)
values(7, 33458798, 'Andres', 'Allgoros', '19791016', '', '376-4495420', 'Las toscas 321','Relojero');
insert into vendedor(codigo, dni, nombre, apellido, fecha_nacimiento, email, telefono, direccion, profesion)
values(8, 45487656, 'Esteban', 'Ventura', '19820325', 'elventu18@gmail.com', '3755-457812', 'Mecking y San Luis','S/P');
insert into vendedor(codigo, dni, nombre, apellido, fecha_nacimiento, email, telefono, direccion, profesion)
values(9, 40324565, 'Julio', 'Lopez di Maria', '19801128', 'juliodima@hotmail.com', '3755-478999', 'Av. Belgrano 774','Chofer');
insert into vendedor(codigo, dni, nombre, apellido, fecha_nacimiento, email, telefono, direccion, profesion)
values(10, 33321211, 'Pablo Andres', 'Kosachik', '19840524', '', '3754-424714', 'San Juan 178','Vendedor Senior');

alter table vendedor alter column profesion varchar(30);
/*
create table proveedor (
codigo int,
razon_social varchar(50),
cuit varchar(11),
direccion varchar(150);
*/
--CREAR 10 PROVEEDORES--  listo
use Devplace
insert into proveedor(codigo, razon_social, cuit, direccion)
values(1,'InfoTech','30297894622','Av. Mitre 5480'),
(2,'CSD SA','30257896452','Mitre 1890'),
(3,'Informatica Sigma','33245698754','El Timbo 10'),
(4,'OberCom','30245643211','Av. Blasparera 798'),
(5,'Baires Soft','30224578966','Av. Uruguay y Mitre'),
(6,'Full Hard SRL','30256789544','Urunday 478'),
(7,'Nexus SA','30454534125','Av. Belgrano 170'),
(8,'OpenSoft','30297690751','El Timbó y Juan José Paso'),
(9,'Info Main','30296789970','Dr. Tabuenca 358'),
(10,'Mega Soft SRL','33297894623','Los Pioneros y Dr. Hammerly');

--INSERTAR VENTAS--
insert into ventas values('1-45', '20220216 22:10:00', 'Cheque', 'A pie', 12300.25, 1, 1);
insert into ventas values('1-46', '20220216 09:20:00', 'Transferencia', 'A pie', 10450.15, 1, 1);
insert into ventas values('1-47', '20220101 08:10:05', 'Transferencia', 'En local', 10478, 1, 1);
insert into ventas values('1-48', '20220101 08:15:00', 'Efectivo', 'A domicilio', 11980.24, 1, 1);
insert into ventas values('1-49', '20220101 08:01:01', 'Cheque Dif', 'A domicilio', 30456, 1, 1);
insert into ventas values('1-50', '20220102 08:20:50', 'Cheque Dif', 'A domicilio', 45370, 1, 1);
insert into ventas values('1-51', '20220105 09:10:42', 'Efectivo', 'En local', 9845.00, 1, 1);
insert into ventas values('1-52', '20220105 10:05:08', 'Transferencia', 'A domicilio', 15290.00, 1, 1);
insert into ventas values('1-53', '20220106 09:35:01', 'Efectivo', 'En local', 10900.33, 1, 1);
insert into ventas values('1-54', '20220107 16:30:04', 'Transferencia', 'A domicilio', 24300.24, 1, 1);
insert into ventas values('1-55', '20220207 17:00:04', 'Efectivo', 'En local', 45700.28, 1, 1);
insert into ventas values('1-56', '20220114 08:35:01', 'Transferencia', 'A domicilio', 52320.34, 1, 1);
insert into ventas values('1-57', '20220214 08:09:04', 'Efectivo', 'En local', 87600.32, 1, 1);
insert into ventas values('1-58', '2022-02-14T11:24:00', 'Efectivo', 'A domicilio', 90460.45, 1, 1);
insert into ventas values('1-59', '20220214 10:48:04', 'Cheque Dif', 'En local', 10900.22, 1, 1);
insert into ventas values('1-60', '20220214 09:15:01', 'Efectivo', 'A domicilio', 35700.20, 1, 1);
insert into ventas values('1-61', '20220214 10:40:00', 'Transferencia', 'A domicilio', 250400.42, 1, 1);
insert into ventas values('1-62', '20220214 17:18:45', 'Cheque Dif', 'En local', 180600.35, 1, 1);
insert into ventas values('1-63', '20220214 16:20:12', 'Efectivo', 'En local', 26378.30, 1, 1);
insert into ventas values('1-64', '20220214 16:15:45', 'Transferencia', 'A domicilio', 98700.20, 1, 1);
insert into ventas values('1-65', '20220214 17:15:12', 'Efectivo', 'En local', 68790.45, 1, 1);
insert into ventas values('1-66', '20220214 08:45:02', 'Transferencia', 'A domicilio', 128900.01, 1, 1);
insert into ventas values('1-67', '2022-02-24T15:02:02', 'Transferencia', 'A domicilio', 0, 1, 1);


--Tipo forma de insert ISO que permite ingresar la hora y fecha y no se fija el tipo de idioma y formato.
update ventas set fechayhora_venta='2004-05-23T14:25:10' where nro_factura='1-65';

--INSERTAR DATALLE DE VENTAS--
use Devplace;
insert into detalle_ventas (nro_factura, precio, cantidad, codigo_producto, subtotal)values('1-45', 1200, 1, 10, 10850);
insert into detalle_ventas (nro_factura, precio, cantidad, codigo_producto, subtotal)values('1-45', 1250, 1, 8, 5400);
insert into detalle_ventas (nro_factura, precio, cantidad, codigo_producto, subtotal)values('1-46', 2500, 4, 2, 10000);
insert into detalle_ventas (nro_factura, precio, cantidad, codigo_producto, subtotal)values('1-46', 1200, 1, 3, 3600);
insert into detalle_ventas (nro_factura, precio, cantidad, codigo_producto, subtotal)values('1-46', 980, 2, 10, 1200);
insert into detalle_ventas (nro_factura, precio, cantidad, codigo_producto, subtotal)values('1-47', 3578, 2, 4, 7156);
insert into detalle_ventas (nro_factura, precio, cantidad, codigo_producto, subtotal)values('1-47', 1250, 1, 1, 1250);
insert into detalle_ventas (nro_factura, precio, cantidad, codigo_producto, subtotal)values('1-47', 980, 1, 8, 980);
insert into detalle_ventas (nro_factura, precio, cantidad, codigo_producto, subtotal)values('1-48', 35640, 1, 9, 35640);
insert into detalle_ventas (nro_factura, precio, cantidad, codigo_producto, subtotal)values('1-49', 5200, 2, 7, 10400);
insert into detalle_ventas (nro_factura, precio, cantidad, codigo_producto, subtotal)values('1-49', 1300, 2, 4, 2600);
insert into detalle_ventas (nro_factura, precio, cantidad, codigo_producto, subtotal)values('1-50', 84500, 1, 1, 84500);
insert into detalle_ventas (nro_factura, precio, cantidad, codigo_producto, subtotal)values('1-51', 34560, 1, 5, 34560);
insert into detalle_ventas (nro_factura, precio, cantidad, codigo_producto, subtotal)values('1-52', 10230, 1, 8, 10230);
insert into detalle_ventas (nro_factura, precio, cantidad, codigo_producto, subtotal)values('1-52', 1560, 1, 2, 1588);
insert into detalle_ventas (nro_factura, precio, cantidad, codigo_producto, subtotal)values('1-52', 24600, 1, 4, 45378);
insert into detalle_ventas (nro_factura, precio, cantidad, codigo_producto, subtotal)values('1-52', 37500, 1, 1, 1200);
insert into detalle_ventas (nro_factura, precio, cantidad, codigo_producto, subtotal)values('1-53', 1560, 1, 5, 7156);
insert into detalle_ventas (nro_factura, precio, cantidad, codigo_producto, subtotal)values('1-53', 2800, 1, 6, 1200);
insert into detalle_ventas (nro_factura, precio, cantidad, codigo_producto, subtotal)values('1-53', 1500, 1, 7, 25000);
insert into detalle_ventas (nro_factura, precio, cantidad, codigo_producto, subtotal)values('1-54', 6300, 1, 2, 6300);
insert into detalle_ventas (nro_factura, precio, cantidad, codigo_producto, subtotal)values('1-54', 21300, 2, 10, 22600);
insert into detalle_ventas (nro_factura, precio, cantidad, codigo_producto, subtotal)values('1-55', 3578, 8, 6, 87690);
insert into detalle_ventas (nro_factura, precio, cantidad, codigo_producto, subtotal)values('1-56', 2890, 2, 7, 5800);
insert into detalle_ventas (nro_factura, precio, cantidad, codigo_producto, subtotal)values('1-56', 4970, 2, 9, 9900);
insert into detalle_ventas (nro_factura, precio, cantidad, codigo_producto, subtotal)values('1-57', 12000, 1, 10, 12000);
insert into detalle_ventas (nro_factura, precio, cantidad, codigo_producto, subtotal)values('1-58', 24530, 1, 9, 24530);
insert into detalle_ventas (nro_factura, precio, cantidad, codigo_producto, subtotal)values('1-59', 64250, 1, 6, 64250);
insert into detalle_ventas (nro_factura, precio, cantidad, codigo_producto, subtotal)values('1-60', 35690, 1, 4, 35690);
insert into detalle_ventas (nro_factura, precio, cantidad, codigo_producto, subtotal)values('1-60', 1250, 2, 1, 2500);
insert into detalle_ventas (nro_factura, precio, cantidad, codigo_producto, subtotal)values('1-60', 9870, 1, 5, 9870);
insert into detalle_ventas (nro_factura, precio, cantidad, codigo_producto, subtotal)values('1-61', 45789, 1, 8, 45789);
insert into detalle_ventas (nro_factura, precio, cantidad, codigo_producto, subtotal)values('1-62', 43890, 1, 2, 43890);
insert into detalle_ventas (nro_factura, precio, cantidad, codigo_producto, subtotal)values('1-63', 43809, 4, 2, 166000);
insert into detalle_ventas (nro_factura, precio, cantidad, codigo_producto, subtotal)values('1-64', 2540, 2, 2, 5080);
insert into detalle_ventas (nro_factura, precio, cantidad, codigo_producto, subtotal)values('1-64', 1300, 3, 1, 3900);
insert into detalle_ventas (nro_factura, precio, cantidad, codigo_producto, subtotal)values('1-65', 1590, 2, 1, 1590);
insert into detalle_ventas (nro_factura, precio, cantidad, codigo_producto, subtotal)values('1-66', 16200, 2, 1, 16200);



--Mostrar un tope de registros--
use Devplace;
select top 3 * from productos order by codigo asc;

--Permite declarar una variable--
declare @nombreVar datetime = '2022-02-23 21:02:00';
--Convert sireve para convertir un tipo Date a varchar
select CONVERT(varchar(25), @nombreVar,3) s1; --El nro 3 convierte a DMY


--Procedimientos almacenados-- (Para mostrar datos es mas eficiente una View que un StoredProcedure)
create procedure listarproductos AS
begin
--SENTENCIA EN SQL SERVER
select p.codigo 'codigo producto',
pr.codigo 'codigo proveedor',
p.descripcion
from productos p inner join proveedor pr
on p.codigo=pr.codigo
end;

exec listarproductos;
--Fin StoredProcedure

--STOREPROCEDURES--

--Si la condicion no se cumple no agrega el producto. si llegara a encontrar el codigo 100 no lo agregaria
insert into productos (descripcion, codigo, cantidad, precio, codigo_proveedor)
select 'Disco HD Seagate 2TB', 100, 4, 4200,5
where not exists
(select codigo from productos where codigo=100);
/*Para ahorrarme todo esto puedo crear un StoreProcedure
*/
--MANERA 1--
Create procedure Insert_Producto1 
--@nombrevar tipodedato
@codigo int,
@descripcion varchar(100),
@cantidad int,
@precio float,
@codigo_proveedor int
as
begin
insert into productos (codigo, descripcion, cantidad, precio, codigo_proveedor)
select @codigo, @descripcion, @cantidad, @precio, @codigo_proveedor
where not exists
(select codigo from productos where codigo=@codigo)
end

--MANERA 2- (LA MAS EFICIENTE ES ESTA)
Create procedure Insert_Producto2 
--@nombrevar tipodedato
@codigo int,
@descripcion varchar(100),
@cantidad int,
@precio float,
@codigo_proveedor int
as
begin
IF NOT EXISTS (select codigo from productos where codigo=@codigo)
	BEGIN
	insert into productos (codigo, descripcion, cantidad, precio, codigo_proveedor)
	select @codigo, @descripcion, @cantidad, @precio, @codigo_proveedor
	END
	/*Esto lo va a agregar pero si el codigo existe simplemente no lo va a agregar, no va a mostrar error.
	*/
END
exec Insert_Producto2 21,'HD Seagate 2TB BlakMirror',12,4690,5;

--MANERA 2- (LA MAS EFICIENTE ES ESTA)
alter procedure Insert_Producto2 
--@nombrevar tipodedato
@codigo int,
@descripcion varchar(100),
@cantidad int,
@precio float,
@codigo_proveedor int
as
begin
IF NOT EXISTS (select codigo from productos where codigo=@codigo)
	BEGIN
		insert into productos (codigo, descripcion, cantidad, precio, codigo_proveedor)
		select @codigo, @descripcion, @cantidad, @precio, @codigo_proveedor
	END
ELSE
	BEGIN
	/*Esto va a mostrar el elemento repetido si lo hubiere al intentar insertar.
	*/
		select * from productos where codigo=@codigo;
	END
END

create procedure deleteproducto
@codigo int
as
begin
 delete from productos where codigo=@codigo;
end

create procedure opcionesproductos
@codigo int,
@opciones int
as
begin
	if @opciones=1
	begin
		delete from productos where codigo=@codigo;
	end
	if @opciones=2
	begin
		select * from productos where codigo=@codigo;
	end
end

--Eliminar procedures--
if OBJECT_ID('InsertarProductoS1') is not null
drop procedure Insert_Producto1;
else
select 'NO EXISTE EL PROCEDIMIENTO ALMACENADO';


create procedure probando
@codigo int
as
begin
declare @variable int
set variable = @codigo*3;
end

alter table productos add constraint fkcodigoproveedor foreign key 
(codigo_proveedor) references proveedor(codigo);

alter table detalle_ventas add constraint fkcodigoproducto 
foreign key(codigo_producto) references productos(codigo);

alter table proveedor add constraint un_codigo unique(codigo);

--para crear una restriccion es la palabra CONSTRAINT--

--Para renombrar una tabla en SQLServer
exec sp_rename 'producto', 'productos';

/*Agrega un detalle de venta, trayendo el precio de la tabla productos y además calcula el subtotal y 
muestra las tablas actualizadas*/
CREATE PROCEDURE AddDet_Venta
@nro_factura varchar(15),
@cantidad int,
@codigo_producto int
AS
BEGIN
     --Agrega un detalle de venta solamente si la factura ya esta creada en Ventas
	 IF exists (SELECT nro_factura FROM ventas WHERE nro_factura=@nro_factura)
		 BEGIN
		    --Creo variable para asignar el precio
			DECLARE @vPrecio float;
			SET @vPrecio = (SELECT precio FROM productos WHERE codigo=@codigo_producto);

			/*Inserta el detalle de la venta, trayendo el precio de la tabla productos
			y además calcula el subtotal:(precio*cantidad)
			*/
			INSERT INTO detalle_ventas (nro_factura, precio, cantidad, codigo_producto, subtotal)
			SELECT @nro_factura, @vPrecio, @cantidad, @codigo_producto, @vPrecio*@cantidad;
			
			--Actualiza el precio final de la venta: (tabla Ventas)
			UPDATE ventas SET totalventa=(SELECT SUM(subtotal) FROM detalle_ventas WHERE nro_factura=@nro_factura);

			--Muestro el resultado de las 2 tablas actualizadas: Ventas, Detalle_ventas
			SELECT * FROM detalle_ventas WHERE nro_factura=@nro_factura;
			SELECT * FROM ventas WHERE nro_factura=@nro_factura;
		 END
	 ELSE
	 BEGIN
		SELECT 'DEBE CREAR PRIMERO UNA VENTA PARA PODER AGREGAR UN DETALLE DE VENTA';
	 END
END
exec AddDet_Venta '1-67', 1, 5;

/*Esta procedure actualiza los valores de la tabla productos a la tabla
detalle_venta.
*/
create procedure actualizaPrecio
as
begin
	update detalle_ventas 
	set	precio=(select precio from productos p where p.codigo=detalle_ventas.codigo_producto);
end
exec actualizaPrecio;

/*Esta procedure actualiza el subtotal de la tabla detalle_venta.
*/
create procedure actualizaSubtotal
as
begin
	update detalle_ventas 
	set	subtotal=precio*cantidad;
end
exec actualizaSubtotal;
/*Esta procedure actualiza el total de la venta, sumando los subtotales
de la tabla detalle_venta.
*/
create procedure actualizaTotalVenta
as
begin
	update ventas set totalventa=(select sum(dv.subtotal) 
	from detalle_ventas dv where ventas.nro_factura=dv.nro_factura);
end
exec actualizaTotalVenta;

use Devplace;
Update ventas
set totalventa = 45
from ventas v, detalle_ventas dv
where v.nro_factura = dv.nro_factura;


/*
-- TRIGGERS -- SE EJECUTAN SOLOS UNA VEZ DE CREADOS NO SE LOS INVOCA
create trigger nombre
on nombretabal
before insert, update, delete
AS
BEGIN
	SENTENCIA EN SQL A EJECUTAR
END
*/
CREATE TRIGGER PRUEBA
ON CLIENTES
after insert
as
begin
	update clinentes set
	clientes.nombre=upper(pacientes.nombre)
	from
	inserted ins
	inner join paciente pac 
	on (pac.codigo=ins.codigo)
end

/*
Para la proxima clase
Nombre_Apellido_SQL.TXT
1 - Consultar el monto de las ventas de los clinetes.
(traer: nombres completos, DNI, Monto total de ventas)

2-Listar todos los productos con ventas superiores a $200
(Traer: Nombre del producto, codigo producto, monto total vendido)

3- crear una vista para mostrar las facturas de un cliente con sus montos
(Mostrar: DNI, Nombres completos, nrofactura, fecha, total de la venta)

4- consultar las ventas de los clientes filtrandolos por nombres y ordenándolos de manera
asc por dni.
(Traer: Dni, nombres completos, telefono, nrofactura, fecha de ventas)

5-listar los productos que han sido vendidos y ordenarlos de manera desc
por su codigo de producto
(Traer todos los datos)
*/