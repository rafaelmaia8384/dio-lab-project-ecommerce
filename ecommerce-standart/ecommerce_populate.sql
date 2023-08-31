-- Acessando banco de dados
use ecommerce;

-- Inserindo clientes
insert into clients (Fname, Minit, Lname, CPF, Address, DateOfBirth) 
	   values('Joao','L','Lima', '00000000001', 'Exemplo de endereço numero 123', '2000-01-01'),
		     ('Pedro','J','Souza', '00000000002', 'Exemplo de endereço numero 123', '2000-01-01'),
			 ('Francisco','R','Maia', '00000000003', 'Exemplo de endereço numero 123', '2000-01-01'),
			 ('Lucas','Z','Lima', '00000000004', 'Exemplo de endereço numero 123', '2000-01-01'),
			 ('Roberto','L','Paiva', '00000000005', 'Exemplo de endereço numero 123', '2000-01-01'),
			 ('Beatriz','M','Andrade', '00000000006', 'Exemplo de endereço numero 123', '2000-01-01');

-- Verificando valores inseridos
select * from clients;

-- Inserindo produtos
insert into products (Pname, category, rating, size, price)
		values('Exemplo1', 'Eletronics', '3', null, 10.3),
              ('Exemplo2', 'Eletronics', '3', null, 19.40),
              ('Exemplo3', 'Clothing', '3', null, 44.22),
              ('Exemplo4', 'Food', '3', null, 33.33),
              ('Exemplo5', 'Eletronics', '3', null, 33.33),
              ('Exemplo6', 'Other', '3', '10', 33.33),
              ('Exemplo7', 'Toys', '3', null, 33.33);

-- Verificando valores inseridos
select * from products;

-- Inserindo pedidos
insert into orders (idOrderClient, orderStatus, orderDescription, sendValue, paymentCash)
		values(1, default, 'Entrega rápida', null, 1),
			  (2, default, 'Entrega rápida', 50, 0),
              (3, 'Confirmed', null, null, 1),
              (4, default, 'Entrega padrão', 150, 0);

-- Verificando valores inseridos
select * from orders;

-- Iserindo produtos/pedidos
insert into productOrder (idPOproduct, idPOorder, poQuantity, poStatus)
		values (1, 1, 2, default),
			   (2, 1, 1, default),
               (3, 2, 1, default);
               
--- Verificando valores inseridos
select * from productOrder;

-- Inserindo estoque
insert into productStorage (storageLocation,quantity) 
		values ('Local 1', 50),
			   ('Local 2', 50),
               ('Local 3', 50),
               ('Local 4', 50),
               ('Local 5', 50),
               ('Local 6', 50);

-- Verificando valores inseridos
select * from productStorage;

-- Inserindo produto/estoque
insert into storageLocation (idLproduct, idLstorage, location)
		values (1, 2, 'SP'),
			   (2, 6, 'RJ'),
               (3, 1, 'SP'),
               (4, 3, 'RJ'),
               (5, 4, 'SP'),
               (6, 5, 'RJ');

-- Verificando valores inseridos
select * from storageLocation;

-- Inserindo fornecedores
insert into supplier (SocialName, CNPJ, Address, contact)
		values ('Fornecedor1', 00000000000001, 'Endereço exemplo 123, Brasília-DF.', '61988888888'),
			   ('Fornecedor2', 00000000000002, 'Endereço exemplo 123, Brasília-DF.', '61988888888'),
               ('Fornecedor3', 00000000000003, 'Endereço exemplo 123, Brasília-DF.', '61988888888');

-- Verificando valores inseridos
select * from supplier;

-- Inserindo produto/fornecedor
insert into productSupplier (idPsSupplier, idPsProduct, quantity)
		values (1, 1, 50),
			   (1, 2, 50),
               (2, 4, 50),
               (3, 3, 50),
               (2, 5, 50);

-- Verificando valores inseridos
select * from productSupplier;

-- Inserindo vendedores
insert into seller (SocialName, AbstName, CNPJ, CPF, location, contact)
		values ('Vendedor1', null, 00000000000001, null, 'SP', '11000000'),
			   ('Vendedor2', null, null, 00000000000002, 'RJ', '21000000'),
               ('Vendedor3', null, 00000000000003, null, 'RJ', '21000000');

-- Verificando valores inseridos
select * from seller;

-- Inserindo produto/vendedor
insert into productSeller (idPseller, idPproduct, prodQuantity)
		values (1, 6, 10),
               (2, 7, 10),
               (3, 1, 10);

-- Verificando valores inseridos
select * from productSeller;