-- Consulta 1: Listar todos os clientes PF
SELECT Fname, Lname, CPF FROM clients WHERE clientType = 'PF';

-- Consulta 2: Mostrar todos os pedidos com status 'Confirmado'
SELECT idOrder, orderDescription, orderStatus FROM orders WHERE orderStatus = 'Confirmado';

-- Consulta 3: Produtos com avaliação acima de 4.5
SELECT Pname, avaliação FROM product WHERE avaliação > 4.5;

-- Consulta 4: Ver status de entrega por pedido
SELECT o.idOrder, c.Fname, o.trackingCode, o.deliveryStatus
FROM orders o
JOIN clients c ON o.idOrderClient = c.idClient;

-- Consulta 5: Consultar estoque de cada produto e sua localização
SELECT p.Pname, s.quantity, l.location
FROM product p
JOIN storageLocation l ON p.idProduct = l.idProduct
JOIN productStorage s ON s.idProdStorage = l.idStorage;

-- Consulta 6: Listar produtos por fornecedor
SELECT f.SocialName, p.Pname, ps.quantity
FROM productSupplier ps
JOIN supplier f ON f.idSupplier = ps.idPsSupplier
JOIN product p ON p.idProduct = ps.idPsProduct;

-- Consulta 7: Listar todos os vendedores e seus produtos
SELECT s.SocialName, p.Pname, ps.prodQuantity
FROM productSeller ps
JOIN seller s ON s.idSeller = ps.idPseller
JOIN product p ON p.idProduct = ps.idProduct;

-- Consulta 8: Ver histórico de pagamento de um cliente
SELECT c.Fname, o.idOrder, p.typePayment, p.paymentStatus, p.paymentDate
FROM payments p
JOIN clients c ON p.idClient = c.idClient
JOIN orders o ON p.idOrder = o.idOrder
WHERE c.idClient = 1;

-- Consulta 9: Total de pedidos por tipo de cliente
SELECT clientType, COUNT(o.idOrder) as totalPedidos
FROM clients c
JOIN orders o ON c.idClient = o.idOrderClient
GROUP BY clientType;

-- Consulta 10: Produtos que estão fora de estoque
SELECT p.Pname, po.poStatus
FROM productOrder po
JOIN product p ON po.idProduct = p.idProduct
WHERE po.poStatus = 'Sem estoque';
