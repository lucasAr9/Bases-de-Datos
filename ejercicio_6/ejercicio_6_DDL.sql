----------------------------------------------
-- CREAR BASE DE DATOS
----------------------------------------------
CREATE DATABASE ejercicio_6;


----------------------------------------------
-- CREAR TABLAS
----------------------------------------------
-- Crear tabla Tecnico
CREATE TABLE Tecnico (
    codTecnico int NOT NULL,
    nombre varchar(100) NOT NULL,
    especialidad varchar(100) NOT NULL,
    PRIMARY KEY (codTecnico)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


-- Crear tabla Repuesto
CREATE TABLE Repuesto (
    codRepuesto int NOT NULL,
    nombre varchar(100) NOT NULL,
    stock int NOT NULL,
    precio double NOT NULL,
    PRIMARY KEY (codRepuesto)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


-- Crear tabla Reparacion
CREATE TABLE Reparacion (
    nroReparacion int NOT NULL,
    codTecnico_fk int NOT NULL,
    precioTotal double NOT NULL,
    fecha date NOT NULL,
    PRIMARY KEY (nroReparacion),

    KEY fk_codTecnico (codTecnico_fk),
    CONSTRAINT fk_codTecnico FOREIGN KEY (codTecnico_fk) REFERENCES Tecnico (codTecnico) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


-- Crear tabla RepuestoReparacion
CREATE TABLE RepuestoReparacion (
    nroReparacion_fk int NOT NULL,
    codRepuesto_fk int NOT NULL,
    cantidad int NOT NULL,
    precio double NOT NULL,
    PRIMARY KEY (nroReparacion_fk, codRepuesto_fk),
    
    KEY fk_nroReparacion (nroReparacion_fk),
    CONSTRAINT fk_nroReparacion FOREIGN KEY (nroReparacion_fk) REFERENCES Reparacion (nroReparacion) ON DELETE CASCADE ON UPDATE CASCADE,

    KEY fk_codRepuesto (codRepuesto_fk),
    CONSTRAINT fk_codRepuesto FOREIGN KEY (codRepuesto_fk) REFERENCES Repuesto (codRepuesto) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
