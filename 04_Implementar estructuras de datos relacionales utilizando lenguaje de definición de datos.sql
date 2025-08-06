-- Crear departamentos
CREATE TABLE DEPARTAMENTOS (
    id_departamento INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL,
    presupuesto DECIMAL(15,2),
    id_manager INT
);

-- Crear empleados con todas las restricciones
CREATE TABLE EMPLEADOS (
    id_empleado INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    apellido VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    salario DECIMAL(10,2) CHECK (salario BETWEEN 500000 AND 10000000),
    fecha_ingreso DATE NOT NULL,
    id_departamento INT NOT NULL,
    activo BOOLEAN DEFAULT TRUE,
    fecha_creacion TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (id_departamento) REFERENCES DEPARTAMENTOS(id_departamento) ON DELETE RESTRICT,
    INDEX idx_departamento (id_departamento),
    INDEX idx_email (email)
);