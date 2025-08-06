-- Crear base de datos
CREATE DATABASE tienda_online;
USE tienda_online;

-- Tabla CATEGORIAS
CREATE TABLE CATEGORIAS (
    id_categoria INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL,
    descripcion TEXT
);

-- Tabla PRODUCTOS
CREATE TABLE PRODUCTOS (
    id_producto INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    descripcion TEXT,
    precio DECIMAL(10,2) NOT NULL CHECK (precio > 0),
    stock INT DEFAULT 0 CHECK (stock >= 0),
    id_categoria INT NOT NULL,
    activo BOOLEAN DEFAULT TRUE,
    fecha_creacion TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (id_categoria) REFERENCES CATEGORIAS(id_categoria)
);

-- Tabla CLIENTES
CREATE TABLE CLIENTES (
    id_cliente INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    telefono VARCHAR(15),
    direccion TEXT,
    fecha_registro DATE NOT NULL
);

-- Tabla METODOS_PAGO
CREATE TABLE METODOS_PAGO (
    id_metodo INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL,
    activo BOOLEAN DEFAULT TRUE
);

-- Tabla PEDIDOS
CREATE TABLE PEDIDOS (
    id_pedido INT AUTO_INCREMENT PRIMARY KEY,
    id_cliente INT NOT NULL,
    fecha_pedido TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    total DECIMAL(10,2) NOT NULL DEFAULT 0,
    estado ENUM('Pendiente', 'Procesado', 'Enviado', 'Entregado', 'Cancelado') DEFAULT 'Pendiente',
    id_metodo_pago INT NOT NULL,
    FOREIGN KEY (id_cliente) REFERENCES CLIENTES(id_cliente),
    FOREIGN KEY (id_metodo_pago) REFERENCES METODOS_PAGO(id_metodo)
);

-- Tabla DETALLE_PEDIDOS
CREATE TABLE DETALLE_PEDIDOS (
    id_detalle INT AUTO_INCREMENT PRIMARY KEY,
    id_pedido INT NOT NULL,
    id_producto INT NOT NULL,
    cantidad INT NOT NULL CHECK (cantidad > 0),
    precio_unitario DECIMAL(10,2) NOT NULL,
    subtotal DECIMAL(10,2) NOT NULL,
    FOREIGN KEY (id_pedido) REFERENCES PEDIDOS(id_pedido) ON DELETE CASCADE,
    FOREIGN KEY (id_producto) REFERENCES PRODUCTOS(id_producto)
);