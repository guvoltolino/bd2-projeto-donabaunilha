USE DonaBaunilha;
GO

-- Quais são os três produtos mais vendidos em um dado período?

SELECT TOP 3
  p.nome AS Produto,
  SUM(i.qtd_item) AS Quantidade_Vendida
FROM fvendas v
LEFT JOIN ditemorder i ON v.id_venda = i.id_venda
LEFT JOIN dproduto p ON i.id_produto = p.id_produto
WHERE v.data_venda BETWEEN '2024-01-01' AND '2024-12-31'
  AND v.status = 'Concluída'
GROUP BY p.nome
ORDER BY Quantidade_Vendida DESC;

-- Considerando categoria de produtos, liste os itens vendidos

SELECT TOP 10
  c.nome AS Categoria,
  p.nome AS Produto,
  SUM(i.qtd_item) AS Quantidade_Vendida
FROM ditemorder i
JOIN dproduto p ON i.id_produto = p.id_produto
JOIN dcategoria c ON p.id_categoria = c.id_categoria
JOIN fvendas v ON i.id_venda = v.id_venda
WHERE v.status = 'Concluída'
GROUP BY c.nome, p.nome
ORDER BY Quantidade_Vendida DESC;

-- Qual é o valor total de vendas por categoria, em um dado período?

SELECT
  c.nome AS Categoria,
  ROUND(SUM(i.valor_item), 2) AS Valor_Total
FROM ditemorder i 
JOIN dproduto p ON i.id_produto = p.id_produto
JOIN dcategoria c ON p.id_categoria = c.id_categoria
JOIN fvendas v ON i.id_venda = v.id_venda
WHERE v.data_venda BETWEEN '2024-01-01' AND '2024-12-31'
  AND v.status = 'Concluída'
GROUP BY c.nome
ORDER BY Valor_Total DESC;


--Quais foram os 10 clientes que mais compraram em um dado período?

SELECT TOP 10
  c.nome AS Cliente,
  ROUND(SUM(v.valor_total), 2) AS Total_Gasto,
  b.nome AS Unidade_Negocio
FROM fvendas v
JOIN dcliente c ON v.id_cliente = c.id_cliente
JOIN dbu b ON v.id_bu = b.id_bu
WHERE v.data_venda BETWEEN '2024-01-01' AND '2024-12-31' 
  AND v.status = 'Concluída'
GROUP BY c.nome, b.nome
ORDER BY Total_Gasto DESC;

--Quais são os clientes qua estão há mais tempo sem comprar nada?

SELECT
    c.nome AS Cliente,
    FORMAT(MAX(v.data_venda), 'dd/MM/yyyy') AS ultima_compra
FROM fvendas v
JOIN dcliente c ON v.id_cliente = c.id_cliente
WHERE v.status = 'Concluída'
GROUP BY c.nome
ORDER BY ultima_compra ASC;
