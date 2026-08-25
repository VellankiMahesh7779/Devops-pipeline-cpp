CREATE TABLE products (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    price INT NOT NULL
);

INSERT INTO products (name, price)
VALUES
('Laptop', 50000),
('Phone', 25000),
('Headphones', 3000),
('Monitor', 15000),
('Keyboard', 2000),
('Mouse', 1000),
('Charger', 1500),
('Camera',8000);