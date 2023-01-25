INSERT INTO Banda (codigoB, nombreB, genero, anio_creacion) VALUES
(1, 'sur10', 'rock', 2019),
(2, 'melta', 'pop', 2015),
(3, 'no y si', 'rock', 2010),
(4, 'atr', 'metal', 2020),
(5, 'elque', 'pop', 2011);


INSERT INTO Integrante (DNI, nombre, apellido, direccion, email, fechaNac, codigoB_fk) VALUES
(40123123, 'Jose', 'Perez', '50 n2392', 'unemail@gmail.com', '1990-9-21', 1),
(42133425, 'Luis', 'Perez', '60 n7657', 'unemail@gmail.com', '1992-12-21', 2),
(40704956, 'German', 'Garmendia', '70 n456', 'unemail@gmail.com', '1999-1-12', 3),
(54745234, 'Nico', 'Liz', '80 n765', 'unemail@gmail.com', '1990-5-16', 4),
(54654365, 'Pepe', 'Zipper', '90 n3456', 'unemail@gmail.com', '1989-7-12', 4),
(34564375, 'Juan', 'Cient', '52 n643', 'unemail@gmail.com', '1999-6-26', 4),
(12345345, 'Carlos', 'Gar', '53 n754', 'unemail@gmail.com', '1989-7-14', 5),
(65437247, 'Lucas', 'Humer', '54 n4573', 'unemail@gmail.com', '1995-8-8', 5),
(40578996, 'Jorge Luis', 'Castor', '11 n2587', 'unemail@gmail.com', '1999-9-9', 5);


INSERT INTO Escenario (nroEscenario, nombreEscenario, ubicacion, cubierto, m2, descripcion) VALUES
(500, 'luna', 'izquierda', 1, 200, 'una descripcion'),
(501, 'otro', 'derecha', 1, 300, 'una descripcion'),
(502, 'alguien', 'derecha', 1, 200, 'una descripcion'),
(503, 'cualquiera', 'derecha', 0, 170, 'una descripcion'),
(504, 'este escenario', 'frente', 0, 240, 'una descripcion'),
(505, 'juancarlos', 'detras', 1, 250, 'una descripcion'),
(506, 'el', 'izquierda', 1, 500, 'una descripcion');


INSERT INTO Recital (fecha, hora, nroEscenario_fk, codigoB_fk) VALUES
('2020-09-21', '14:00', 500, 1),
('2020-09-21', '17:00', 500, 2),
('2020-09-21', '19:00', 500, 3),
('2020-09-21', '22:00', 500, 4),
('2020-12-10', '17:00', 501, 1),
('2020-12-10', '20:00', 501, 2),
('2020-12-10', '21:00', 501, 3),
('2020-12-10', '23:00', 501, 4),
('2021-01-23', '21:00', 502, 3),
('2021-01-23', '23:00', 502, 4),
('2022-05-29', '21:00', 502, 5),
('2022-05-29', '23:00', 502, 1),
('2022-12-24', '21:00', 503, 4),
('2022-12-24', '23:00', 503, 2),
('2023-01-12', '17:00', 504, 1),
('2023-01-12', '20:00', 504, 2),
('2023-01-12', '21:00', 504, 3),
('2023-01-12', '23:00', 504, 4),
('2023-01-18', '17:00', 505, 1),
('2023-01-18', '20:00', 505, 2),
('2023-01-18', '21:00', 505, 3),
('2023-01-18', '23:00', 505, 4),
('2023-01-23', '21:00', 506, 3),
('2023-01-23', '23:00', 506, 4);
