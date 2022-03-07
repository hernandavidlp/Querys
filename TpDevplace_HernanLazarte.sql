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


/*
En el Ejercicio 3 y 4 uso concat y convert porque yo tengo la hora y fecha en un solo campo, 
y no consigo encontrar un nro que me convierta a la salida como yo quiero: (DD/MM/AAAA ##:##:##).
Tambien concatento el nombre y apellido por una cuestión estética. No es necesario.
*/

USE Devplace;
--Ejercicio 1
SELECT c.dni, c.apellido, c.nombre, v.totalventa 'ventas totales' 
FROM ventas v INNER JOIN clientes c 
ON v.codigo_cliente=c.codigo;

--Ejercicio 2
SELECT p.codigo, p.descripcion, dv.subtotal 
FROM productos p inner join detalle_ventas dv
ON p.codigo=dv.codigo_producto and dv.subtotal > 200;

--Ejercicio 3
CREATE VIEW FacturasPorCliente AS
SELECT c.dni 'DNI', CONCAT(c.apellido, ', ', c.nombre) 'Apellido y Nombre', v.nro_factura, 
CONCAT(CONVERT(VARCHAR(10),v.fechayhora_venta,103), ' ',
CONVERT(varchar(8), v.fechayhora_venta, 108)) 'Fecha y Hora', v.totalventa 'Venta Total'
FROM clientes c inner join ventas v
ON c.codigo=v.codigo_cliente;

--Ejercicio 4
DECLARE @nombre_a_buscar varchar(30) = ''; --<<Cargá la variable con el nombre a buscar
SELECT c.dni 'DNI', CONCAT(c.apellido, ', ', c.nombre) 'Apellido y Nombre', 
c.telefono 'Teléfono', v.nro_factura '# Factura', 
CONCAT(CONVERT(varchar(10), v.fechayhora_venta, 103), ' ',  
CONVERT(varchar(8), v.fechayhora_venta, 108)) 'Fecha y Hora'
FROM clientes c inner join ventas v
ON c.codigo=v.codigo_cliente and c.nombre like '%'+@nombre_a_buscar+'%'
ORDER BY c.dni ASC;

--Ejercicio 5
SELECT * FROM productos p inner join detalle_ventas dv 
ON p.codigo=dv.codigo_producto 
ORDER BY p.codigo DESC;



