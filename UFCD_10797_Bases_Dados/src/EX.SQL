create table produto
(
	id_produto int primary key auto_increment,
    nome_produto varchar(50) not null,
    categoria varchar(20) not null,
    marca varchar(20) not null,
    preco decimal(10,2) not null,
    stock int not null,
    fornecedor varchar(30) not null,
    garantia_meses int not null,
    lancamento date not null,
    descontinuado boolean not null
);
 
insert into produto (nome_produto, categoria, marca, preco, stock, fornecedor, garantia_meses, lancamento, descontinuado)
values ('Portátil ProBook 450', 'Computadores', 'HP', 899.00, 15, 'TechDist', 24, '2025-03-15', FALSE),
('Monitor UltraWide 34"', 'Monitores', 'LG', 450.00, 8, 'DisplayPro', 36, '2025-01-20', FALSE),
('Teclado Mecânico RGB', 'Periféricos', 'Logitech', 89.90, 45, 'PerifShop', 12, '2024-11-10', FALSE),
('Rato Ergonómico MX', 'Periféricos', 'Logitech', 79.90, 52, 'PerifShop', 12, '2025-02-05', FALSE),
('Portátil Gaming Legion', 'Computadores', 'Lenovo', 1299.00, 5, 'TechDist', 24, '2025-05-12', FALSE),
('Webcam HD Pro', 'Periféricos', 'Logitech', 120.00, 0, 'PerifShop', 24, '2024-08-20', TRUE),
('Impressora LaserJet', 'Impressoras', 'HP', 320.00, 12, 'PrintSupply', 12, '2025-04-01', FALSE),
('Monitor Gamer 27"', 'Monitores', 'ASUS', 380.00, 18, 'DisplayPro', 36, '2025-06-15', FALSE),
('Disco SSD 1TB', 'Armazenamento', 'Samsung', 95.00, 67, 'StorageHub', 60, '2025-02-28', FALSE),
('Router WiFi 6', 'Redes', 'TP-Link', 65.00, 30, 'NetWorkShop', 24, '2025-03-10', FALSE),
('Tablet Pro 11"', 'Tablets', 'Samsung', 599.00, 9, 'MobileTech', 24, '2025-07-01', FALSE),
('Auriculares Bluetooth', 'Periféricos', 'Sony', 150.00, 23, 'AudioCenter', 12, '2025-01-15', FALSE),
('Portátil MacBook Air', 'Computadores', 'Apple', 1199.00, 7, 'AppleStore PT', 12, '2025-08-20', FALSE),
('Cadeira Ergonómica Pro', 'Mobiliário', 'Herman', 450.00, 4, 'OfficeComfort', 60, '2024-12-05', FALSE),
('Hub USB-C 7 Portas', 'Periféricos', 'Anker', 45.00, 88, 'PerifShop', 18, '2025-04-18', FALSE);