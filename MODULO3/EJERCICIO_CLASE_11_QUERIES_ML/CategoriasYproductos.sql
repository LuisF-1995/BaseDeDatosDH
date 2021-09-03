select categoriaNombre, descripcion from categorias;
SELECT * FROM PRODUCTOS WHERE DISCONTINUADO =1;
SELECT * from productos where proveedorID =8;
SELECT * from productos where PrecioUnitario between 10 and 22; 
SELECT * FROM productos WHERE UnidadesStock < NivelReorden ;
SELECT * FROM productos WHERE UnidadesStock < NivelReorden and unidadesPedidas = 0;

select contacto, compania, titulo, pais from clientes where titulo like "owner" order by pais desc ;
select contacto from clientes where contacto like "c%";

select * from facturas order by fechaFactura asc;
select * from facturas where paisEnvio = "USA" and EnvioVia != 3;
select * from facturas where clienteID like "gourl";
select * from facturas where empleadoId in (2,3,5,8,9);

/* 2da parte */

select * from productos order by precioUnitario desc limit 5;
select * from productos order by unidadesStock desc limit 10;
select facturaId, productoID, cantidad from facturaDetalle  where cantidad between 50 and 100 order by cantidad desc;
SELECT FacturaID as NroFactura, ProductoId as Producto, (PrecioUnitario * Cantidad) as Total FROM facturadetalle;

/* extras */
select * from clientes where pais = "brazil" or "mexico" or titulo like "sales%";
select * from clientes where compania like "a%";
select ciudad, contacto as apellidoYnombre, titulo as puesto FROM clientes  where ciudad = "madrid";
select * from facturas where facturaId between 10000 and 10500;
select * from facturas where facturaId between 10000 and 10500 or clienteID like "b%";
select * from facturas where ciudadEnvio = "vancouver" or envioVia = 3;
select * from empleados where apellido like "buchanan";
select * from facturas where empleadoId = 5;



 
