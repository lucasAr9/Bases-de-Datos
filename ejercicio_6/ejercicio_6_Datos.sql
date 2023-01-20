INSERT INTO Tecnico (codTecnico, nombre, especialidad) VALUES
(1, 'Jose Perez', 'reparacion'),
(2, 'Luis Perez', 'reparacion'),
(3, 'German Garmendia', 'reparacion'),
(4, 'Nico Liz', 'inspector'),
(5, 'Pepe Zipper', 'inspector'),
(6, 'Juan Cient', 'inspector'),
(7, 'Carlos Gar', 'inspector'),
(8, 'Lucas Humer', 'refrigeracion de material de construccion'),
(9, 'Jorge Luis Castor', 'refrigeracion de material de construccion');


INSERT INTO Repuesto (codRepuesto, nombre, stock, precio) VALUES
(100, 'cauchos', 78, 423),
(101, 'mangeras', 20, 4500),
(102, 'llave', 5, 900),
(103, 'alicate', 3, 200),
(104, 'tornillo', 650, 100),
(105, 'flotador', 43, 800),
(106, 'sifones', 16, 540),
(107, 'cheques', 7, 77),
(108, 'llave final de media', 19, 4090),
(109, 'arboles de entrada', 34, 700),
(110, 'arboles de salida', 32, 700);


INSERT INTO Reparacion (nroReparacion, codTecnico_fk, precioTotal, fecha) VALUES
(500, 1, 50400, '2019-8-10'),
(501, 2, 40400, '2022-5-23'),
(502, 3, 70234, '2022-6-12'),
(503, 4, 642, '2022-4-21'),
(504, 4, 23423, '2022-2-20'),
(505, 4, 14555, '2021-9-12'),
(506, 5, 12255, '2019-6-1'),
(507, 6, 6436, '2021-3-2'),
(508, 7, 60400, '2021-12-7'),
(509, 7, 12333, '2020-11-5'),
(510, 8, 8462, '2020-4-9'),
(511, 7, 400, '2019-6-5'),
(512, 6, 505, '2018-10-19');


INSERT INTO RepuestoReparacion (nroReparacion_fk, codRepuesto_fk, cantidad, precio) VALUES
(500, 100, 4, 454),
(501, 100, 6, 4642),
(502, 100, 3, 2345),
(503, 101, 8, 4153),
(504, 102, 11, 6132),
(505, 103, 4, 1111),
(506, 103, 6, 2333),
(507, 103, 56, 4444),
(508, 106, 88, 645),
(509, 107, 190, 1233),
(510, 108, 23, 2523),
(511, 109, 57, 223),
(512, 110, 230, 350);
