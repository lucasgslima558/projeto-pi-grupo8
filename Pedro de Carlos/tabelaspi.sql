CREATE DATABASE PESQUISAEINOVAÇÃO;
USE PESQUISAEINOVAÇÃO;

CREATE TABLE cadastro (
idCadastro INT PRIMARY KEY AUTO_INCREMENT,
nome VARCHAR(100),
numero_Cliente VARCHAR(15),
cpfcnpj VARCHAR(20),
tipo_vinho VARCHAR (10)
CONSTRAINT chkVinho
	CHECK (tipo_vinho IN('Branco', 'Rose', 'Tinto')),
endereco VARCHAR(100)); 

INSERT INTO cadastro (nome, numero_Cliente, cpfcnpj, tipo_vinho, endereco) VALUES 
('Carlos Souza', 'C001', '12345678901', 'Tinto', 'Rua das Videiras, 120'),
('Fernanda Lima', 'C002', '98765432100', 'Branco', 'Av. Central, 450'),
('João Mendes', 'C003', '45678912377', 'Rose', 'Rua do Vinho, 77');
SELECT * FROM cadastro;


CREATE TABLE arduino (
idDados INT PRIMARY KEY AUTO_INCREMENT,
temperatura VARCHAR(10),
umidade VARCHAR(5),
datas DATETIME );

INSERT INTO arduino (temperatura, umidade, datas) VALUES
('18.5', '60', '2025-08-30 08:15:00'),
('19.2', '62', '2025-08-30 09:00:00'),
('20.0', '58', '2025-08-30 09:45:00'),
('21.3', '55', '2025-08-30 10:30:00');
SELECT * FROM arduino;

CREATE TABLE barril (
id INT PRIMARY KEY AUTO_INCREMENT,
valor DECIMAL(10,2),
nome_vinho VARCHAR (100),
safra VARCHAR(5)
);
INSERT INTO barril (valor, nome_vinho, safra) VALUES
(3500.00, 'Cabernet Sauvignon Reserva Especial', '2018'),
(2800.50, 'Merlot Gran Reserva', '2019'),
(4200.00, 'Chardonnay Premium', '2020');
SELECT * FROM barril;