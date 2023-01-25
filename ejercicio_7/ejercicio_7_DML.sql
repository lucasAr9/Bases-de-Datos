/*
Ejercicio 6

Banda (codigoB, nombreB, genero, anio_creacion)
Integrante (DNI, nombre, apellido, direccion, email, fechaNac, codigoB_fk)
Escenario (nroEscenario, nombreEscenario, ubicacion, cubierto, m2, descripcion)
Recital (fecha, hora, nroEscenario_fk, codigoB_fk)
*/


/*
1. Listar DNI, nombre, apellido, direccion y email de integrantes nacidos entre
1980 y 1990 y hayan realido algun recital durante 2022.
*/
SELECT i.DNI, i.nombre, i.apellido, i.direccion, i.email
FROM Integrante i
WHERE (i.fechaNac BETWEEN '1980-01-01' AND '1999-12-31') AND i.DNI IN (
    SELECT i.DNI
    FROM Recital r
        INNER JOIN Integrante i ON (i.codigoB_fk = r.codigoB_fk)
    WHERE (r.fecha BETWEEN '2022-01-01' AND '2022-01-31')
);


/*
2. Reportar nombre, genero y año de creacion de bandas que hayan realizado
recitales durante 2020, pero no hayan tocado el dia '2020-12-10'.
*/
SELECT b.codigoB, b.nombreB, b.genero, b.anio_creacion
FROM Banda b
    INNER JOIN Recital r ON (b.codigoB = r.codigoB_fk)
WHERE (r.fecha BETWEEN '2020-01-01' AND '2020-12-31')
EXCEPT (
    SELECT b.codigoB, b.nombreB, b.genero, b.anio_creacion
    FROM Banda b
        INNER JOIN Recital r ON (b.codigoB = r.codigoB_fk)
    WHERE (r.fecha = '2021-01-23')
);


/*
3. Listar el cronograma de recitales del dia '2020-09-21'. Se debera listar:
nombre de la banda que ejecutara el recital, fecha, hora, y el nombre y
ubicaion del escenario correspondiente.
*/
SELECT b.codigoB, b.nombreB, r.fecha, r.hora, e.nombreEscenario, e.ubicacion
FROM Banda b
    INNER JOIN Recital r ON (b.codigoB = r.codigoB_fk)
    INNER JOIN Escenario e ON (r.nroEscenario_fk = e.nroEscenario)
WHERE (r.fecha = '2020-09-21');


/*
4. Listar DNI, nombre, apellido, email de integrantes que hayan tocado
en el escenario con nombre 'luna' y en el escenario con nombre 'otro'.
*/
SELECT i.DNI, i.nombre, i.apellido, i.email
FROM Integrante i
    INNER JOIN Banda b ON (i.codigoB_fk = b.codigoB)
    INNER JOIN Recital r ON (b.codigoB = r.codigoB_fk)
    INNER JOIN Escenario e ON (r.nroEscenario_fk = e.nroEscenario)
WHERE (e.nombreEscenario = 'luna')
INTERSECT (
    SELECT i.DNI, i.nombre, i.apellido, i.email
    FROM Integrante i
        INNER JOIN Banda b ON (i.codigoB_fk = b.codigoB)
        INNER JOIN Recital r ON (b.codigoB = r.codigoB_fk)
        INNER JOIN Escenario e ON (r.nroEscenario_fk = e.nroEscenario)
    WHERE (e.nombreEscenario = 'otro')
);


/*
5. Reportar nombre, genero y año de creacion de bandas que tengan
mas de 3 integrantes.
*/
SELECT b.codigoB, b.nombreB, b.genero, b.anio_creacion
FROM Banda b
    INNER JOIN Integrante i ON (b.codigoB = i.codigoB_fk)
ORDER BY b.codigoB, b.nombreB, b.genero, b.anio_creacion
HAVING COUNT(*) > 3;


/*
6. Listar nombre de escenario, ubicacion y descripcion de escenarios que solo
tuvieron recitales con genero musical rock. Ordenar por nombre de escenario.
*/
SELECT DISTINCT e.nroEscenario, e.nombreEscenario, e.ubicacion, e.descripcion
FROM Escenario e
    INNER JOIN Recital r ON (e.nroEscenario = r.nroEscenario_fk)
    INNER JOIN Banda b ON (r.codigoB_fk = b.codigoB)
WHERE (b.genero = 'rock');


/*
7. Listar nombre, genero y año de creacion de bandas que hayan realizado
recitales en escenarios cubierton (1) durante 2022.
*/
SELECT DISTINCT b.codigoB, b.nombreB, b.genero, b.anio_creacion
FROM Banda b
    INNER JOIN Recital r ON (b.codigoB = r.codigoB_fk)
    INNER JOIN Escenario e ON (r.nroEscenario_fk = e.nroEscenario)
WHERE (e.cubierto = 1) AND b.codigoB IN (
    SELECT b.codigoB
    FROM Banda b
        INNER JOIN Recital r ON (b.codigoB = r.codigoB_fk)
    WHERE (r.fecha BETWEEN '2022-01-01' AND '2022-12-31')
);


/*
8. Reportar para cada escenario, nombre del escenario y cantidad de
recitales durante 2020.
*/
SELECT e.nroEscenario, e.nombreEscenario, COUNT(*) as cantidad_recitales
FROM Escenario e
    INNER JOIN Recital r ON (e.nroEscenario = r.nroEscenario_fk)
GROUP BY e.nroEscenario, e.nombreEscenario
HAVING (COUNT(*));


/*
9. Modificar el nombre de la banda 'sur10' a 'sur20'
*/
UPDATE Banda SET nombreB = 'sur20' WHERE (nombreB = 'sur10');