CREATE DATABASE projetoPI;

USE projetoPI;

-- Tabela de Cadastro de Empresa: exige muitos dados, mas fica mais organizado na hora do SELECT
CREATE TABLE cadastro(
	idCliente INT PRIMARY KEY AUTO_INCREMENT,
	nome_Cliente VARCHAR(190) NOT NULL,
	nome_Empresa VARCHAR(190) NOT NULL,
    cnpj_Empresa CHAR(14) NOT NULL,
    ddd CHAR(3) NOT NULL,
    telefone_Empresa CHAR(8) NOT NULL,
    email_Empresa VARCHAR(70) NOT NULL,
    pais VARCHAR(190) NOT NULL,
    estado VARCHAR(190) NOT NULL,
    cidade VARCHAR(190) NOT NULL,
    logradouro VARCHAR(190) NOT NULL,
    bairro VARCHAR(190) NOT NULL,
    numero VARCHAR(30) NOT NULL,
    complemento VARCHAR(190),
    cep VARCHAR(20),
    situacao VARCHAR(50),
    dt_Cadastro DATETIME DEFAULT CURRENT_TIMESTAMP,
    observacoes VARCHAR(300),
    CHECK (situacao IN('Ativo', 'Inativo', 'Suspenso'))
);

-- Tabela de Arduino: Guarda os dados emitidos pelo sensor
CREATE TABLE arduino(
	idArduino INT PRIMARY KEY AUTO_INCREMENT,
	temperatura_Atual DECIMAL(5,2),
    umidade_Atual DECIMAL(5,2),
    alerta_email TINYINT,
    alerta_sms TINYINT
);

-- Tabela de Alertas: Guarda a mensagem a ser exibida, o nível do alerta (de niveis Baixo, Médio e Crítico) e se o problema foi ou não resolvido
CREATE TABLE alertas(
	idAlerta INT PRIMARY KEY AUTO_INCREMENT,
    mensagem VARCHAR(255),
    nivel_Alerta VARCHAR(30),
    dt_Alerta DATETIME DEFAULT CURRENT_TIMESTAMP,
    resolvido TINYINT,
    CHECK (nivel_Alerta IN('Baixo', 'Médio', 'Crítico'))
);

-- Tabela de Tipos de Vinho: Guarda os dados necessários de temperatura/umidade mínimas e máximas para cada tipo de vinho
CREATE TABLE tipoVinho(
	idTipo INT PRIMARY KEY AUTO_INCREMENT,
	tipo VARCHAR(50),
    temperatura_Min DECIMAL(5,2),
    temperatura_Max DECIMAL(5,2),
    umidade_Min DECIMAL(5,2),
    umidade_Max DECIMAL(5,2),
    CHECK (tipo IN('Rose', 'Branco', 'Tinto'))
);


-- Script de inserção e consulta

-- Tabela Cadastro

INSERT INTO cadastro (nome_Cliente, nome_Empresa, cnpj_Empresa, ddd, telefone_Empresa, email_Empresa, pais, estado, cidade, bairro, numero, logradouro, complemento, cep, situacao, observacoes) VALUES
('João Silva', 'Vinícola Ouro Verde', '45678000195', '123', '33445566', 'contato@ouroverde.com', 'Brasil', 'RS', 'Bento Gonçalves', 'Centro', '1200', 'Rua das Uvas', 'Bloco A', '95700000', 'Ativo', 'Solicita relatórios mensais'),
('Maria Souza', 'Adega São Pedro', '65432000177', '987', '22334455', 'suporte@adegaspedro.com', 'Brasil', 'SP', 'São Roque', 'Jardim Vinhedos', '455', 'Avenida Vinhedo', 'Sala 2', '18130000', 'Ativo', 'Interessada em expansão do sistema');

SELECT * FROM cadastro;

SELECT idCliente, nome_Cliente AS 'Nome do Cliente',
		nome_Empresa AS 'Nome da Empresa',
		cnpj_Empresa AS 'CNPJ', 
		CONCAT('+', ddd, ' ', telefone_Empresa) AS 'Telefone empresarial',
		email_Empresa AS 'E-MAIL da Empresa', 
		CONCAT(logradouro, ', ', numero, ', ', complemento, ', ', bairro, ', ', cidade, ', ', estado, ', ', pais) AS 'Endereço',
		cep AS CEP, 
		situacao AS 'Situação do Cadastro',
		dt_Cadastro AS 'Data e Hora do Cadastro',
        observacoes AS 'Informações extras'
		FROM cadastro;

-- Tabela Arduino

INSERT INTO arduino (temperatura_Atual, umidade_Atual, alerta_email, alerta_sms) VALUES
	(13.50, 65.20, 1, 0),
	(15.10, 70.00, 0, 1),
	(18.75, 55.40, 1, 1);
    
SELECT * FROM arduino;

SELECT idArduino,
		temperatura_Atual AS 'Temperatura Atual',
		umidade_atual AS 'Umidade Atual',
        alerta_email AS 'Alerta por email?',
        alerta_sms AS 'Alerta por SMS?'
	FROM arduino;
    
-- Tabela de Alertas

INSERT INTO alertas (mensagem, nivel_Alerta, resolvido) VALUES
	('Temperatura acima do limite para vinho Tinto', 'Crítico', 0),
	('Umidade abaixo do ideal para armazenamento', 'Médio', 0),
	('Parâmetros voltaram ao normal', 'Baixo', 1);
    
SELECT * FROM alertas;

SELECT idAlerta, mensagem AS 'Mensagem',
		nivel_Alerta AS 'Nivel do Alerta',
        dt_Alerta AS 'Data e Hora do Alerta',
        resolvido AS 'Resolvido'
	FROM alertas;
    
-- Tabela de Tipo do Vinho

INSERT INTO tipoVinho (tipo, temperatura_Min, temperatura_Max, umidade_Min, umidade_Max) VALUES
	('Tinto', 12.00, 18.00, 60.00, 70.00),
	('Branco', 8.00, 12.00, 60.00, 70.00),
	('Rose', 10.00, 12.00, 55.00, 70.00);
    
SELECT * FROM tipoVinho;

SELECT idTipo, tipo AS 'Tipo do Vinho',
		temperatura_Min AS 'Temperatura Mínima',
        temperatura_Max AS 'Temperatura Máxima',
        umidade_Min AS 'Umidade Mínima',
        umidade_Max AS 'Umidade Máxima'
	FROM tipoVinho;