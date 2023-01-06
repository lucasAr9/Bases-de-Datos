/*
Ejercicio 5

Localidad (codigoPostal, nombreL, descripcion, nroHabitantes)
Arbol (nroArbol, especie, años, calle, nro, codigoPostal(fk))
Podador (DNI, nombre, apellido, telefono, fnac, codigoPostalVive(fk))
Poda (codPoda, fecha, DNI(fk), nroArbol(fk))
*/


/*
Listar especie, años, calle, nro y localidad de arboles podados
por el podador 'Nico Liz' y por el podador 'Jose Perez'.
*/
SELECT  a.especie, a.anios, a.calle
FROM Arbol a
