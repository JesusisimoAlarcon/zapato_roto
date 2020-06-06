-- ▒▒▒▒▒▒▒▒▒▒▒▒▒ (1) CONSULTA DE LA FACTURACION DE UN CLIENTE ESPECIFICO ▒▒▒▒▒▒▒▒▒▒▒▒▒ --
-- DEBE PASARLE COMO PARAMETRO A LA CONSULTA LA `CEDULA DEL CLIENTE`
-- EJEMPLO HAVING cedula = '10810988017'
SELECT
-- *
-- count(*)
c.cedula, c.nombre, p.pais, f.fecha,count(*) as `cantidad productos`, sum(df.subtotal) as `total facturado`
FROM
cliente c inner join pais p on c.idpais = p.idpais
inner join factura f on f.idcliente=c.idcliente
inner join detalle_factura df on df.idfactura=f.idfactura
-- where c.cedula = '10810988017'
GROUP BY df.idfactura
HAVING c.cedula = '10810988017'
ORDER BY f.fecha ASC;



-- ▒▒▒▒▒▒▒▒▒▒▒▒▒ (2) CONSULTA DE LA FACTURACION DE UN PRODUCTO ESPECIFICO ▒▒▒▒▒▒▒▒▒▒▒▒▒ --
-- DEBE PASARLE COMO PARAMETRO A LA CONSULTA EL `ID DEL PRODUCTO A CONSULTAR`
-- PARA OBTENER EL ID DEL PRODUCTO PUEDE EJECUTAR LA SIGUIENTE CONSULTA
            SELECT
            tz.idtallazapato as ID, z.zapato, c.categoria, t.talla, di.cantidad, di.valor
            FROM
            zapato z inner join talla_zapato tz on z.idzapato=tz.idzapato 
            inner join talla t on tz.idtalla=t.idtalla
            inner join categoria c on z.idcategoria=c.idcategoria
            inner join detalle_ingreso di on di.idtallazapato=tz.idtallazapato;
-- EJEMPLO WHERE ID = '1'
SELECT
tz.idtallazapato as ID, z.zapato, c.categoria, t.talla, f.fecha, cli.nombre, df.cantidad, df.valor, df.impuesto, df.descuento_porcentaje, df.subtotal
FROM
zapato z inner join talla_zapato tz on z.idzapato=tz.idzapato 
inner join talla t on tz.idtalla=t.idtalla
inner join categoria c on z.idcategoria=c.idcategoria
inner join detalle_factura df on df.idtallazapato=tz.idtallazapato
inner join factura f on df.idfactura = f.idfactura
inner join cliente cli on f.idcliente = cli.idcliente
WHERE tz.idtallazapato = 3
ORDER BY f.fecha ASC;




-- ▒▒▒▒▒▒▒▒▒▒▒▒▒ (3) CONSULTA LA FACTURACION DE UN RANGO DE FECHAS ▒▒▒▒▒▒▒▒▒▒▒▒▒ --
-- PARA PODER EJECUTAR LA CONSULTA DEBE PASAR EL RANGO DE FECHAS
-- FECHA INICIAL Y FECHA FINAL EN LA CONSULTA WHERE
-- EJEMPLO `HAVING f.fecha BETWEEN '2020-06-01' and '2020-06-06 18:00'`
SELECT
f.idfactura as ID, f.fecha, c.nombre as `CLIENTE`, count(*) as `CANTIDAD PRODUCTOS`, sum(subtotal) as `TOTAL FACTURADO`
FROM
factura f inner join cliente c on f.idcliente=c.idcliente
inner join detalle_factura df on df.idfactura=f.idfactura
GROUP BY df.idfactura
HAVING f.fecha BETWEEN '2020-06-01' and '2020-06-06 18:00'
ORDER BY f.fecha ASC




-- ▒▒▒▒▒▒▒▒▒▒▒▒▒ (4) CONSULTA DE LOS CLIENTE UNICOS ▒▒▒▒▒▒▒▒▒▒▒▒▒ --
-- CONSULTA DE LOS CLIENTE UNICOS
-- CLIENTES QUE HAN COMPRADO POR LO MENOS UNA VEZ
SELECT
-- *
c.cedula, c.nombre, count(*) as `NUMERO DE COMPRAS`
FROM
cliente c inner join factura f on c.idcliente = f.idcliente
group by f.idcliente