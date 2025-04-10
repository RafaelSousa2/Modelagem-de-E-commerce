# Projeto de Banco de Dados: E-commerce

-- Este repositório contém o projeto completo de um banco de dados para uma plataforma de e-commerce, incluindo:

-- Criação de esquema (tabelas e relacionamentos);
-- Inserção de dados de exemplo;
-- Consultas SQL de diferentes complexidades.

## Estrutura do Repositório

-- `schema.sql`: Script de criação de todas as tabelas do banco de dados, com constraints, chaves primárias e estrangeiras.
-- `data_inserts.sql`: Script de inserção de dados fictícios para simular o funcionamento da plataforma.
-- `queries.sql`: Conjunto de consultas SQL para análise e visualização dos dados inseridos.
-- `README.md`: Este arquivo com as instruções de uso.

## Como executar

-- 1. Instale o MySQL ou use uma instância online (ex: db-fiddle.com, phpMyAdmin, etc).
-- 2. Execute os scripts na seguinte ordem:

   -- `schema.sql`
   -- `data_inserts.sql`
   -- `queries.sql` (ou execute as consultas individualmente)

## Entidades do Banco de Dados

-- **Clients**: Armazena dados de clientes pessoa física ou jurídica.
-- **Product**: Produtos disponíveis na loja.
-- **Orders**: Pedidos realizados por clientes.
-- **Payments**: Pagamentos relacionados aos pedidos.
-- **ProductStorage**: Quantidade total de produtos em estoque.
-- **Supplier**: Fornecedores dos produtos.
-- **Seller**: Vendedores que disponibilizam produtos.

### Relacionamentos (Tabelas M:N)

-- `productOrder`: Associa produtos aos pedidos.
-- `productSeller`: Liga produtos aos vendedores.
-- `productSupplier`: Indica quem fornece o quê.
-- `storageLocation`: Localização física de produtos no estoque.

## Consultas Incluídas

-- Filtrar clientes, produtos e pedidos por diversos critérios.
-- Verificar status de entrega e pagamento.
-- Agrupamentos e junções entre tabelas.

## Autor

-- Rafael Sousa 

---