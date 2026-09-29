-- Aula20 - Integridade Referencial

-- Crie a tabela de clientes
CREATE TABLE customers (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL
);

-- Crie a tabela de pedidos
CREATE TABLE orders (
    id SERIAL PRIMARY KEY,
    total DECIMAL(10, 2),
    customer_id INT,
    FOREIGN KEY (customer_id) REFERENCES customers (id)
);

-- Insira dados na tabela de clientes
INSERT INTO
    customers (name, email)
VALUES (
        'Clark Kent',
        'clark@email.com'
    ),
    (
        'Bruce Wayne',
        'bruce@email.com'
    ),
    (
        'Diana Prince',
        'diana@email.com'
    );

-- Insira dados na tabela de pedidos
INSERT INTO
    orders (total, customer_id)
VALUES (100.00, 1),
    (240.00, 2),
    (200.00, 1),
    (420.00, 3),
    (700.00, 2);

SELECT *
FROM orders
    JOIN customers ON customers.id = orders.customer_id;

DROP TABLE orders;

CREATE TABLE IF NOT EXISTS orders (
    id SERIAL PRIMARY KEY,
    total DECIMAL(10, 2),
    customer_id INT,
    FOREIGN KEY (customer_id) REFERENCES customers (id) 
    ON DELETE CASCADE -- Quando excluir, vai excluir todos os dados vinculados
    -- ON UPDATE SET NULL -- O registro e mantido com o valor null
    ON UPDATE CASCADE -- O registro e mantido com o valor null
);

DELETE FROM customers WHERE id = 1;

UPDATE customers SET id = 40 WHERE id = 2;