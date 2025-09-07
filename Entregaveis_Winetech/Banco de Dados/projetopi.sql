/*
Integrantes:
Davi Jeronimo da Silva
Gabriel Rodrigues de Lima
Lucas Gomes Souza Lima 
Lucas Tertuliano das Neves
Pedro Henrique Papuci de Carlos
Vinícius Francelino
*/

-- Criando banco de dados

CREATE DATABASE projetoPI;

USE projetoPI;

-- Criando tabela de Cadastro de Empresa

CREATE TABLE empresa (
	idEmpresa INT PRIMARY KEY AUTO_INCREMENT,
	nome VARCHAR(50) NOT NULL,
    ddd VARCHAR(5) NOT NULL,
    telefone VARCHAR(15) NOT NULL,
	email VARCHAR(50) NOT NULL, 
	site VARCHAR (100) NOT NULL,
	cnpj CHAR (16) NOT NULL,
	cep CHAR (9) NOT NULL,
	pais VARCHAR(20) NOT NULL,
    uf CHAR(2) NOT NULL,
    cidade VARCHAR(20) NOT NULL,
    logradouro VARCHAR(30) NOT NULL,
    bairro VARCHAR(25) NOT NULL,
    numero VARCHAR(5) NOT NULL,
    complemento VARCHAR(10),
	dt_Cadastro DATETIME DEFAULT CURRENT_TIMESTAMP 
);

-- Inserindo dados na tabela de Cadastro de Empresa

INSERT INTO empresa (nome, ddd, telefone, email, site, cnpj, cep, pais, uf, cidade, logradouro, bairro, numero, complemento) VALUES
	('Vinícola Ouro Verde', '55', '11934567890', 'clienteempresa01@gmail.com', 'www.vinicolaouroverde.com.br', '32888619000170', '15990882', 'Brasil', 'RS', 'Bento Gonçalves', 'Rua das Uvas', 'Centro', '1200', 'Bloco A'), 
	('Adega São Pedro', '55', '11234564532', 'suporte@adegaspedro.com', 'www.adegasaopedro.com.br', '58234123000170', '38700230', 'Brasil', 'SP', 'São Roque', 'Avenida Vinhedo', 'Jardim Vinhedos', '455', 'Sala 2');

-- Selecionando e exibindo dados na tabela de Cadastro de Empresa

SELECT idEmpresa,
	nome AS 'Nome',
	cnpj AS 'CNPJ', 
	CONCAT('+', ddd, ' ', telefone) AS 'Telefone',
	email AS 'E-mail',
	site AS 'Site',
	CONCAT(logradouro, ', ', numero, ', ', complemento, ', ', bairro, ', ', cidade, ', ', uf, ', ', pais) AS 'Endereço',
	cep AS 'CEP', 
	dt_Cadastro AS 'Data e Hora do Cadastro'
	FROM empresa;


-- Criando tabela de Usuário

CREATE TABLE usuario(
	idUsuario INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(20) NOT NULL,
    sobrenome VARCHAR(30) NOT NULL,
    senha VARCHAR(30) NOT NULL,
    cpf CHAR(12) NOT NULL,
    email VARCHAR(50),
    dt_Cadastro DATETIME DEFAULT CURRENT_TIMESTAMP
);

-- Inserindo dados na tabela de Cadastro do Usuário

INSERT INTO usuario (nome, sobrenome, senha, cpf, email) VALUES
	('João', 'Silva', '********@', '45213456453', 'joaosilva330@email.com'),
	('Maria', 'Souza', '******@', '31981795057', 'mariasouza1023@email.com');

-- Selecionando e exibindo dados na tabela de Cadastro do Usuário

SELECT CONCAT(nome , ' ', sobrenome) AS 'Nome',
		senha AS 'Senha de Acesso',
        cpf AS 'CPF',
        email AS 'E-mail'
        FROM usuario;

-- Criando tabela de Arduino	

CREATE TABLE dadosArduino(
	idArduino INT PRIMARY KEY AUTO_INCREMENT,
	temp_Atual DECIMAL(6,2),
	umid_Atual DECIMAL(6,2),
	dtHrMonitoramento DATETIME DEFAULT CURRENT_TIMESTAMP
);
  
-- Inseridos dados na tabela dadosArduino

INSERT INTO dadosArduino (temp_Atual, umid_Atual) VALUES
	('13.5', '66.2'),
	('14.1', '68.0'),
	('15.7', '62.5'),
	('12.9', '70.1'),
	('16.3', '59.8');

-- Selecionando e exibindo dados na tabela dadosArduino
  
  SELECT idArduino,
		temp_Atual AS 'Temperatura atual',
        umid_Atual AS 'Umidade atual',
        dtHrMonitoramento AS 'Data e Hora do Monitoramento'
        FROM dadosArduino;
  
  
-- Criando tabela tipoVinho

CREATE TABLE tipoVinho(
	idTipo INT PRIMARY KEY AUTO_INCREMENT,
	tipo VARCHAR(10) NOT NULL,
    temperatura_Min DECIMAL(6,2) NOT NULL,
    temperatura_Max DECIMAL(6,2) NOT NULL,
    umidade_Min DECIMAL(6,2) NOT NULL,
    umidade_Max DECIMAL(6,2) NOT NULL,
    dt_Safra DATE,
    CHECK (tipo IN('Rose', 'Branco', 'Tinto'))
);

-- Inserindo dados na tabela tipoVinho

INSERT INTO tipoVinho (tipo, temperatura_Min, temperatura_Max, umidade_Min, umidade_Max, dt_Safra) VALUES
	('Tinto', 12.00, 18.00, 60.00, 70.00, '2020-03-15'),
	('Branco', 8.00, 12.00, 60.00, 70.00, '2021-02-10'),
	('Rose', 10.00, 12.00, 55.00, 70.00, '2022-04-05');

-- Selecionando e exibindo dados na tabela tipoVinho

SELECT idTipo,
		tipo AS 'Tipo de vinho',
        temperatura_Min AS 'Temperatura mínima',
        temperatura_Max AS 'Temperatura máxima',
        umidade_Min AS 'Umidade mínima',
        umidade_Max AS 'Umidade máxima',
        dt_Safra AS 'Data da Safra'
        FROM tipoVinho;