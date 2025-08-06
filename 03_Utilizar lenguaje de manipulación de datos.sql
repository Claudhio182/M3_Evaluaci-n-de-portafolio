-- Insertar nuevo cliente
INSERT INTO CLIENTES (id_cliente, nombre, email, telefono, fecha_registro)
VALUES (4, 'María González', 'maria@email.com', '555-1234', '2024-01-15');

-- Insertar múltiples registros
INSERT INTO CLIENTES (id_cliente, nombre, email, fecha_registro) VALUES
(5, 'Pedro López', 'pedro@email.com', '2024-01-16'),
(6, 'Ana Martínez', 'ana@email.com', '2024-01-17');

-- Actualizar dirección de un cliente específico
UPDATE CLIENTES 
SET telefono = '555-9876', email = 'maria.nueva@email.com'
WHERE id_cliente = 4;

-- Actualizar estado de pedidos pendientes
UPDATE PEDIDOS 
SET estado = 'Procesado'
WHERE estado = 'Pendiente' AND fecha_pedido < '2024-01-01';

-- Eliminar un pedido específico que no fue procesado
DELETE FROM PEDIDOS 
WHERE id_pedido = 100 AND estado = 'Cancelado';

-- Eliminar pedidos antiguos (con precaución)
DELETE FROM PEDIDOS 
WHERE fecha_pedido < '2023-01-01' AND estado = 'Completado';



