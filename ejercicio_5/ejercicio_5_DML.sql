/*
Ejercicio 5

Localidad (codigoPostal, nombreL, descripcion, nroHabitantes)
Arbol (nroArbol, especie, años, calle, nro, codigoPostal(fk))
Podador (DNI, nombre, apellido, telefono, fnac, codigoPostalVive(fk))
Poda (codPoda, fecha, DNI(fk), nroArbol(fk))
*/


/*
1. Listar especie, años, calle, nro y localidad de arboles podados
por el podador 'Nico Liz' y por el podador 'Jose Perez'.
*/
SELECT  a.especie, a.anios, a.calle, a.nro, l.nombreL
FROM Arbol a
    INNER JOIN Localidad l ON (a.codigoPostal_fk = l.codigoPostal)
    INNER JOIN Poda po ON (a.nroArbol = po.nroArbol_fk)
    INNER JOIN Podador p ON (po.DNI_fk = p.DNI)
WHERE (p.nombre = 'Nico' AND p.apellido = 'Liz')
INTERSECT (
    SELECT  a.especie, a.anios, a.calle, a.nro, l.nombreL
    FROM Arbol a
        INNER JOIN Localidad l ON (a.codigoPostal_fk = l.codigoPostal)
        INNER JOIN Poda po ON (a.nroArbol = po.nroArbol_fk)
        INNER JOIN Podador p ON (po.DNI_fk = p.DNI)
    WHERE (p.nombre = 'Jose' AND p.apellido = 'Perez')
);


/*
2. Reportar DNI, nombre, apellido, fna y localidad donde viven
podadores que tengan podas durante 2020.
*/
SELECT p.DNI, p.nombre, p.apellido, p.fnac, l.nombreL
FROM Podador p
    INNER JOIN Localidad l ON (p.codigoPostalVive_fk = l.codigoPostal)
    INNER JOIN Poda po ON (p.DNI = po.DNI_fk)
WHERE (po.fecha BETWEEN "2020-01-01" AND "2020-12-31");


/*
3. Listar especie, años, calle, nro y localidad de arboles
que no fueron podados nunca.
*/
SELECT a.nroArbol, a.especie, a.anios, a.calle, a.nro, l.nombreL
FROM Arbol a INNER JOIN Localidad l ON (a.codigoPostal_fk = l.codigoPostal)
WHERE a.nroArbol NOT IN (
    SELECT DISTINCT p.nroArbol_fk FROM Poda p
);


/*
4. Reportar especie, años, calle, nro y localidad de arboles que
fueron podados durante 2020 y no fueron podados durante 2021.
*/
SELECT a.nroArbol, a.especie, a.anios, a.calle, a.nro, l.nombreL
FROM Arbol a
    INNER JOIN Localidad l ON (a.codigoPostal_fk = l.codigoPostal)
    INNER JOIN Poda po ON (a.nroArbol = po.nroArbol_fk)
WHERE (po.fecha BETWEEN "2020-01-01" AND "2020-12-31")
EXCEPT (
    SELECT a.nroArbol, a.especie, a.anios, a.calle, a.nro, l.nombreL
    FROM Arbol a
        INNER JOIN Localidad l ON (a.codigoPostal_fk = l.codigoPostal)
        INNER JOIN Poda po ON (a.nroArbol = po.nroArbol_fk)
    WHERE (po.fecha BETWEEN "2021-01-01" AND "2021-12-31")
);


/*
5. Reportar DNI, nombre, apellido, fnac y localidad donde viven podadores
con apellido terminado con el string 'ata' y que el podador tenga al menos
una poda durante 2018. Ordenar por apellido y nombre.
*/


/*
6. Listar DNI, apellido, nombre, telefono y fecha de nacimiento
de podadores que solo podaron arboles de especie 'Hge'.
*/


/*
7. Listar especie de arboles que se encuentren en la localidad
de 'La Plata' y tambien en la localidad de 'Azul'.
*/


/*
8. Eliminar el podador con DNI: 40123123.
*/


/*
9. Reportar nombre, descripcion y cantidad de habitaciones de
localidades que tengan menos de 100 arbol.
*/
