-- Agregar nueva columna
ALTER TABLE EMPLEADOS 
ADD COLUMN fecha_nacimiento DATE;

-- Modificar tipo de datos
ALTER TABLE EMPLEADOS 
MODIFY COLUMN salario DECIMAL(12,2);

-- Agregar restricción
ALTER TABLE EMPLEADOS 
ADD CONSTRAINT chk_fecha_ingreso 
CHECK (fecha_ingreso >= '2020-01-01');

-- Eliminar columna
ALTER TABLE EMPLEADOS 
DROP COLUMN fecha_nacimiento;

