-- Agregar Localidades
INSERT INTO Localidad (codigoPostal, nombreL, descripcion, nroHabitantes) VALUES
(1, 'La Plata', 'una descripcion', 4553123),
(2, 'Azul', 'una descripcion', 203123),
(3, 'Bahia Blanca', 'una descripcion', 5125),
(4, 'Berisso', 'una descripcion', 11346),
(5, 'Campana', 'una descripcion', 613477),
(6, 'Chacabuco', 'una descripcion', 12346),
(7, 'Costa Chica', 'una descripcion', 7234554),
(8, 'Daireaux', 'una descripcion', 2346),
(9, 'Ensenada', 'una descripcion', 523132);


-- Agregar Arboles
INSERT INTO Arbol (nroArbol, especie, anios, calle, nro, codigoPostal_fk) VALUES
(100, 'Pinus Lawsonii', 80, 44, 40, 1),
(101, 'Pinus Leiophylla', 89, 45, 41, 1),
(102, 'Quercus Laurina', 99, 46, 42, 2),
(103, 'Quercus Crassifolia', 10, 60, 43, 3),
(104, 'Clethra mexicana', 40, 61, 44, 4),
(105, 'Cornus Disciflora', 86, 55, 45, 4),
(106, 'Styrax Argenteus', 150, 56, 46, 4),
(107, 'Ternstroemia Kubeata', 129, 44, 47, 5),
(108, 'Hge', 30, 44, 48, 8),
(109, 'Solanum 1', 34, 66, 49, 8),
(110, 'Solanum 2', 62, 66, 50, 9),
(111, 'Solanum 3', 236, 67, 51, 9);


-- Agregar Podadores
INSERT INTO Podador (DNI, nombre, apellido, telefono, fnac, codigoPostalVive_fk) VALUES
(40123123, 'Jose', 'Perez', 2214950330, '1999-8-10', 1),
(42133425, 'Luis', 'Perez', 2214560398, '1980-5-23', 2),
(40704956, 'German', 'Garmendia', 2212340334, '2002-6-12', 3),
(54745234, 'Nico', 'Liz', 2214353627, '2001-4-21', 1),
(54654365, 'Pepe', 'Zipper', 2218753245, '2010-4-21', 4),
(34564375, 'Juan', 'Cient', 2116543566, '2000-4-2', 5),
(12345345, 'Carlos', 'Gar', 2116725647, '1992-4-1', 6),
(65437247, 'Lucas', 'Humer', 2213465234, '1998-4-10', 7),
(40578999, 'Jorge Luis', 'Castor', 2214400789, '1990-4-8', 8);


-- Agregar Podas
INSERT INTO Poda (codPoda, fecha, DNI_fk, nroArbol_fk) VALUES
(300, '2022-5-23', 40123123, 100),
(301, '2022-9-20', 42133425, 100),
(302, '2022-2-6', 40704956, 102),
(303, '2022-3-1', 54745234, 102),
(304, '2022-7-11', 40123123, 103),
(305, '2022-1-23', 54654365, 104),
(306, '2022-8-28', 54654365, 105),
(307, '2022-4-19', 12345345, 106),
(308, '2022-11-24', 40123123, 107),
(309, '2021-8-3', 40578999, 108),
(310, '2021-12-8', 40123123, 109),
(311, '2021-5-23', 54654365, 100),
(312, '2021-9-20', 54654365, 100),
(313, '2020-2-6', 40704956, 102),
(314, '2020-3-1', 54745234, 102),
(315, '2020-7-11', 40123123, 103),
(316, '2022-1-23', 42133425, 104),
(317, '2022-8-28', 54654365, 105),
(318, '2021-4-19', 42133425, 106),
(319, '2021-11-24', 54745234, 107),
(320, '2021-8-3', 40578999, 108),
(321, '2021-12-8', 40123123, 109);
