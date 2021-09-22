USE `emarket`;
# Parte 1
# 1
CREATE VIEW facturacion AS
SELECT 
    FacturaID AS 'Nº Factura',
    DATE_FORMAT(FechaFactura, '%d/%m/%Y') AS 'Fecha Factura',
    DATE_FORMAT(FechaEnvio, '%d/%m/%Y') AS 'Fecha Envio',
    round(Transporte, 2) AS 'Valor Transporte',
    concat(DireccionEnvio, ', ', CiudadEnvio, ', ', CodigoPostalEnvio, ', ', PaisEnvio) AS 'Destino'
FROM
    facturas;

SELECT `Nº Factura`,  `Fecha Envio`, `Fecha Factura`, `Valor Transporte`, `Destino`, count(*) AS 'Cant. Facturas' FROM facturacion
GROUP BY Destino
order by 6 ASC;

#3
CREATE VIEW facturasxcorreo AS
SELECT 
    FacturaID AS 'Nº Factura',
    DATE_FORMAT(FechaFactura, '%d/%m/%Y') AS 'Fecha Factura',
    DATE_FORMAT(FechaEnvio, '%d/%m/%Y') AS 'Fecha Envio',
    round(Transporte, 2) AS 'Valor Transporte',
    concat(DireccionEnvio, ', ', CiudadEnvio, ', ', CodigoPostalEnvio, ', ', PaisEnvio) AS 'Destino',
    Compania AS 'Correo'
FROM
    facturas
    INNER JOIN correos ON facturas.EnvioVia = correos.CorreoID;
    
SELECT `Correo`, `Valor Transporte`, count(*) AS 'Cant. Facturas' FROM facturasxcorreo
GROUP BY `Correo`;


# Parte 2
CREATE VIEW vw_productos AS
SELECT 
    p.ProductoID AS 'Producto ID',
    p.ProductoNombre AS 'Nombre',
    p.UnidadesStock AS 'Unidades Stock',
    c.CategoriaNombre AS 'Categoria',
    p.PrecioUnitario AS 'Prec. Unitario',
    fd.Cantidad AS 'Cantidad'
FROM
    facturadetalle AS fd
        INNER JOIN
    facturas AS f ON fd.FacturaID = f.FacturaID
        INNER JOIN
    productos AS p ON fd.ProductoID = p.ProductoID
        INNER JOIN
    categorias AS c ON p.CategoriaID = c.CategoriaID;
    
SELECT `Producto ID`, `Nombre`, `Categoria`, `Prec. Unitario` FROM vw_productos;





