-- DROP DATABASE IF EXISTS ecommerce;
-- Criar o banco de dados e usá-lo
CREATE DATABASE IF NOT EXISTS ecommerce;
USE ecommerce;

-- ================================
-- TABELA: CLIENTES
-- ================================
CREATE TABLE clients (
    idClient INT AUTO_INCREMENT PRIMARY KEY,
    Fname VARCHAR(20),
    Minit CHAR(1),
    Lname VARCHAR(30),
    CPF CHAR(11),
    CNPJ CHAR(14),
    clientType ENUM('PF', 'PJ') NOT NULL,
    Address VARCHAR(150),
    CONSTRAINT chk_client_type CHECK (
        (clientType = 'PF' AND CPF IS NOT NULL AND CNPJ IS NULL) OR
        (clientType = 'PJ' AND CNPJ IS NOT NULL AND CPF IS NULL)
    ),
    CONSTRAINT unique_cpf_client UNIQUE (CPF),
    CONSTRAINT unique_cnpj_client UNIQUE (CNPJ)
);

ALTER TABLE clients AUTO_INCREMENT = 1;

-- ================================
-- TABELA: PRODUTOS
-- ================================
CREATE TABLE product (
    idProduct INT AUTO_INCREMENT PRIMARY KEY,
    Pname VARCHAR(100) NOT NULL,
    classification_kids BOOL DEFAULT FALSE,
    category ENUM('Eletrônico', 'Vestuário', 'Brinquedos', 'Alimentos', 'Móveis') NOT NULL,
    avaliação FLOAT DEFAULT 0,
    size VARCHAR(20)
);

-- ================================
-- TABELA: PEDIDOS
-- ================================
CREATE TABLE orders (
    idOrder INT AUTO_INCREMENT PRIMARY KEY,
    idOrderClient INT,
    orderStatus ENUM('Cancelado','Confirmado','Em processamento') DEFAULT 'Em processamento',
    orderDescription VARCHAR(255),
    sendValue FLOAT DEFAULT 10,
    paymentCash BOOL DEFAULT FALSE,
    trackingCode VARCHAR(50),
    deliveryStatus ENUM('Postado', 'Em trânsito', 'Entregue', 'Devolvido') DEFAULT 'Postado',
    CONSTRAINT fk_orders_client FOREIGN KEY (idOrderClient) REFERENCES clients(idClient)
        ON UPDATE CASCADE
);

-- ================================
-- TABELA: PAGAMENTOS
-- ================================
CREATE TABLE payments (
    idPayment INT AUTO_INCREMENT PRIMARY KEY,
    idClient INT,
    idOrder INT,
    typePayment ENUM('Boleto', 'Cartão', 'Dois cartões') NOT NULL,  
    limitAvailable FLOAT DEFAULT 0,
    paymentStatus ENUM('Pendente', 'Pago', 'Cancelado') DEFAULT 'Pendente', 
    paymentDate DATETIME DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT fk_payment_client FOREIGN KEY (idClient) REFERENCES clients(idClient),
    CONSTRAINT fk_payment_order FOREIGN KEY (idOrder) REFERENCES orders(idOrder)
);

-- ================================
-- TABELA: ESTOQUE DE PRODUTOS
-- ================================
CREATE TABLE productStorage (
    idProdStorage INT AUTO_INCREMENT PRIMARY KEY,
    storageLocation VARCHAR(100),
    quantity INT DEFAULT 0
);

-- ================================
-- TABELA: FORNECEDOR
-- ================================
CREATE TABLE supplier (
    idSupplier INT AUTO_INCREMENT PRIMARY KEY,
    SocialName VARCHAR(255) NOT NULL,
    CNPJ CHAR(14) NOT NULL,
    contact CHAR(11) NOT NULL,
    CONSTRAINT unique_supplier UNIQUE (CNPJ)
);

-- ================================
-- TABELA: VENDEDOR
-- ================================
CREATE TABLE seller (
    idSeller INT AUTO_INCREMENT PRIMARY KEY,
    SocialName VARCHAR(255) NOT NULL,
    AbstName VARCHAR(255),
    CNPJ CHAR(14),
    CPF CHAR(11),
    location VARCHAR(255),
    contact CHAR(11) NOT NULL,
    CONSTRAINT unique_cnpj_seller UNIQUE (CNPJ),
    CONSTRAINT unique_cpf_seller UNIQUE (CPF)
);

-- ================================
-- PRODUTO-VENDEDOR (M:N)
-- ================================
CREATE TABLE productSeller (
    idPseller INT,
    idProduct INT,
    prodQuantity INT DEFAULT 1,
    PRIMARY KEY (idPseller, idProduct),
    CONSTRAINT fk_product_seller FOREIGN KEY (idPseller) REFERENCES seller(idSeller),
    CONSTRAINT fk_product_product FOREIGN KEY (idProduct) REFERENCES product(idProduct)
);

-- ================================
-- PRODUTO-PEDIDO (M:N)
-- ================================
CREATE TABLE productOrder (
    idProduct INT,
    idOrder INT,
    poQuantity INT DEFAULT 1,
    poStatus ENUM('Disponível', 'Sem estoque') DEFAULT 'Disponível',
    PRIMARY KEY (idProduct, idOrder),
    CONSTRAINT fk_productorder_product FOREIGN KEY (idProduct) REFERENCES product(idProduct),
    CONSTRAINT fk_productorder_order FOREIGN KEY (idOrder) REFERENCES orders(idOrder)
);

-- ================================
-- LOCALIZAÇÃO DO PRODUTO NO ESTOQUE
-- ================================
CREATE TABLE storageLocation (
    idProduct INT,
    idStorage INT,
    location VARCHAR(255) NOT NULL,
    PRIMARY KEY (idProduct, idStorage),
    CONSTRAINT fk_storagelocation_product FOREIGN KEY (idProduct) REFERENCES product(idProduct),
    CONSTRAINT fk_storagelocation_storage FOREIGN KEY (idStorage) REFERENCES productStorage(idProdStorage)
);

-- ================================
-- PRODUTO-FORNECEDOR (M:N)
-- ================================
CREATE TABLE productSupplier (
    idPsSupplier INT,
    idPsProduct INT,
    quantity INT NOT NULL,
    PRIMARY KEY (idPsSupplier, idPsProduct),
    CONSTRAINT fk_product_supplier_supplier FOREIGN KEY (idPsSupplier) REFERENCES supplier(idSupplier),
    CONSTRAINT fk_product_supplier_product FOREIGN KEY (idPsProduct) REFERENCES product(idProduct)
);
