USE emarket;

## Parte I
# 1
CREATE VIEW vw_clientes AS
SELECT ClienteID, Contacto, 
CASE 
	when fax = '' then concat('TEL:', telefono)
	else 
	fax
END
Fax FROM clientes;

SELECT * FROM vw_clientes;

# 2
# a
select ClienteID, Contacto, Telefono from clientes
where fax = '';

# b
SELECT * FROM vw_clientes
WHERE fax like 'TEL%';

# Proveedores
# 1
CREATE VIEW vw_proveedores AS
SELECT 
    ProveedorID,
    Contacto,
    Compania,
    CONCAT(Direccion, ', ', Ciudad, ', ', CodigoPostal, ', ', Pais) AS 'Direccion'
FROM
    proveedores;
    
# 2
#a
SELECT 
    ProveedorID,
    Contacto,
    Compania,
    CONCAT(Direccion, ', ', Ciudad, ', ', CodigoPostal, ', ', Pais) AS 'Direccion'
FROM
    proveedores
    WHERE Direccion LIKE '%Americanas%';
# b
SELECT * FROM vw_proveedores
WHERE Direccion LIKE '%Americanas%Brazil%';


## Parte II
CREATE VIEW vw_controlStock AS
SELECT 
    ProductoID,
    ProductoNombre,
    round(PrecioUnitario) AS 'Pre. Unitario',
    UnidadesStock,
    UnidadesPedidas,
    CASE
    WHEN UnidadesPedidas = 0 then 'BAJA'
    WHEN UnidadesPedidas < UnidadesStock then 'MEDIA'
    WHEN UnidadesPedidas < (2 * UnidadesStock) then 'URGENTE'
    WHEN UnidadesPedidas >= (2 * UnidadesStock) then 'SUPER URGENTE'
    END
    AS 'Prioridad'
FROM
    productos;
    
SELECT 
    Prioridad,
    `Pre. Unitario`,
    COUNT(UnidadesStock) AS 'Unidades Stock',
    ROUND(AVG(`Pre. Unitario`)) AS 'Pre. Promedio'
FROM
    vw_controlstock
GROUP BY 1
HAVING `Unidades Stock` > 5;















