-- Agregar Agencias
INSERT INTO Agencia (razon_social, direccion, telefono, e_mail) VALUES
("Agencia_1", "90 n1231", 2216134234, 'hola1@uncorreo.com'),
("Agencia_2", "80 n1231", 2214152345, 'hola2@uncorreo.com'),
("Agencia_3", "70 n1231", 2215435215, 'hola3@uncorreo.com'),
("Agencia_4", "60 n1231", 2211234122, 'hola4@uncorreo.com');
UPDATE Agencia SET e_mail = "hola1@jmail.com" WHERE razon_social = "Agencia_1";

-- Agregar Ciudades
INSERT INTO Ciudad (codigo_postal, nombra_ciudad, anio_creacion) VALUES
(1500, "nombre_1", 1909),
(1502, "nombre_2", 1990),
(1503, "nombre_3", 2011),
(1504, "nombre_4", 2007),
(1505, "nombre_5", 2020);


-- Agregar Clientes
INSERT INTO Cliente (DNI, nombre, apellido, telefono, direccion) VALUES
(40123123, 'Jose', 'Perez', 2214950330, '50 n2392'),
(42133425, 'Luis', 'Perez', 2214560398, '60 n7657'),
(40704956, 'German', 'Garmendia', 2212340334, '70 n456'),
(54745234, 'Nico', 'Liz', 2214353627, '80 n765'),
(54654365, 'Pepe', 'Zipper', 2218753245, '90 n3456'),
(34564375, 'Juan', 'Cient', 2116543566, '52 n643'),
(12345345, 'Carlos', 'Gar', 2116725647, '53 n754'),
(65437247, 'Lucas', 'Humer', 2213465234, '54 n4573'),
(40578996, 'Jorge Luis', 'Castor', 2214400789, '11 n2587');


-- Agregar Viajes
INSERT INTO Viaje (fecha, hora, DNI_fk, cpOrigen_fk, cpDestino_fk, razon_social_fk, descripcion) VALUES
('2019-8-10', '09:12:00', 40123123, 1500, 1503, "Agencia_1", "una descripcion"),
('2022-5-23', '10:53:00', 42133425, 1502, 1504, "Agencia_2", "una descripcion"),
('2022-6-12', '06:12:00', 40704956, 1503, 1505, "Agencia_3", "una descripcion"),
('2022-4-21', '06:32:00', 54745234, 1504, 1503, "Agencia_4", "una descripcion"),
('2022-2-20', '05:11:00', 54654365, 1505, 1504, "Agencia_1", "una descripcion"),
('2021-9-12', '04:23:00', 34564375, 1500, 1505, "Agencia_2", "una descripcion"),
('2019-6-1', '04:35:00', 12345345, 1502, 1500, "Agencia_3", "una descripcion"),
('2021-3-2', '03:34:00', 65437247, 1503, 1502, "Agencia_4", "una descripcion"),
('2021-12-7', '02:10:00',40578996, 1504, 1503, "Agencia_1", "una descripcion"),
('2020-11-5', '01:10:00', 40123123,1505, 1504, "Agencia_2", "una descripcion"),
('2020-4-9', '02:10:00', 42133425, 1500, 1505, "Agencia_3", "una descripcion"),
('2019-6-5', '09:20:00', 40704956, 1502, 1500, "Agencia_4", "una descripcion"),
('2018-10-19', '11:30:00', 54745234, 1503, 1502, "Agencia_1", "una descripcion"),
('2020-11-5', '01:10:00', 54654365, 1504, 1503, "Agencia_2", "una descripcion"),
('2020-4-9', '02:10:00', 34564375, 1505, 1504, "Agencia_3", "una descripcion"),
('2019-6-5', '09:20:00', 12345345, 1500, 1505, "Agencia_4", "una descripcion"),
('2018-10-19', '11:30:00', 65437247, 1500, 1504, "Agencia_1", "una descripcion"),
('2020-11-5', '01:10:00', 40578996, 1500, 1505, "Agencia_2", "una descripcion");
