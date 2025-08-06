-- Obtener todos los clientes
SELECT * FROM CLIENTES;

-- Obtener campos específicos
SELECT nombre, email FROM CLIENTES;

-- Filtrar clientes registrados en 2023
SELECT nombre, email 
FROM CLIENTES 
WHERE fecha_registro >= '2023-01-01';

-- Obtener pedidos con información del cliente
SELECT c.nombre, p.id_pedido, p.fecha_pedido, p.total
FROM CLIENTES c
INNER JOIN PEDIDOS p ON c.id_cliente = p.id_cliente;

-- Pedidos de un cliente específico
SELECT c.nombre, p.id_pedido, p.fecha_pedido, p.total
FROM CLIENTES c
INNER JOIN PEDIDOS p ON c.id_cliente = p.id_cliente
WHERE c.nombre = 'Juan Pérez';

