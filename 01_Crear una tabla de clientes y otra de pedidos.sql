create database almacen;
USE almacen;
-- Tabla CLIENTES
CREATE TABLE CLIENTES (
    id_cliente INT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE,
    telefono VARCHAR(15),
    fecha_registro DATE
);

-- Tabla PEDIDOS
CREATE TABLE PEDIDOS (
    id_pedido INT PRIMARY KEY,
    id_cliente INT,
    fecha_pedido DATE NOT NULL,
    total DECIMAL(10,2),
    estado VARCHAR(20),
    FOREIGN KEY (id_cliente) REFERENCES CLIENTES(id_cliente)
);