-- Total de pedidos por cliente
SELECT c.nombre, COUNT(p.id_pedido) as total_pedidos, SUM(p.total) as monto_total
FROM CLIENTES c
LEFT JOIN PEDIDOS p ON c.id_cliente = p.id_cliente
GROUP BY c.id_cliente, c.nombre;

-- Clientes con más de 3 pedidos
SELECT c.nombre, COUNT(p.id_pedido) as total_pedidos
FROM CLIENTES c
INNER JOIN PEDIDOS p ON c.id_cliente = p.id_cliente
GROUP BY c.id_cliente, c.nombre
HAVING COUNT(p.id_pedido) > 3;

-- Pedidos del último mes ordenados por total
SELECT c.nombre, p.fecha_pedido, p.total
FROM CLIENTES c
INNER JOIN PEDIDOS p ON c.id_cliente = p.id_cliente
WHERE p.fecha_pedido >= DATE_SUB(CURDATE(), INTERVAL 1 MONTH)
ORDER BY p.total DESC;