/*
Ejercicio 1

Cliente(id, nombre, apellido, DNI, telefono, direccion)
Factura (nroTicket, total, fecha, hora, idCliente(fk))
Detalle(nroTicket, idProducto, cantidad, preciounitario)
Producto(idProducto, descripcion, precio, nombreP, stock)
*/


/*
1. Listar datos personales de clientes cuyo apellido comience con
el string ‘Pe’. Ordenar por DNI.
*/
SELECT c.nombre, c.apellido, c.DNI, c.telefono, c.direccion
FROM Cliente c
WHERE (apellido LIKE "Pe%")
ORDER BY c.DNI;


/*
2. Listar nombre, apellido, DNI, telefono y direccion de clientes
que realizaron compras solamente durante 2018.
*/
SELECT c.nombre, c.apellido, c.DNI, c.telefono, c.direccion
FROM Cliente c INNER JOIN Factura f ON (c.id = f.idCliente_fk)
WHERE (f.fecha BETWEEN 2018-01-01 and 2018-12-31)
EXCEPT ( 
    SELECT c.nombre, c.apellido, c.DNI, c.telefono, c.direccion
    FROM Cliente c INNER JOIN Factura f ON (c.id = f.idCliente_fk)
    WHERE (f.fecha < 2018-01-01 and f.fecha > 2018-12-31)
);


/*
3. Listar nombre, descripción, precio y stock de productos 
vendidos al cliente con DNI:42133425, pero que no fueron
vendidos a clientes de apellido "Gar".
*/
SELECT p.nombreP, p.descripcion, p.precio, p.stock
FROM Producto p 
    INNER JOIN Detalle d ON (p.idProducto = d.idProducto)
    INNER JOIN Factura f ON (d.nroTicket = f.nroTicket) 
    INNER JOIN Cliente c ON (f.idCliente_fk = c.id)
WHERE (c.DNI = 42133425)
EXCEPT  (
    SELECT p.nombreP, p.descripcion, p.precio, p.stock
    FROM Producto p 
        INNER JOIN Detalle d ON (p.idProducto = d.idProducto)
        INNER JOIN Factura f ON (d.nroTicket = f.nroTicket) 
        INNER JOIN Cliente c ON (f.idCliente_fk = c.id)
    WHERE (c.apellido = "Gar")
);


/*
4. Listar nombre, descripción, precio y stock de productos no
vendidos a clientes que tengan telefono con característica: 221
(La característica está al comienzo del telefono). Ordenar por nombre.
*/
SELECT p.nombreP, p.descripcion, p.precio, p.stock
FROM Cliente c
    INNER JOIN Factura f ON (c.id = f.idCliente_fk)
    INNER JOIN Detalle d ON (f.nroTicket = d.nroTicket)
    INNER JOIN Producto p ON (d.idProducto = p.idProducto)
WHERE NOT (c.telefono LIKE "221%")
ORDER BY nombreP;


/*
5. Listar para cada producto: nombre, descripción, precio y cuantas veces
fué vendido. Tenga en cuenta que puede no haberse vendido nunca el producto.
*/
SELECT p.nombreP, p.descripcion, p.precio, SUM(d.cantidad) as cantidadVendido
FROM Producto p INNER JOIN Detalle d ON(p.idProducto = d.idProducto)
GROUP BY p.idProducto, p.nombreP, p.descripcion, p.precio;

/*
6. Listar nombre, apellido, DNI, telefono y direccion de clientes
que compraron los productos con nombre "nombre_1" y "nombre_2" pero nunca
compraron el producto con nombre "nombre_3".
*/
SELECT nombre, apellido, DNI, telefono
FROM Producto p 
    INNER JOIN Detalle d ON (p.idProducto = d.idProducto)
    INNER JOIN Factura f ON (d.nroTicket = f.nroTicket) 
    INNER JOIN Cliente c ON (f.idCliente_fk = c.id)
WHERE (nombreP = "nombre_1") AND (c.id IN (
    SELECT c.id
    FROM Producto p 
        INNER JOIN Detalle d ON (p.idProducto = d.idProducto)
        INNER JOIN Factura f ON (d.nroTicket = f.nroTicket) 
        INNER JOIN Cliente c ON (f.idCliente_fk = c.id)
    WHERE (nombreP = "nombre_2")
    )
) EXCEPT(
    SELECT nombre, apellido, DNI, telefono
    FROM Producto p 
        INNER JOIN Detalle d ON (p.idProducto = d.idProducto)
        INNER JOIN Factura f ON (d.nroTicket = f.nroTicket) 
        INNER JOIN Cliente c ON (f.idCliente_fk = c.id)
    WHERE (nombreP = "nombre_3")
);


/*
7. Listar nroTicket, total, fecha, hora y DNI del cliente,
de aquellas facturas donde se haya comprado el producto "nombre_3"
o la factura tenga fecha de 2019.
*/
SELECT f.nroTicket, f.total, f.fecha, f.hora, c.DNI
FROM Producto p 
    INNER JOIN Detalle d ON (p.idProducto = d.idProducto)
    INNER JOIN Factura f ON (d.nroTicket = f.nroTicket) 
    INNER JOIN Cliente c ON (f.idCliente_fk = c.id)
WHERE (p.nombreP = "nombre_3") OR (f.fecha BETWEEN 2019-01-01 AND 2019-12-31);


/*
9. Listar nroTicket, total, fecha, hora para las facturas del
cliente "Luis Pérez" donde no haya comprado el producto "nombre_3".
*/
SELECT f.nroTicket, total, fecha, hora
FROM Producto p 
    INNER JOIN Detalle d ON (p.idProducto = d.idProducto)
    INNER JOIN Factura f ON (d.nroTicket = f.nroTicket) 
    INNER JOIN Cliente c ON (f.idCliente_fk = c.id)
WHERE (nombre = "Luis") AND (apellido = "Perez") AND f.nroTicket NOT IN (
    SELECT f.nroTicket
    FROM Producto p
        INNER JOIN Detalle d ON (p.idProducto = d.idProducto)
        INNER JOIN Factura f ON (d.nroTicket = f.nroTicket) 
        INNER JOIN Cliente c ON (f.idCliente_fk = c.id)
    WHERE (p.nombreP = "nombre_3")
);


/*
10. Listar DNI, apellido y nombre de clientes donde el monto total
comprado, teniendo en cuenta todas sus facturas, supere $80.000.
*/
SELECT c.id, c.DNI, c.apellido, c.nombre
FROM Factura f INNER JOIN Cliente c ON (f.idCliente_fk = c.id)
GROUP BY c.id, c.DNI, c.apellido, c.nombre
HAVING SUM (f.total) > 80000;
