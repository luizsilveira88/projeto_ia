USE projeto_ia;


-- ============================================================
-- CLIENTES
-- ============================================================

INSERT INTO clientes
    (nome, cpf_cnpj, email, telefone)
VALUES
    ('Ana Carolina Souza', '123.456.789-01', 'ana.souza@email.com', '(47) 99911-2233'),
    ('Bruno Henrique Oliveira', '234.567.890-12', 'bruno.oliveira@email.com', '(47) 99822-3344'),
    ('Camila Mendes Rocha', '345.678.901-23', 'camila.rocha@email.com', '(47) 99733-4455'),
    ('Daniel Ferreira Costa', '456.789.012-34', 'daniel.costa@email.com', '(47) 99644-5566'),
    ('Eduarda Martins Silva', '567.890.123-45', 'eduarda.silva@email.com', '(47) 99555-6677'),
    ('Felipe Augusto Santos', '678.901.234-56', 'felipe.santos@email.com', '(47) 99466-7788'),
    ('Gabriela Alves Lima', '789.012.345-67', 'gabriela.lima@email.com', '(47) 99377-8899'),
    ('Henrique Rodrigues', '890.123.456-78', 'henrique.rodrigues@email.com', '(47) 99288-9900'),
    ('Isabela Fernandes', '901.234.567-89', 'isabela.fernandes@email.com', '(47) 99199-0011'),
    ('João Pedro Martins', '012.345.678-90', 'joao.martins@email.com', '(47) 99000-1122');


-- ============================================================
-- PRODUTOS
-- ============================================================

INSERT INTO produtos
    (nome, descricao, preco, ativo)
VALUES
    (
        'Camiseta Básica Masculina',
        'Camiseta masculina de algodão 100%, gola redonda e modelagem regular.',
        59.90,
        TRUE
    ),
    (
        'Camiseta Oversized Feminina',
        'Camiseta feminina oversized em algodão premium.',
        79.90,
        TRUE
    ),
    (
        'Calça Jeans Skinny',
        'Calça jeans feminina com modelagem skinny e elastano.',
        149.90,
        TRUE
    ),
    (
        'Calça Jeans Masculina Slim',
        'Calça jeans masculina de corte slim com lavagem azul escura.',
        159.90,
        TRUE
    ),
    (
        'Moletom Canguru',
        'Moletom unissex com capuz, bolso frontal e interior flanelado.',
        129.90,
        TRUE
    ),
    (
        'Jaqueta Jeans',
        'Jaqueta jeans clássica com fechamento por botões metálicos.',
        199.90,
        TRUE
    ),
    (
        'Vestido Midi Floral',
        'Vestido feminino midi com estampa floral e tecido leve.',
        179.90,
        TRUE
    ),
    (
        'Bermuda Sarja Masculina',
        'Bermuda masculina em sarja com bolsos laterais.',
        89.90,
        TRUE
    ),
    (
        'Blusa de Tricô Feminina',
        'Blusa feminina de tricô com gola alta e acabamento canelado.',
        119.90,
        TRUE
    ),
    (
        'Tênis Casual Unissex',
        'Tênis casual para uso diário com solado emborrachado.',
        219.90,
        TRUE
    );


-- ============================================================
-- PEDIDOS
-- ============================================================

INSERT INTO pedidos
    (cliente_id, data, status, valor_total)
VALUES
    (1, '2026-08-01 10:15:00', 'CONCLUIDO', 139.80),
    (2, '2026-08-03 14:30:00', 'CONCLUIDO', 239.80),
    (3, '2026-08-05 09:45:00', 'CONCLUIDO', 329.80),
    (4, '2026-08-08 16:20:00', 'CONCLUIDO', 199.90),
    (5, '2026-08-12 11:10:00', 'CONFIRMADO', 309.80),
    (6, '2026-08-15 13:40:00', 'CONCLUIDO', 269.80),
    (7, '2026-08-18 17:25:00', 'CONFIRMADO', 299.80),
    (8, '2026-08-22 10:05:00', 'PENDENTE', 219.90),
    (9, '2026-08-27 15:50:00', 'CANCELADO', 159.90),
    (10, '2026-08-30 12:30:00', 'CONCLUIDO', 379.80);


-- ============================================================
-- PEDIDO ITENS
-- ============================================================

INSERT INTO pedido_itens
    (pedido_id, produto_id, quantidade, valor_unitario, valor_total)
VALUES

    -- Pedido 1 - Ana
    (1, 1, 1, 59.90, 59.90),
    (1, 2, 1, 79.90, 79.90),

    -- Pedido 2 - Bruno
    (2, 4, 1, 159.90, 159.90),
    (2, 8, 1, 89.90, 89.90),

    -- Pedido 3 - Camila
    (3, 3, 1, 149.90, 149.90),
    (3, 7, 1, 179.90, 179.90),

    -- Pedido 4 - Daniel
    (4, 6, 1, 199.90, 199.90),

    -- Pedido 5 - Eduarda
    (5, 5, 1, 129.90, 129.90),
    (5, 9, 1, 119.90, 119.90),
    (5, 1, 1, 59.90, 59.90),

    -- Pedido 6 - Felipe
    (6, 2, 1, 79.90, 79.90),
    (6, 5, 1, 129.90, 129.90),
    (6, 8, 1, 89.90, 89.90),

    -- Pedido 7 - Gabriela
    (7, 7, 1, 179.90, 179.90),
    (7, 2, 1, 79.90, 79.90),
    (7, 1, 1, 59.90, 59.90),

    -- Pedido 8 - Henrique
    (8, 10, 1, 219.90, 219.90),

    -- Pedido 9 - Isabela
    (9, 4, 1, 159.90, 159.90),

    -- Pedido 10 - João
    (10, 6, 1, 199.90, 199.90),
    (10, 10, 1, 219.90, 219.90);