-- Acessando o banco de dados
use ecommerce_refined;

-- Inserindo valores na tabela client
insert into client (name, last_name, company_name, address, birth_date)
	values('Roberto', 'Lima', null, 'Rua Santos, 98, Centro, São Paulo/SP', '1998-09-05'),
		  ('Diego', 'Paiva', null, 'Avenida Brasil, 1003, Jardim, Rio de Janeiro/RJ', '2007-03-24'),
		  (null, null, 'Comercial Bugigangas Ltda','Rua Alegria, 800, Vila Mariana, São Paulo/SP', null),
		  (null, null, 'Armarinho Souza Ltda','Rua da Paz, 900, Flamengo, Rio de Janeiro/RJ', null),
		  ('Caio', 'Maia', null,'Rua das Flores, 295, Laranjeiras, Rio de Janeiro/RJ', '2000-12-25'),
		  (null, null, 'Loja Variedades Ltda','Rua Sol, 9000, Copacabana, Rio de Janeiro/RJ', null);

-- Inserindo valores na tabela tipo client
insert into client_type (origin, CPF_CNPJ)
	values('PF', '00000000001'),
		  ('PF', '00000000002'),
		  ('PJ', '00000000000001'),
		  ('PJ', '00000000000002'),
		  ('PF', '00000000003'),
          ('PJ', '00000000000003');

-- Inserindo valores na tabela product
insert into product (name, category, description, rating, size, price)
	values('Bola', 'Toys', 'Descricao', 4, null, 33.00),
		  ('TV', 'Electronics', 'Descricao', 3, null, 33.33),
		  ('Camisa', 'Clothing', 'Descricao', 5, 'GG', 33.33),
		  ('Tapete', 'Other', 'Descricao', 5, null, 33.33),
		  ('Cerveja', 'Food', 'Descricao', 5, '1L', 33.33),
		  ('Smartphone', 'Electronics', 'Descricao', 4, null, 33.33);


-- Inserindo valores na tabela forma de pagamento
insert into payment_type (type)
	values('Bitcoin'),
		  ('Bitcoin'),
		  ('Bank transfer'),
		  ('Cash'),
		  ('Cash'),
		  ('Credit card'),
		  ('Bitcoin'),
		  ('Bank transfer'),
		  ('Bank transfer'),
		  ('Cash');

-- inserindo valores na tabela delivery
insert into delivery (delivery_id, status, code)
	values (1, default, 1234567890),
		   (2, default, 1234567891),
		   (3, default, 1234567892),
		   (4, default, 1234567893),
		   (5, default, 1234567894),
		   (6, default, 1234567895),
           (7, default, 1234567896),
           (8, default, 1234567897),
           (9, default, 1234567898),
           (10, default, 1234567899);

-- Inserindo valores na tabela orderr
insert into orderr (client_id, payment_type_id, description, delivery_cost, total_cost)
	values(1, 2,'Fast delivery', 12.90, 999.50),
		  (3, 2, 'Default delivery', 50.00, 99.50),
          (2, 3,'Fast delivery', 25.00, 320.00),
          (3, 3,'Default delivery', 25.00, 85.00),
          (4, 3,'Default delivery', 70.00, 1200.00),
          (4, 4,'Default delivery', 30.00, 460.00),
          (5, 4,'Fast delivery', 11.90, 999.50),
          (6, 5,'Default delivery', 45.00, 1035.00),
          (6, 6,'Default delivery', 35.00, 102.00),
          (3, 3,'Default delivery', 29.90, 170.00);

-- Inserindo valores na tabela stock
insert into stock (place, total)
	values('RJ', 500),
	      ('PE', 100),
	      ('SP', 300),
	      ('RN', 200),
	      ('SE', 150);

-- Inserindo dados na tabela fornecedor
insert into supplier (company_name, description_name, address, phone)
	values('Companhia1', 'Descricao', 'Rua Amazonas, 200, Centro, São Paulo/SP', '00000001'),
		  ('Companhia2', 'Descricao', 'Rua Andaluzita, 115, Jardins, São Paulo/SP', '00000002'),
		  ('Companhia3', 'Descricao', 'Avenida Atlântica, 300, Copacabana, Rio de Janeiro/RJ', '00000003'),
		  ('Companhia4', 'Descricao', 'Avenida Paulista, 500, Bela Vista, São Paulo/SP', '00000004');


-- Inserindo dados na tabela tipo de fornecedor
insert into supplier_type (origin, CPF_CNPJ)
	values('PJ', 00000000000001),
		  ('PJ', 00000000000002),
		  ('PJ', 00000000000003),
		  ('PJ', 00000000000004);

-- Inserindo dados na tabela vendedor
insert into seller (company_name, description_name, address, phone)
	values('Empresa1', null, 'Rua Bahia, 1200, Barra, Salvador/BA', '88999444871'),
		  ('Empresa2', null, 'Avenida Monsenhor Tabosa, 143, Praia de Iracema, Fortaleza/CE', '44555666123'),
		  ('Empresa3', null, 'Avenida Rebouças, 500, Pinheiros, São Paulo/SP', '11745012354'),
		  ('Empresa4', null, 'Rua Augusta, 1500, Jardins, São Paulo/SP', '11846352364');


-- Inserindo dados na tabela tipo vendedor
insert into seller_type (origin, CPF_CNPJ)
	values('PJ', 10000000000011),
		  ('PF', 10000000011),
		  ('PJ', 10000000000022),
		  ('PF', 10000000022);

-- Inserindo dados na tabela vendedor produto		  
insert into product_seller (seller_id, product_id, total)
	values(1, 2, 10),				
          (2, 4, 7),
          (3, 5, 2),
          (4, 1, 6);

-- Inserindo dados na tabela pedido produto
insert into product_order (product_id, order_id, total, status)
	values(1, 1, 1, default),
		  (2, 4, 1, default),
          (3, 5, 1, default),
          (4, 10, 1, default),
          (5, 3, 1, default),
          (6, 7, 1, default);

-- Inserindo dados na tabela stock place
insert into stock_place (product_id, stock_id, place)
	values(1, 2, 'RJ'),				
          (2, 4, 'MG'),
          (3, 5, 'SP'),
          (4, 1, 'RN'),
          (5, 3, 'RS');


-- Inserindo dados na tabela produto fornecedor
insert into product_supplier (supplier_id, product_id, total)
	values(1, 4, 10),				
          (2, 1, 7),
          (3, 5, 2),
          (4, 2, 6),
          (1, 3, 10),
          (1, 2, 10);
          
