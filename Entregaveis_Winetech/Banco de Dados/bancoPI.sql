-- Criando banco de dados

CREATE DATABASE projetoPI;

USE projetoPI;

-- Criando tabela de Cadastro de Empresa

CREATE TABLE empresa (
	idEmpresa INT PRIMARY KEY AUTO_INCREMENT,
	nome_Empresa VARCHAR(50) NOT NULL,
    ddd VARCHAR(10) NOT NULL,
    telefone_Empresa VARCHAR(30) NOT NULL,
	email_Empresa VARCHAR(50) NOT NULL,
	site_Empresa VARCHAR (100) NOT NULL,
	cnpj_Empresa CHAR (20) NOT NULL,
	cep_Empresa CHAR (10) NOT NULL,
	pais VARCHAR(100) NOT NULL,
    uf CHAR(2) NOT NULL,
    cidade VARCHAR(100) NOT NULL,
    logradouro VARCHAR(100) NOT NULL,
    bairro VARCHAR(100) NOT NULL,
    numero VARCHAR(30) NOT NULL,
    complemento VARCHAR(190),
    observacoes VARCHAR(300),
	dt_CadastroEmpresa DATETIME DEFAULT CURRENT_TIMESTAMP 
);

-- Inserindo dados na tabela de Cadastro de Empresa

INSERT INTO empresa (nome_Empresa, ddd, telefone_Empresa, email_Empresa, site_Empresa, cnpj_Empresa, cep_Empresa, pais, uf, cidade, logradouro, bairro, numero, complemento, observacoes) VALUES
	('Vinícola Ouro Verde', '55', '11934567890', 'clienteempresa01@gmail.com', 'www.vinicolaouroverde.com.br', '32888619000170', '15990882', 'Brasil', 'RS', 'Bento Gonçalves', 'Rua das Uvas', 'Centro', '1200', 'Bloco A', 'Solicita relatórios mensais'),
	('Adega São Pedro', '55', '11234564532', 'suporte@adegaspedro.com', 'www.adegasaopedro.com.br', '58234123000170', '38700230', 'Brasil', 'SP', 'São Roque', 'Avenida Vinhedo', 'Jardim Vinhedos', '455', 'Sala 2', 'Interessada em expansão do sistema');

-- Selecionando e exibindo dados na tabela de Cadastro de Empresa

SELECT * FROM empresa;

SELECT idEmpresa,
	nome_Empresa AS 'Nome da Empresa',
	cnpj_Empresa AS 'CNPJ', 
	CONCAT('+', ddd, ' ', telefone_Empresa) AS 'Telefone empresarial',
	email_Empresa AS 'E-mail da Empresa',
	site_Empresa AS 'Site da Empresa',
	CONCAT(logradouro, ', ', numero, ', ', complemento, ', ', bairro, ', ', cidade, ', ', uf, ', ', pais) AS 'Endereço',
	cep_Empresa AS 'CEP', 
	observacoes AS 'Informações extras',
	dt_CadastroEmpresa AS 'Data e Hora do Cadastro'
	FROM empresa;


-- Criando tabela de Usuário

CREATE TABLE usuario(
	idUsuario INT PRIMARY KEY AUTO_INCREMENT,
    nome_Cliente VARCHAR(100) NOT NULL,
    sobrenome_Cliente VARCHAR(100) NOT NULL,
    senha_Acesso VARCHAR(30) NOT NULL,
    cpf_Cliente CHAR(12) NOT NULL,
    email_Cliente VARCHAR(100),
    dt_CadastroUsuario DATETIME DEFAULT CURRENT_TIMESTAMP
);

-- Inserindo dados na tabela de Cadastro do Usuário

INSERT INTO usuario (nome_Cliente, sobrenome_Cliente, senha_Acesso, cpf_Cliente, email_Cliente) VALUES
	('João', 'Silva', '********@', '45213456453', 'joaosilva330@email.com'),
	('Maria', 'Souza', '******@', '31981795057', 'mariasouza1023@email.com');

-- Selecionando e exibindo dados na tabela de Cadastro do Usuário

SELECT CONCAT(nome_Cliente , ' ', sobrenome_Cliente) AS 'Nome do Cliente',
		senha_Acesso AS 'Senha de Acesso',
        cpf_Cliente AS 'CPF',
        email_Cliente AS 'E-mail'
        FROM usuario;

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