use ecommerce_refined;

-- Quantas ordens foram feitas por cada client?
select company_name as ClientePJ, concat(c.name, ' ', c.last_name) as ClientePF, count(*) as total
	from client c
	join orderr p on c.client_id = p.client_id
	group by c.client_id;

-- Quantos clientes fizeram mais que 5 pedidos?
select company_name as ClientePJ, concat(c.name, c.last_name) as ClientePF, count(*) as total
from client c
join orderr p on c.client_id = p.client_id
group by c.client_id having total > 5;

-- Relação de produtos e fornecedores.
select 
	f.company_name as Empresa,
    p.name as Produto,
    e.total,
    e.place as Local_Fornecedor,
    l.place as Local_estoque
from supplier f
join product_supplier pf on f.supplier_id = pf.supplier_id        
join product p on p.product_id = pf.product_id
join stock_place l on l.product_id = p.product_id
join stock e on l.stock_id = e.stock_id
order by e.total;

-- Relação de nomes dos fornecedores e nomes de produtos.
select f.company_name as Fornecedor, p.name as Produto
from supplier f
join product_supplier pf on f.supplier_id = pf.supplier_id
join product p on p.product_id = pf.product_id;
