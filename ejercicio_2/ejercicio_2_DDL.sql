----------------------------------------------
-- CREAR BASE DE DATOS
----------------------------------------------
CREATE DATABASE ejercicio_2;


----------------------------------------------
-- CREAR TABLAS
----------------------------------------------
-- Crear tabla Agencia
CREATE TABLE Agencia (
    razon_social varchar(100) NOT NULL,
    direccion varchar(100) NOT NULL,
    telefono bigint NOT NULL,
    e_mail varchar(100) NOT NULL,
    PRIMARY KEY (razon_social)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


-- Crear tabla Ciudad
CREATE TABLE Ciudad (
    codigo_postal int NOT NULL,
    nombre_ciudad varchar(100) NOT NULL,
    anio_creacion int NOT NULL,
    PRIMARY KEY (codigo_postal)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


-- Crear tabla Cliente
CREATE TABLE Cliente (
    DNI int NOT NULL,
    nombre varchar(100) NOT NULL,
    apellido varchar(100) NOT NULL,
    telefono bigint NOT NULL,
    direccion varchar(100) NOT NULL,
    PRIMARY KEY (DNI)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


-- Crear tabla Viaje
CREATE TABLE Viaje (
    fecha date NOT NULL,
    hora time NOT NULL,
    DNI_fk int NOT NULL,
    cpOrigen_fk int NOT NULL,
    cpDestino_fk int NOT NULL,
    razon_social_fk varchar(100) NOT NULL,
    descripcion varchar(100) NOT NULL,
    PRIMARY KEY (fecha, hora, DNI_fk),
    
    KEY fk_DNI (DNI_fk),
    CONSTRAINT fk_DNI FOREIGN KEY (DNI_fk) REFERENCES Cliente (DNI) ON DELETE CASCADE ON UPDATE CASCADE,

    KEY fk_cpOrigen (cpOrigen_fk),
    CONSTRAINT fk_cpOrigen FOREIGN KEY (cpOrigen_fk) REFERENCES Ciudad (codigo_postal) ON DELETE CASCADE ON UPDATE CASCADE,

    KEY fk_cpDestino (cpDestino_fk),
    CONSTRAINT fk_cpDestino FOREIGN KEY (cpDestino_fk) REFERENCES Ciudad (codigo_postal) ON DELETE CASCADE ON UPDATE CASCADE,

    KEY fk_razon_social (razon_social_fk),
    CONSTRAINT fk_razon_social FOREIGN KEY (razon_social_fk) REFERENCES Agencia (razon_social) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
