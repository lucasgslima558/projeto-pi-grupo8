/*
Banco de dados - PI
Cadastro - id, empresa, responsavel, cnpj, phone, email, pass;
Sensores - id, temperatura, umidade, data/hora, 

*/

-- Criação e acesso ao banco de dados;
CREATE DATABASE pi;
USE pi;
-- --------------------------------------------------------- --

CREATE TABLE users(
	id INT PRIMARY KEY AUTO_INCREMENT,
    empresa VARCHAR(50) NOT NULL,
    responsavel VARCHAR(50) NOT NULL,
    cnpj VARCHAR(14) NOT NULL,
    phone VARCHAR(15),
    email VARCHAR(80) NOT NULL,
    pass VARCHAR(20) NOT NULL,
    tipoVinho VARCHAR(6) NOT NULL,
	CONSTRAINT chkVinho CHECK(tipoVinho IN('Branco', 'Rose', 'Tinto')) 
);

INSERT INTO users (empresa, responsavel, cnpj, email, pass, tipoVinho) VALUE
	('Vinícola Encanto do Vale Ltda', 'Gabriel Almeida', '43623765000190', 'gabriel@vinicolaencanto.com', '1234', 'Rose'),
	('Adega Horizonte Vinhos ME', 'João Francelino', '00800583000135', 'joao@adegahorizonte.com', '123@Mudar', 'Tinto'),
	('Vinhos Monte Sereno S/A', 'Gabriel Oliveira', '00800583000135', 'gabriel@vinhosmonte.com', 'senha01', 'Branco'),
	('Cantina Aurora do Sul Ltda', 'Gabriela Ferreira', '97724088000126', 'gabriela@cantinaaurora.com', 'pass', 'Rose'),
	('Vinícola Serra Dourada ME', 'Marlon Souza', '09600499000142', 'marlon@vinicolaserradourada.com', 'senha', 'Branco'),
	('Vinhos Terra Vermelha Comércio Ltda', 'Mateus Queiroz', '17722946000164', 'mateus@vinhosterra.com', 'teste', 'Rose'),
	('Adega Encosta Azul Importadora S/A', 'Maia Silva', '76521772000130', 'maia@adegaencosta.com', 'maia.Silva123', 'Branco'),
	('Vinícola Pôr do Sol ME', 'Nathan Vireira', '45947206000161', 'nathan@vinicolapor.com', '128478', 'Tinto'),
	('Vinhos & Sabores da Serra Ltda', 'Fabio Taos', '84526004000106', 'fabio@vinhossabores.com', '12345', 'Rose'),
    ('Casa do Vinho Estrela Ltda', 'Mariana Castro', '55432177000190', 'mariana@casadovinho.com', '2222', 'Tinto');
    
-- Update dos telefones separadamente em alguns clients
UPDATE users SET phone = '(11) 91234-5678' WHERE id = 1 ;
UPDATE users SET phone = '(31) 97654-3210' WHERE id = 2 ;
UPDATE users SET phone = '(51) 98765-4321' WHERE id = 5;
UPDATE users SET phone = '(81) 96789-0123' WHERE id = 8;
UPDATE users SET phone = '(85) 98901-2345' WHERE id = 10;

SELECT * FROM users;

-- --------------------------------------------------------- --

CREATE TABLE sensors (
	id INT PRIMARY KEY AUTO_INCREMENT,
	sensorId VARCHAR(20) NOT NULL,
    temp DECIMAL(5,2) NOT NULL,
    umidade DECIMAL(5,2) NOT NULL,
    datte TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

INSERT INTO sensors (sensorId, temp, umidade) VALUES
	('SENSOR001', 23.45, 55.20),
	('SENSOR002', 25.10, 60.00),
	('SENSOR003', 22.80, 58.30),
	('SENSOR004', 24.50, 53.10),
	('SENSOR005', 26.20, 61.50),
	('SENSOR006', 23.90, 57.00),
	('SENSOR007', 25.75, 59.20),
	('SENSOR008', 24.10, 56.80),
	('SENSOR009', 23.60, 54.90),
	('SENSOR010', 26.00, 60.50);
    
SELECT * FROM sensors;
    
-- --------------------------------------------------------- --

CREATE TABLE devices(
	id INT PRIMARY KEY AUTO_INCREMENT,
	nomeDevice VARCHAR(30) NOT NULL,
    sensor VARCHAR(30) NOT NULL,
    CONSTRAINT chkSensor CHECK(sensor = 'Umidade' OR  sensor ='Temperatura') 
);
    
INSERT INTO devices (nomeDevice, sensor) values 
	('SENSOR001', 'Umidade'), 
	('SENSOR002', 'Temperatura'), 
	('SENSOR003', 'Umidade'), 
	('SENSOR004', 'Temperatura');

SELECT * FROM devices;