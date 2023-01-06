----------------------------------------------
-- CREAR BASE DE DATOS
----------------------------------------------
CREATE DATABASE ejercicio_1;


----------------------------------------------
-- CREAR TABLAS
----------------------------------------------
-- Crear tabla Cliente
CREATE TABLE Cliente (
    id int NOT NULL AUTO_INCREMENT,
    nombre varchar(100) NOT NULL,
    apellido varchar(100) NOT NULL,
    DNI int NOT NULL,
    telefono bigint NOT NULL,
    direccion varchar(100) NOT NULL,
    PRIMARY KEY (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


-- Crear tabla Factura
CREATE TABLE Factura (
    nroTicket int NOT NULL,
    total double NOT NULL,
    fecha date NOT NULL,
    hora time NOT NULL,
    idCliente_fk int NOT NULL,
    PRIMARY KEY (nroTicket),
    
    KEY fk_id_idCliente (idCliente_fk),
    CONSTRAINT fk_id_idCliente FOREIGN KEY (idCliente_fk) REFERENCES Cliente (id) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


-- Crear tabla Detalle
CREATE TABLE Detalle (
    nroTicket int NOT NULL,
    idProducto int NOT NULL,
    cantidad int NOT NULL,
    precioUnitario double NOT NULL,
    PRIMARY KEY (nroTicket, idProducto)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


-- Crear tabla Producto
CREATE TABLE Producto (
    idProducto int NOT NULL AUTO_INCREMENT,
    descripcion varchar(100) NOT NULL,
    precio double NOT NULL,
    nombreP varchar(100) NOT NULL,
    stock int NOT NULL,
    PRIMARY KEY (idProducto)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
