----------------------------------------------
-- CREAR BASE DE DATOS
----------------------------------------------
CREATE DATABASE ejercicio_5;


----------------------------------------------
-- CREAR TABLAS
----------------------------------------------
-- Crear tabla Localidad
CREATE TABLE Localidad (
    codigoPostal int NOT NULL,
    nombreL varchar(100) NOT NULL,
    descripcion varchar(100) NOT NULL,
    nroHabitantes bigint NOT NULL,
    PRIMARY KEY (codigoPostal)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


-- Crear tabla Arbol
CREATE TABLE Arbol (
    nroArbol int NOT NULL,
    especie varchar(100) NOT NULL,
    anios int NOT NULL,
    calle int NOT NULL,
    nro int NOT NULL,
    codigoPostal_fk int NOT NULL,
    PRIMARY KEY (nroArbol),

    KEY fk_codigoPostal (codigoPostal_fk),
    CONSTRAINT fk_codigoPostal FOREIGN KEY (codigoPostal_fk) REFERENCES Localidad (codigoPostal) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


-- Crear tabla Podador
CREATE TABLE Podador (
    DNI int NOT NULL,
    nombre varchar(100) NOT NULL,
    apellido varchar(100) NOT NULL,
    telefono bigint NOT NULL,
    fnac date NOT NULL,
    codigoPostalVive_fk int NOT NULL,
    PRIMARY KEY (DNI),

    KEY fk_codigoPostalVive (codigoPostalVive_fk),
    CONSTRAINT fk_codigoPostalVive FOREIGN KEY (codigoPostalVive_fk) REFERENCES Localidad (codigoPostal) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


-- Crear tabla Poda
CREATE TABLE Poda (
    codPoda int NOT NULL,
    fecha date NOT NULL,
    DNI_fk int NOT NULL,
    nroArbol_fk int NOT NULL,
    PRIMARY KEY (codPoda),
    
    KEY fk_DNI (DNI_fk),
    CONSTRAINT fk_DNI FOREIGN KEY (DNI_fk) REFERENCES Podador (DNI) ON DELETE CASCADE ON UPDATE CASCADE,

    KEY fk_nroArbol (nroArbol_fk),
    CONSTRAINT fk_nroArbol FOREIGN KEY (nroArbol_fk) REFERENCES Arbol (nroArbol) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
