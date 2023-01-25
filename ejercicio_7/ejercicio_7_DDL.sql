----------------------------------------------
-- CREAR BASE DE DATOS
----------------------------------------------
CREATE DATABASE ejercicio_7;


----------------------------------------------
-- CREAR TABLAS
----------------------------------------------
-- Crear tabla Banda
CREATE TABLE Banda (
    codigoB int NOT NULL,
    nombreB varchar(100) NOT NULL,
    genero varchar(100) NOT NULL,
    anio_creacion int NOT NULL,
    PRIMARY KEY (codigoB)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


-- Crear tabla Integrante
CREATE TABLE Integrante (
    DNI int NOT NULL,
    nombre varchar(100) NOT NULL,
    apellido varchar(100) NOT NULL,
    direccion varchar(100) NOT NULL,
    email varchar(100) NOT NULL,
    fechaNac date NOT NULL,
    codigoB_fk int NOT NULL,
    PRIMARY KEY (DNI),

    KEY fk_codigoB (codigoB_fk),
    CONSTRAINT fk_codigoB FOREIGN KEY (codigoB_fk) REFERENCES Banda (codigoB) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


-- Crear tabla Escenario
CREATE TABLE Escenario (
    nroEscenario int NOT NULL,
    nombreEscenario varchar(100) NOT NULL,
    ubicacion varchar(100) NOT NULL,
    cubierto int NOT NULL,
    m2 int NOT NULL,
    descripcion varchar(100) NOT NULL,
    PRIMARY KEY (nroEscenario)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


-- Crear tabla Recital
CREATE TABLE Recital (
    fecha date NOT NULL,
    hora time NOT NULL,
    nroEscenario_fk int NOT NULL,
    codigoB_fk int NOT NULL,
    PRIMARY KEY (fecha, hora, nroEscenario_fk),

    KEY fk_nroEscenario (nroEscenario_fk),
    CONSTRAINT fk_nroEscenario FOREIGN KEY (nroEscenario_fk) REFERENCES Escenario (nroEscenario) ON DELETE CASCADE ON UPDATE CASCADE,

    KEY fk_codigoB2 (codigoB_fk),
    CONSTRAINT fk_codigoB2 FOREIGN KEY (codigoB_fk) REFERENCES Banda (codigoB) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
