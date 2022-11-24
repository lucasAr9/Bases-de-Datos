-- Agregar Clientes
INSERT INTO Cliente (id, nombre, apellido, DNI, telefono, direccion) VALUES
(NULL, 'Jose', 'Perez', 40123123, 2214950330, '50 n2392'),
(NULL, 'Luis', 'Perez', 42133425, 2214560398, '60 n7657'),
(NULL, 'German', 'Garmendia', 40704956, 2212340334, '70 n456'),
(NULL, 'Nico', 'Liz', 54745234, 2214353627, '80 n765'),
(NULL, 'Pepe', 'Zipper', 54654365, 2218753245, '90 n3456'),
(NULL, 'Juan', 'Cient', 34564375, 2116543566, '52 n643'),
(NULL, 'Carlos', 'Gar', 12345345, 2116725647, '53 n754'),
(NULL, 'Lucas', 'Humer', 65437247, 2213465234, '54 n4573'),
(5002, 'Jorge Luis', 'Castor', 40578999, 2214400789, '11 n2587');


-- Agregar Facturas
INSERT INTO Factura (nroTicket, total, fecha, hora, idCliente_fk) VALUES
(100, 10900.90, '2019-8-10', '09:12:00', 2),
(102, 21900.50, '2022-5-23', '10:53:00', 2),
(103, 92900.50, '2022-6-12', '06:12:00', 3),
(104, 83900.50, '2022-4-21', '06:32:00', 4),
(105, 43455.00, '2022-2-20', '05:11:00', 5),
(106, 44566.00, '2021-9-12', '04:23:00', 6),
(107, 45677.00, '2019-6-1', '04:35:00', 6),
(108, 41244.90, '2021-3-2', '03:34:00', 7),
(109, 43213.80, '2021-12-7', '02:10:00', 8),
(110, 40232.70, '2020-11-5', '01:10:00', 8),
(111, 10000.60, '2020-4-9', '02:10:00', 4),
(112, 20000.95, '2019-6-5', '09:20:00', 3),
(113, 12323.88, '2018-10-19', '11:30:00', 5002);


-- Agregar Producto
INSERT INTO Producto (idProducto, descripcion, precio, nombreP, stock) VALUES
(901, 'buen producto', 3090.90, 'nombre_1', 400),
(902, 'buen producto', 2342.10, 'nombre_2', 500),
(903, 'buen producto', 4658.50, 'nombre_3', 70),
(904, 'buen producto', 8765.50, 'nombre_4', 10),
(905, 'buen producto', 2754.55, 'nombre_5', 79),
(906, 'buen producto', 3464.99, 'nombre_6', 435),
(907, 'buen producto', 4574.77, 'nombre_7', 432),
(908, 'buen producto', 3654.23, 'nombre_8', 764),
(909, 'buen producto', 2346.12, 'nombre_9', 34),
(910, 'buen producto', 2354.10, 'nombre_10', 40),
(911, 'buen producto', 3090.90, 'nombre_1', 400);


-- Agregar Detalle
INSERT INTO Detalle (nroTicket, idProducto, cantidad, precioUnitario) VALUES
(100, 901, 3000, 4000.55),
(102, 902, 8700, 3345.55),
(103, 903, 3043, 7456.55),
(104, 904, 1200, 3453.55),
(105, 905, 6800, 7455.55),
(106, 906, 4000, 6546.55),
(107, 907, 3000, 3450.55),
(108, 908, 2000, 1250.55),
(109, 909, 3000, 1230.55),
(110, 910, 3000, 7800.55),
(111, 911, 3000, 7000.55),
(112, 906, 3000, 6000.55),
(113, 906, 3000, 5000.55);