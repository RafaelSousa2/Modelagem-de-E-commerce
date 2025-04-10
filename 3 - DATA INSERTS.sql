-- Inserções de exemplo para a tabela clients
INSERT INTO clients (Fname, Minit, Lname, CPF, CNPJ, clientType, Address) VALUES
('João', 'M', 'Silva', '12345678901', NULL, 'PF', 'Rua A, 123'),
('Empresa', NULL, 'X', NULL, '12345678000199', 'PJ', 'Av. B, 456');

-- Inserções para a tabela product
INSERT INTO product (Pname, classification_kids, category, avaliação, size) VALUES
('Smartphone', FALSE, 'Eletrônico', 4.5, 'Médio'),
('Camiseta Infantil', TRUE, 'Vestuário', 4.7, 'P'),
('Sofá 3 Lugares', FALSE, 'Móveis', 4.2, 'Grande');

-- Inserções para a tabela orders
INSERT INTO orders (idOrderClient, orderStatus, orderDescription, sendValue, paymentCash, trackingCode, deliveryStatus) VALUES
(1, 'Confirmado', 'Pedido de Smartphone', 15, TRUE, 'BR1234567890', 'Postado');

-- Inserções para a tabela payments
INSERT INTO payments (idClient, idOrder, typePayment, limitAvailable, paymentStatus) VALUES
(1, 1, 'Cartão', 1000, 'Pago');

-- Inserções para a tabela productStorage
INSERT INTO productStorage (storageLocation, quantity) VALUES
('Depósito Central', 100);

-- Inserções para a tabela supplier
INSERT INTO supplier (SocialName, CNPJ, contact) VALUES
('Fornecedor Eletrônicos LTDA', '11222333000100', '11999998888');

-- Inserções para a tabela seller
INSERT INTO seller (SocialName, AbstName, CPF, location, contact) VALUES
('Vendedor João MEI', 'João Vendas', '98765432100', 'Rua C, 321', '11988887777');

-- Inserções para productSeller
INSERT INTO productSeller (idPseller, idProduct, prodQuantity) VALUES
(1, 1, 50);

-- Inserções para productOrder
INSERT INTO productOrder (idProduct, idOrder, poQuantity, poStatus) VALUES
(1, 1, 1, 'Disponível');

-- Inserções para storageLocation
INSERT INTO storageLocation (idProduct, idStorage, location) VALUES
(1, 1, 'Estante A1');

-- Inserções para productSupplier
INSERT INTO productSupplier (idPsSupplier, idPsProduct, quantity) VALUES
(1, 1, 50);
