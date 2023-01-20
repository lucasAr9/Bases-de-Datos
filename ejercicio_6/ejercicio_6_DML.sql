/*
Ejercicio 6

Tecnico (codTecnico, nombre, especialidad)
Repuesto (codRepuesto, nombre, stock, precio)
Reparacion (nroReparacion, codTecnico_fk, precioTotal, fecha)
RepuestoReparacion (nroReparacion_fk, codRepuesto_fk, cantidad, precio)
*/


/*
1. Listar todos los repuestos, informando el nombre, stock y precio.
Ordenar el resultado por precio.
*/
SELECT r.codRepuesto, r.nombre, r.stock, r.precio
FROM Repuesto r
ORDER BY r.precio;


/*
2. Listar nombre, stock, precio de repuesto que participaron en reparaciones
durante 2019 y ademas no participaron en reparaciones del tecnico 'Jose Perez'
*/
SELECT repu.codRepuesto, repu.nombre, repu.stock, repu.precio
FROM Repuesto repu
    INNER JOIN RepuestoReparacion rr ON (repu.codRepuesto = rr.codRepuesto_fk)
    INNER JOIN Reparacion r ON (rr.nroReparacion_fk = r.nroReparacion)
    INNER JOIN Tecnico t ON (r.codTecnico_fk = t.codTecnico)
WHERE (r.fecha BETWEEN '2019-01-01' AND '2019-12-31') AND t.codTecnico NOT IN (
    SELECT t.codTecnico
    FROM Tecnico t
    WHERE (t.nombre = 'Jose Perez')
);


/*
3. Listar el nombre y especialidad de tecnicos que no participaron en
ninguna reparacion. Ordenar por nombre ascendentemente.
*/
SELECT t.codTecnico, t.nombre, t.especialidad
FROM Tecnico t
WHERE NOT EXISTS (
    SELECT *
    FROM Reparacion r
    WHERE (r.codTecnico_fk = t.codTecnico)
)
ORDER BY t.nombre;


/*
4. Listar el nombre y especialidad de tecnicos que solo participaron en
reparaciones durante 2020.
*/
SELECT t.codTecnico, t.nombre, t.especialidad
FROM Tecnico t
    INNER JOIN Reparacion r ON (t.codTecnico = r.codTecnico_fk)
WHERE (r.fecha BETWEEN '2020-01-01' AND '2020-12-31')
EXCEPT (
    SELECT t.codTecnico, t.nombre, t.especialidad
    FROM Tecnico t
        INNER JOIN Reparacion r ON (t.codTecnico = r.codTecnico_fk)
    WHERE (r.fecha < '2020-01-01' AND r.fecha > '2020-12-31')
);


/*
5. Listar para cada repuesto. Nombre, stock y cantidad de tecnicos distintos
que lo utilizaron. Si un repuesto no participo en alguna reparacion, igual
debe apareder en dicho listado.
*/
SELECT r.nombre, r.stock, COUNT(DISTINCT repa.codTecnico_fk) as Cantidad_Tecnicos
FROM Repuesto r
    LEFT JOIN RepuestoReparacion rr ON (r.codRepuesto = rr.codRepuesto_fk)
    INNER JOIN Reparacion repa ON (rr.nroReparacion_fk = repa.nroReparacion)
GROUP BY r.codRepuesto, r.nombre, r.stock;


/*
6. Listar nombre y especialidad del tecnico con mayor cantidad de reparaciones
realizadas y el tecnico con menor cantidad de reparaciones.
*/
SELECT t.codTecnico, t.nombre, t.especialidad, COUNT(r.codTecnico_fk) as cantidad
FROM Tecnico t INNER JOIN Reparacion r ON (r.codTecnico_fk = t.codTecnico)
GROUP BY t.codTecnico, t.nombre, t.especialidad
HAVING COUNT(*) >= ALL (
    SELECT COUNT(*)
    FROM Reparacion r
    GROUP BY r.codTecnico_fk
);
SELECT t.codTecnico, t.nombre, t.especialidad, COUNT(r.codTecnico_fk) as cantidad
FROM Tecnico t INNER JOIN Reparacion r ON (r.codTecnico_fk = t.codTecnico)
GROUP BY t.codTecnico, t.nombre, t.especialidad
HAVING COUNT(*) <= ALL (
    SELECT COUNT(*)
    FROM Reparacion r
    GROUP BY r.codTecnico_fk
);


/*
7. Listar nombre, stock y precio de todos los repuestos con stock mayor a 10 y
que dicho repuesto no haya estado en reparacion con precio total superior a 1000.
*/
SELECT r.codRepuesto, r.nombre, r.stock, r.precio
FROM Repuesto r
    INNER JOIN RepuestoReparacion rr ON (r.codRepuesto = rr.codRepuesto_fk)
    INNER JOIN Reparacion repa ON (rr.nroReparacion_fk = repa.nroReparacion)
WHERE (r.stock > 10)
INTERSECT (
    SELECT r.codRepuesto, r.nombre, r.stock, r.precio
    FROM Repuesto r
        INNER JOIN RepuestoReparacion rr ON (r.codRepuesto = rr.codRepuesto_fk)
        INNER JOIN Reparacion repa ON (rr.nroReparacion_fk = repa.nroReparacion)
    WHERE (repa.precioTotal > 1000)
);


/*
8. Proyectar precio, fecha y precio total de aquellas reparaciones donde se
utilizo algun repuesto con precio en el momento de reparacion, mayor a $1000
y menor a $5000.
*/
SELECT rr.precio, repa.fecha, repa.precioTotal
FROM Reparacion repa
    INNER JOIN RepuestoReparacion rr ON (repa.nroReparacion = rr.nroReparacion_fk)
    INNER JOIN Repuesto r ON (r.codRepuesto = rr.codRepuesto_fk)
WHERE (rr.precio >= 1000 AND rr.precio <= 5000);


/*
9. Listar nombre, stock y precio de repuestos que hayan sido utilizados en
todas las reparaciones.
*/
SELECT r.codRepuesto, r.nombre, r.stock, r.precio
FROM Repuesto r
WHERE NOT EXISTS (
    SELECT *
    FROM Reparacion repa
    WHERE NOT EXISTS (
        SELECT *
        FROM RepuestoReparacion rr
        WHERE (r.codRepuesto = rr.codRepuesto_fk) AND (repa.nroReparacion = rr.nroReparacion_fk)
    )
);


/*
10. Listar fecha, tecnico y precio total de aquellas reparaciones que
necesitaron al menos 10 repuestos distintos.
*/
SELECT repa.nroReparacion, repa.fecha, t.nombre, repa.precioTotal
FROM Reparacion repa
    INNER JOIN Tecnico t ON (repa.codTecnico_fk = t.codTecnico)
    INNER JOIN RepuestoReparacion rr ON (repa.nroReparacion = rr.nroReparacion_fk)
GROUP BY repa.nroReparacion, repa.fecha, t.nombre, repa.precioTotal
HAVING (COUNT(*) > 10);
