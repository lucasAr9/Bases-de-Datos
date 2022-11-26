/*
Ejercicio 2

AGENCIA (RAZON_SOCIAL, dirección, telef, e-mail)
CIUDAD (CODIGOPOSTAL, nombreCiudad, añoCreación)
CLIENTE (DNI, nombre, apellido, teléfono, dirección)
VIAJE(FECHA, HORA, DNI, cpOrigen(fk), cpDestino(fk), razon_social(fk), descripcion)
*/


/*
1. Listar razón social, dirección y teléfono de agencias que realizaron
viajes desde la ciudad de "nombre_1" (ciudad origen) y que el cliente tenga
apellido "Perez". Ordenar por razón social y luego por teléfono.
*/
SELECT a.razon_social, a.direccion, a.telefono
FROM Agencia a
    INNER JOIN Viaje v ON (a.razon_social = v.razon_social_fk)
    INNER JOIN Ciudad c ON (v.cpOrigen_fk = c.codigo_postal)
WHERE (c.nombra_ciudad = "nombre_1") AND (v.DNI_fk IN (
    SELECT cli.DNI
    FROM Cliente cli
        INNER JOIN Viaje v2 ON (cli.DNI = v2.DNI_fk)
    WHERE (cli.apellido = "Perez")
    )
)
ORDER BY a.razon_social, a.telefono;


/*
2. Listar fecha, hora, datos personales del cliente, ciudad origen y destino
de viajes realizados en enero de 2019 donde la descripción del viaje contenga
el String ‘demorado’.
*/
SELECT v.fecha, v.hora, cli.DNI, cli.nombre, cli.apellido, origen.nombra_ciudad, destino.nombra_ciudad
FROM Viaje v
    INNER JOIN Cliente cli ON (v.DNI_fk = cli.DNI)
    INNER JOIN Ciudad origen ON (v.cpOrigen_fk = origen.codigo_postal)
    INNER JOIN Ciudad destino ON (v.cpDestino_fk = destino.codigo_postal)
WHERE (v.fecha BETWEEN 2019-01-01 AND 2019-01-31) AND (v.descripcion LIKE "%demorado%");


/*
3. Reportar información de agencias que realizaron viajes durante 2019 o que
tengan dirección de mail que termine con ‘@jmail.com’.
*/
SELECT DISTINCT a.razon_social, a.direccion, a.telefono, a.e_mail
FROM Agencia a
    INNER JOIN Viaje v ON (a.razon_social = v.razon_social_fk)
WHERE (v.fecha BETWEEN 2019-01-01 AND 2019-12-31) OR (a.e_mail LIKE "%@jmail.com");


/*
4. Listar datos personales de clientes que viajaron solo con destino a la ciudad
de "nombre_5".
*/
SELECT cli.DNI, cli.nombre, cli.apellido, cli.direccion
FROM Viaje v
    INNER JOIN Ciudad c ON (v.cpDestino_fk = c.codigo_postal)
    INNER JOIN Cliente cli ON (v.DNI_fk = cli.DNI)
WHERE (c.nombra_ciudad = "nombre_5")
EXCEPT (
    SELECT cli.DNI, cli.nombre, cli.apellido, cli.direccion
    FROM Viaje v
        INNER JOIN Ciudad c ON (v.cpDestino_fk = c.codigo_postal)
        INNER JOIN Cliente cli ON (v.DNI_fk = cli.DNI)
    WHERE NOT (c.nombra_ciudad = "nombre_5")
);


/*
5. Informar cantidad de viajes de la agencia con razón social "Agencia_2"
realizados a la ciudad "nombre_4".
*/
SELECT a.razon_social, c.nombra_ciudad, COUNT(*) AS cantidad_viajes
FROM Viaje v
    INNER JOIN Agencia a ON (v.razon_social_fk = a.razon_social)
    INNER JOIN Ciudad c ON (v.cpDestino_fk = c.codigo_postal)
WHERE (a.razon_social = "Agencia_2") AND (c.nombra_ciudad = "nombre_4");


/*
6. Listar nombre, apellido, dirección y teléfono de clientes que
viajaron con todas las agencias.
*/
--------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------
-- (1)
SELECT c.nombre, c.apellido, c.direccion, c.telefono
FROM Cliente c
WHERE NOT EXISTS (
    SELECT a.razon_social
    FROM Agencia a
    WHERE NOT EXISTS (
        SELECT v.razon_social_fk
        FROM Viaje v 
        WHERE (a.razon_social = v.razon_social_fk) AND (c.DNI = v.DNI_fk)
    )
);
/*
-> Aquellos elementos de un conjunto A que se vinculan
con todos los elementos de un conjunto B.

-> Si un Cliente tiene Viaje en todas las Agencias,
entonces no existe Agencia en la que no tenga Viaje.
-> Buscar Clientes para los que no exista Agencia en
la que no exista Viaje de ese cliente en esa Agencia.
*/

-- (2)
SELECT c.nombre, c.apellido, c.direccion, c.telefono
FROM Cliente c
WHERE NOT EXISTS (
    (SELECT a.razon_social FROM Agencia a)
    EXCEPT
    (SELECT v.razon_social_fk FROM Viaje v WHERE v.DNI_fk = c.DNI)
);
/*
-> Restar dos conjuntos para cada Cliente:
    Todas las Agencias del sistema.
    Todas las Agencias en las que tiene Viaje el Cliente.

-> Si un Cliente tiene Viaje en todas las Agencias,
el resultado de la resta es el conjunto vacío.
*/

-- Agregar uno que cumpla la condicion
SELECT v.DNI_fk, v.razon_social_fk
FROM Viaje v
WHERE (v.DNI_fk = 54654365);
INSERT INTO Viaje (fecha, hora, DNI_fk, cpOrigen_fk, cpDestino_fk, razon_social_fk, descripcion) VALUES
('2019-8-10', '09:12:00', 54654365, 1500, 1503, "Agencia_3", "una descripcion"),
('2020-8-10', '08:00:00', 54654365, 1500, 1503, "Agencia_4", "una descripcion");
--------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------


/*
7. Modificar el cliente con DNI: 40123123 actualizando el teléfono a: 221-4400897.
*/
UPDATE Cliente SET telefono = 2214400897 WHERE DNI = 40123123;


/*
8. Listar razon_social, dirección y teléfono de la/s agencias que tengan
mayor cantidad de viajes realizados.
*/
SELECT a.razon_social, a.direccion, a.telefono
FROM Agencia a INNER JOIN Viaje v ON (a.razon_social = v.razon_social_fk)
GROUP BY a.razon_social, a.direccion, a.telefono
HAVING COUNT(*) >= ALL (
    SELECT COUNT(*)
    FROM Viaje v
    GROUP BY v.razon_social_fk
);


/*
9. Reportar nombre, apellido, dirección y teléfono de clientes con al menos 3 viajes.
*/
SELECT c.nombre, c.apellido, c.telefono
FROM Cliente c INNER JOIN Viaje v ON (c.DNI = v.DNI_fk)
GROUP BY c.nombre, c.apellido, c.telefono
HAVING COUNT(*) >= 3;


/*
10. Borrar al cliente con DNI 65437247.
*/
DELETE FROM Viaje WHERE DNI_fk = 65437247;
DELETE FROM Cliente WHERE DNI = 65437247;