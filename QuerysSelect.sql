--QUERYS SELECT--
select * from productos, proveedor where productos.codigo_proveedor=proveedor.codigo;

--CREAR VISTA--
CREATE VIEW view_prod AS 
select razon_social, productos.codigo, productos.descripcion,
(productos.cantidad*productos.precio) total
from productos, proveedor where 
codigo_proveedor=proveedor.codigo
and productos.descripcion like 'm%';

--Ejecutar una vista--
select * from view_prod;

--Actualizar datos obtenidos de otra tabla--
use Devplace;
update detalle_ventas set precio=detalle_ventas.cantidad*productos.precio 
from detalle_ventas inner join productos on detalle_ventas.codigo_producto=productos.codigo
and detalle_ventas.nro_factura='1-45';

--Querys varias-
use Devplace;
update detalle_ventas set precio=productos.precio 
from detalle_ventas inner join productos on detalle_ventas.codigo_producto=productos.codigo;

use Devplace;
update detalle_ventas set subtotal=cantidad*precio;

create view producto_prov as
  select p.descripcion, pr.razon_social from productos p 
  inner join proveedor pr on p.codigo_proveedor=pr.codigo 
  and pr.razon_social like '%soft%';


