
use VentasDB


1 - Consultar el monto de las ventas de los clinetes.
(traer: nombres completos, DNI, Monto total de ventas)

select concat(c.nombre,' ',c.apellido)as nombre_completo,c.dni,v.total_venta from clientes c(nolock)
inner join ventas(nolock) v on c.codigo= v.CODIGO_CLIENTE


2-Listar todos los productos con ventas superiores a $200
(Traer: Nombre del producto, codigo producto, monto total vendido)

select p.descripcion as nombre,p.codigo,dv.subtotal from producto(nolock) p 
inner join detalles_ventas(nolock) dv 
on p.codigo = dv.codigo_producto where p.precio>200


3- crear una vista para mostrar las facturas de un cliente con sus montos
(Mostrar: DNI, Nombres completos, nrofactura, fecha, total de la venta)

Create view Facturas
as 
select c.dni,concat(c.nombre,' ', c.apellido)as nombres_completos,dv._numero_factura,v.FECHA_DE_VENTA,v.TOTAL_VENTA from clientes(nolock) c 
inner join ventas(nolock) v 
on c.codigo= v.CODIGO_CLIENTE inner join
detalles_ventas(nolock) dv on v.numero_factura=dv._numero_factura



4- consultar las ventas de los clientes filtrandolos por nombres y ordenándolos de manera
asc por dni.
(Traer: Dni, nombres completos, telefono, nrofactura, fecha de ventas)

declare @NombreCliente varchar(255)= 'Ingrese aqui el nombre por el que quiere filtar la busqueda'
select c.dni,concat(c.nombre,' ',c.apellido)as nombre_completo ,c.telefono,v.numero_factura,v.FECHA_DE_VENTA  from ventas(nolock) v inner join
clientes(nolock) c on v.CODIGO_CLIENTE=c.codigo where nombre= @NombreCliente 
order by dni asc


5-listar los productos que han sido vendidos y ordenarlos de manera desc
por su codigo de producto
(Traer todos los datos)

select *from producto(nolock) p inner join
detalles_ventas(nolock) dv on p.codigo= dv.codigo_producto
order by dv.cantidad desc




