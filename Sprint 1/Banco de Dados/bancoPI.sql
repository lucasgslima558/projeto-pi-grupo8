-- Criando banco de dados

CREATE DATABASE projetoPI;

USE projetoPI;

-- Criando tabela de Cadastro

CREATE TABLE cadastro (
	idEmpresa INT PRIMARY KEY AUTO_INCREMENT,
	nome_Empresa VARCHAR(50) NOT NULL,
    telefone_Empresa VARCHAR(30) NOT NULL,
	email_Cliente VARCHAR(50) NOT NULL,
	site_Empresa VARCHAR (50) NOT NULL,
	senha_Acesso VARCHAR (12) NOT NULL,
	cnpj_Empresa CHAR (20) NOT NULL,
	cpf_Contratante CHAR (15) NOT NULL,
	cep_Contratante CHAR (10) NOT NULL,
	pais VARCHAR(190) NOT NULL,
    uf CHAR(2) NOT NULL,
    cidade VARCHAR(190) NOT NULL,
    logradouro VARCHAR(190) NOT NULL,
    bairro VARCHAR(190) NOT NULL,
    numero VARCHAR(30) NOT NULL,
    complemento VARCHAR(190),
    observacoes VARCHAR(300),
	dt_Cadastro DATETIME DEFAULT CURRENT_TIMESTAMP 
);

-- Inserindo dados na tabela de Cadastro

TRUNCATE TABLE cadastro;

INSERT INTO cadastro (nome_Empresa, telefone_Empresa, email_Cliente, site_Empresa, senha_Acesso, cnpj_Empresa, cpf_Contratante, cep_Contratante, pais, uf, cidade, logradouro, bairro, numero, complemento, observacoes) VALUES
	('Vinícola Ouro Verde', '+55 1193456-7890', 'clienteempresa01@gmail.com', 'www.vinicolaouroverde.com.br', '******@', '32.888.619/0001-70', '319.817.950-57', '15990-882', 'Brasil', 'RS', 'Bento Gonçalves', 'Rua das Uvas', 'Centro', '1200', 'Bloco A', 'Solicita relatórios mensais'),
	('Adega São Pedro', '+55 1123456-4532', 'suporte@adegaspedro.com', 'www.adegasaopedro.com.br', '*******@', '58.234.123/0001-70', '452.134.564-53', '38700-230', 'Brasil', 'SP', 'São Roque', 'Avenida Vinhedo', 'Jardim Vinhedos', '455', 'Sala 2', 'Interessada em expansão do sistema');

-- Selecionando e exibindo dados na tabela de Cadastro

SELECT * FROM cadastro;

SELECT idEmpresa,
	nome_Empresa AS 'Nome da Empresa',
	cnpj_Empresa AS 'CNPJ', 
	telefone_Empresa AS 'Telefone empresarial',
	email_Cliente AS 'E-MAIL da Empresa',
	cpf_Contratante AS 'CPF do Contratante',
	site_Empresa AS 'Site da Empresa',
	senha_Acesso AS 'Senha de Acesso',
	CONCAT(logradouro, ', ', numero, ', ', complemento, ', ', bairro, ', ', cidade, ', ', uf, ', ', pais) AS 'Endereço',
	cep_Contratante AS 'CEP', 
	observacoes AS 'Informações extras',
	dt_Cadastro AS 'Data e Hora do Cadastro'
	FROM cadastro;


-- Criando tabela de Arduino

CREATE TABLE dadosArduino(
	idArduino INT PRIMARY KEY AUTO_INCREMENT,
	temp_Atual VARCHAR(30),
	umid_Atual VARCHAR(30),
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
	tipo VARCHAR(50),
    temperatura_Min DECIMAL(5,2),
    temperatura_Max DECIMAL(5,2),
    umidade_Min DECIMAL(5,2),
    umidade_Max DECIMAL(5,2),
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