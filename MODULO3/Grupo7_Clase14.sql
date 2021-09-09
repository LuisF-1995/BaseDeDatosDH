#PARTE 1
#Clientes 1
select count(clienteID) from clientes;

#Clientes 2
select Ciudad, count(clienteID) from clientes
group by Ciudad;

#Facturas 1
select count(transporte) from Facturas;

#Facturas 2
select EnvioVia, count(transporte) from Facturas
group by enviovia;

#Facturas 3
select clienteID, count(facturaID) FROM FACTURAS
group by clienteID
ORDER BY count(facturaid) desc;

#Facturas 4
select clienteID, count(facturaID) FROM FACTURAS
group by clienteID
ORDER BY count(facturaid) desc
limit 5;

#Facturas 5
select PaisEnvio, count(facturaID) from facturas
group by PaisEnvio
ORDER BY count(facturaID)
limit 1;

#Facturas 6
select EmpleadoID, count(facturaID) from facturas
group by EmpleadoID
order by count(facturaID) desc
limit 1;

#Factura Detalle 1
select ProductoID, count(FacturaID) from FacturaDetalle
group by ProductoID
order by count(FacturaID) desc
limit 1;

#Factura Detalle 2
select sum(cantidad*PrecioUnitario)from FacturaDetalle;

#Factura Detalle 3
select ProductoID, sum(cantidad*PrecioUnitario)from FacturaDetalle
Where ProductoID between 30 and 50
group by ProductoID;

#Factura Detalle 4
select ProductoID, avg(PrecioUnitario)from FacturaDetalle
group by ProductoID;

#Factura Detalle 5
select ProductoID, max(PrecioUnitario)from FacturaDetalle
group by ProductoID
order by max(PrecioUnitario) desc
limit 1;

#PARTE 2
# 1 Generar un listado de todas las facturas del empleado 'Buchanan'.
select empleados.apellido, facturas.facturaID from Empleados
inner join Facturas 
on Empleados.empleadoid = facturas.empleadoid
where empleados.apellido like '%Bucha%';

#2 Generar un listado con todos los campos de las facturas del correo 'Speedy
#Express'.




