USE projeto_ia;


-- ============================================================
-- CLIENTES
-- ============================================================

-- Listar todos os clientes
SELECT
    id,
    nome,
    cpf_cnpj,
    email,
    telefone,
    criado_em,
    atualizado_em
FROM clientes
ORDER BY nome;


-- Buscar cliente por ID
SELECT
    id,
    nome,
    cpf_cnpj,
    email,
    telefone,
    criado_em,
    atualizado_em
FROM clientes
WHERE id = 1;


-- Pesquisar clientes por nome
SELECT
    id,
    nome,
    email,
    telefone
FROM clientes
WHERE nome LIKE '%Silva%'
ORDER BY nome;


-- Clientes que possuem pedidos
SELECT DISTINCT
    c.id,
    c.nome,
    c.email
FROM clientes c
INNER JOIN pedidos p
    ON p.cliente_id = c.id
ORDER BY c.nome;


-- Clientes sem pedidos
SELECT
    c.id,
    c.nome,
    c.email
FROM clientes c
LEFT JOIN pedidos p
    ON p.cliente_id = c.id
WHERE p.id IS NULL
ORDER BY c.nome;


-- Histórico de pedidos de um cliente
SELECT
    p.id,
    p.data,
    p.status,
    p.valor_total
FROM pedidos p
WHERE p.cliente_id = 1
ORDER BY p.data DESC;



-- ============================================================
-- PRODUTOS
-- ============================================================

-- Listar produtos ativos
SELECT
    id,
    nome,
    descricao,
    preco,
    ativo
FROM produtos
WHERE ativo = TRUE
ORDER BY nome;


-- Buscar produto por ID
SELECT
    id,
    nome,
    descricao,
    preco,
    ativo
FROM produtos
WHERE id = 1;


-- Pesquisar produtos
SELECT
    id,
    nome,
    preco
FROM produtos
WHERE nome LIKE '%camiseta%'
  AND ativo = TRUE
ORDER BY nome;


-- Produtos mais vendidos
SELECT
    pr.id,
    pr.nome,
    SUM(pi.quantidade) AS quantidade_vendida,
    SUM(pi.valor_total) AS faturamento
FROM produtos pr
INNER JOIN pedido_itens pi
    ON pi.produto_id = pr.id
INNER JOIN pedidos p
    ON p.id = pi.pedido_id
WHERE p.status <> 'CANCELADO'
GROUP BY
    pr.id,
    pr.nome
ORDER BY quantidade_vendida DESC;


-- Produtos que nunca foram vendidos
SELECT
    pr.id,
    pr.nome,
    pr.preco
FROM produtos pr
LEFT JOIN pedido_itens pi
    ON pi.produto_id = pr.id
WHERE pi.id IS NULL
ORDER BY pr.nome;



-- ============================================================
-- PEDIDOS
-- ============================================================

-- Listar pedidos
SELECT
    p.id,
    p.data,
    c.nome AS cliente,
    p.status,
    p.valor_total
FROM pedidos p
INNER JOIN clientes c
    ON c.id = p.cliente_id
ORDER BY p.data DESC;


-- Buscar pedido por ID
SELECT
    p.id,
    p.data,
    p.status,
    p.valor_total,
    c.id AS cliente_id,
    c.nome AS cliente,
    c.email AS cliente_email
FROM pedidos p
INNER JOIN clientes c
    ON c.id = p.cliente_id
WHERE p.id = 1;


-- Itens de um pedido
SELECT
    pi.id,
    pi.produto_id,
    pr.nome AS produto,
    pi.quantidade,
    pi.valor_unitario,
    pi.valor_total
FROM pedido_itens pi
INNER JOIN produtos pr
    ON pr.id = pi.produto_id
WHERE pi.pedido_id = 1
ORDER BY pi.id;


-- Pedido completo
SELECT
    p.id AS pedido_id,
    p.data,
    p.status,
    c.id AS cliente_id,
    c.nome AS cliente,
    pr.id AS produto_id,
    pr.nome AS produto,
    pi.quantidade,
    pi.valor_unitario,
    pi.valor_total AS item_total
FROM pedidos p
INNER JOIN clientes c
    ON c.id = p.cliente_id
INNER JOIN pedido_itens pi
    ON pi.pedido_id = p.id
INNER JOIN produtos pr
    ON pr.id = pi.produto_id
WHERE p.id = 1
ORDER BY pi.id;


-- Pedidos por status
SELECT
    status,
    COUNT(*) AS quantidade_pedidos,
    SUM(valor_total) AS faturamento
FROM pedidos
GROUP BY status
ORDER BY status;



-- ============================================================
-- DASHBOARD
-- ============================================================

-- Faturamento total
SELECT
    COALESCE(SUM(valor_total), 0) AS faturamento
FROM pedidos
WHERE status <> 'CANCELADO';


-- Quantidade de pedidos
SELECT
    COUNT(*) AS quantidade_pedidos
FROM pedidos
WHERE status <> 'CANCELADO';


-- Ticket médio
SELECT
    COALESCE(AVG(valor_total), 0) AS ticket_medio
FROM pedidos
WHERE status <> 'CANCELADO';


-- Faturamento por cliente
SELECT
    c.id,
    c.nome,
    COUNT(p.id) AS quantidade_pedidos,
    SUM(p.valor_total) AS faturamento
FROM clientes c
INNER JOIN pedidos p
    ON p.cliente_id = c.id
WHERE p.status <> 'CANCELADO'
GROUP BY
    c.id,
    c.nome
ORDER BY faturamento DESC;


-- Vendas por dia
SELECT
    DATE(data) AS dia,
    COUNT(*) AS quantidade_pedidos,
    SUM(valor_total) AS faturamento
FROM pedidos
WHERE status <> 'CANCELADO'
GROUP BY DATE(data)
ORDER BY dia;


-- Vendas por mês
SELECT
    YEAR(data) AS ano,
    MONTH(data) AS mes,
    COUNT(*) AS quantidade_pedidos,
    SUM(valor_total) AS faturamento
FROM pedidos
WHERE status <> 'CANCELADO'
GROUP BY
    YEAR(data),
    MONTH(data)
ORDER BY
    ano,
    mes;


-- Produtos mais vendidos por faturamento
SELECT
    pr.id,
    pr.nome,
    SUM(pi.quantidade) AS quantidade_vendida,
    SUM(pi.valor_total) AS faturamento
FROM pedido_itens pi
INNER JOIN produtos pr
    ON pr.id = pi.produto_id
INNER JOIN pedidos p
    ON p.id = pi.pedido_id
WHERE p.status <> 'CANCELADO'
GROUP BY
    pr.id,
    pr.nome
ORDER BY faturamento DESC;



-- ============================================================
-- VALIDAÇÕES
-- ============================================================

-- Pedidos cujo total não corresponde à soma dos itens
SELECT
    p.id,
    p.valor_total AS total_pedido,
    SUM(pi.valor_total) AS total_itens
FROM pedidos p
INNER JOIN pedido_itens pi
    ON pi.pedido_id = p.id
GROUP BY
    p.id,
    p.valor_total
HAVING p.valor_total <> SUM(pi.valor_total);


-- Itens com valor total incorreto
SELECT
    id,
    pedido_id,
    produto_id,
    quantidade,
    valor_unitario,
    valor_total,
    quantidade * valor_unitario AS valor_calculado
FROM pedido_itens
WHERE valor_total <> quantidade * valor_unitario;