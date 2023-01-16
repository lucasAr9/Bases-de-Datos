INSERT INTO Tecnico (codTecnico, nombre, especialidad) VALUES
(1, 'La Plata', 'una descripcion', 4553123);


INSERT INTO Repuesto (codRepuesto, nombre, stock, precio) VALUES
(1, 'La Plata', 'una descripcion', 4553123);


INSERT INTO Reparacion (nroReparacion, codTecnico_fk, precioTotal, fecha) VALUES
(1, 'La Plata', 'una descripcion', 4553123);


INSERT INTO RepuestoReparacion (nroReparacion_fk, codRepuesto_fk, cantidad, precio) VALUES
(1, 'La Plata', 'una descripcion', 4553123);
