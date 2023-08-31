-- Ciração do banco de dados para o cenário de E-commerce
CREATE DATABASE ecommerce_refined;

-- Acessando banco de dados criado
USE ecommerce_refined;

-- Criar tabela Cliente
CREATE TABLE client(
	client_id int auto_increment primary key,
    name varchar(10),
    last_name varchar(20),
    company_name varchar(100),
	address varchar(255),
    birth_date date
);

-- Criar tabela origin do client
CREATE TABLE client_type(
	client_type_id int auto_increment primary key,
    origin enum('PF','PJ') default 'PF',
    CPF_CNPJ varchar(14) not null,
    constraint unique_cpf_cnpj_client_type unique(CPF_CNPJ),
    constraint fk_client_client_type foreign key (client_type_id) references client(client_id)
);

alter table client_type auto_increment=1;

-- Criar tabela Produto
CREATE TABLE product(
	product_id int auto_increment primary key,
    name varchar(20) not null,
    category enum('Electronics', 'Clothing', 'Toys', 'Other', 'Food') not null,
    description varchar(255),
    rating float not null default 0,
    size varchar(10),
    price float not null
);

alter table product auto_increment=1;

-- criar tabela delivery
create table delivery(
    delivery_id int not null auto_increment,
    status enum('Awaiting', 'Processing', 'Posted', 'Done') default 'Processing',
    code char(10) not null,
    primary key (delivery_id),
    constraint unique_code unique(code)
);

alter table delivery auto_increment=1;

-- Criar tabela forma de pagamento
create table payment_type(
	payment_type_id int auto_increment primary key,
    type enum('Credit card', 'Bank transfer', 'Cash', 'Bitcoin') default 'Bitcoin'
);

alter table payment_type auto_increment=1;

-- Criar tabela Pedido
CREATE TABLE orderr(
	order_id int auto_increment,
    client_id int,
    payment_type_id int,
    description varchar(255),
    delivery_cost float default 10,
    total_cost float,
    primary key (order_id, client_id, payment_type_id),
    constraint fk_pedido_client 		 foreign key (client_id)   references client(client_id),
    constraint fk_pedido_payment_type foreign key (payment_type_id) references payment_type(payment_type_id)
);

alter table orderr auto_increment=1;

-- Criar tabela Estoque
CREATE TABLE stock(
	stock_id int auto_increment primary key,
    place varchar(255),
    total int default 0
);

alter table stock auto_increment=1;

-- Criar tabela Fornecedor
CREATE TABLE supplier(
	supplier_id int auto_increment primary key,
    company_name varchar(100) not null,
    description_name varchar(100),
	address varchar(255),
    phone char(11) not null
);

alter table supplier auto_increment=1;

-- Criar tabela origin do fornecedor
CREATE TABLE supplier_type(
	supplier_type_id int auto_increment primary key,
    origin enum('PF','PJ') default 'PF',
    CPF_CNPJ varchar(14) not null,
    constraint unique_cpf_cnpj_supplier_type unique(CPF_CNPJ),
    constraint fk_supplier_supplier_type foreign key (supplier_type_id) references supplier(supplier_id)
);

alter table supplier_type auto_increment=1;

-- Criar tabela vendedor
CREATE TABLE seller(
	seller_id int auto_increment primary key,
    company_name varchar(100) not null,
    description_name varchar(100),
    address varchar(255),
    phone char(11) not null
);

alter table seller auto_increment=1;

-- Criar tabela origin do vendedor
CREATE TABLE seller_type(
	seller_type_id int auto_increment primary key,
    origin enum('PF','PJ') default 'PF',
    CPF_CNPJ varchar(14) not null,
    constraint unique_cpf_cnpj_seller_type unique(CPF_CNPJ),
    constraint fk_seller_seller_type foreign key (seller_type_id) references seller(seller_id)
);

alter table seller_type auto_increment=1;

-- Criar tabela de relacionamento entre o produto e vendedor
create table product_seller(
	seller_id int,
    product_id int,
    total int default 1,
    primary key (seller_id, product_id),
    constraint fk_product_seller_seller foreign key (seller_id) references seller(seller_id),
    constraint fk_product_seller_product foreign key (product_id) references product(product_id)
);

-- Criar tabela de relacionamento entre o produto e pedido
create table product_order(
	product_id int,
    order_id int,
    total int default 1,
    status enum('Available', 'Out of stock') default 'Available',
    primary key (product_id, order_id),
    constraint fk_product_order_product foreign key (product_id) references product(product_id),
    constraint fk_product_order_order foreign key (order_id) references orderr(order_id)
);

-- Criar tabela de relacionamento entre o produto e stock
create table stock_place(
	product_id int,
    stock_id int,
    place varchar(255) not null,
    primary key (product_id, stock_id),
    constraint fk_stock_place_product foreign key (product_id) references product(product_id),
    constraint fk_stock_place_stock foreign key (stock_id) references stock(stock_id)
);

-- Criar tabela de relacionamento entre o produto e fornecedor
create table product_supplier(
	supplier_id int,
    product_id int,
    total int not null,
    primary key (supplier_id, product_id),
    constraint fk_product_supplier_supplier foreign key (supplier_id) references supplier(supplier_id),
    constraint fk_profuct_supplier_product foreign key (product_id) references product(product_id)
);