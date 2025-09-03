-- CRIANDO BANCO DE DADOS
CREATE DATABASE Pesquisaeinovação;
USE Pesquisaeinovação;

-- CRIANDO UMA TABELA PARA A TELA DE CADASTRO
CREATE TABLE cadastro (
idempresa INT PRIMARY KEY AUTO_INCREMENT,
nome_empresa VARCHAR(50) NOT NULL,
numero_contratante VARCHAR (16) NOT NULL,
email_contatocomcliente VARCHAR(50) NOT NULL,
site_empresa VARCHAR (50) NOT NULL,
senha_acessouser VARCHAR (12) NOT NULL,
cnpj_contratante CHAR (20) NOT NULL,
cpf_contratante CHAR (15) NOT NULL,
cep_contratante CHAR (10) NOT NULL,
endereço VARCHAR (50),
numero VARCHAR (10),
bairro VARCHAR (60),
estado CHAR(2),
tipos_de_vinho VARCHAR (10) NOT NULL ,
CONSTRAINT chkvinho
CHECK(tipos_de_vinho = 'Branco' OR tipos_de_vinho = 'Rose' OR tipos_de_vinho= 'Tinto') ,
dtCadastro DATETIME DEFAULT CURRENT_TIMESTAMP );


-- INSERINDO OS DADOS DO CLIENTE (EXEMPLO)
INSERT INTO cadastro (nome_empresa, numero_contratante, email_contatocomcliente, site_empresa, senha_acessouser, cnpj_contratante, cpf_contratante, cep_contratante, endereço, numero, bairro, estado, tipos_de_vinho) VALUES
( 'Vinhos do Sul', '+55 1193456-7890', 'clienteempresa01@gmail.com', 'www.vinhosdosul.com.br', 'senha123%', '32.888.619/0001-70', '319.817.950-57', '15990-882','Avenida Antônio Coelho', '202', 'Jardim Morumbi', 'SP',  'Branco'), 
( 'Vinhos SP', '+55 1190456-7891', 'clienteempresa02@gmail.com', 'www.vinhossp.com.br', 'senha223@', '35.625.319/0001-97', '905.575.910-40','18110-235', 'Rua José Herrera Higuera','820', 'Jardim Icatu', 'RS',  'Tinto'), 
( 'Casa de Vinhos Brasília', '+55 1192356-8790', 'clienteempresa03@gmail.com', 'www.casadevinhosbrasilia.com.br', 'senha232^', '89.223.328/0001-80', '157.447.410-38', '13482-203', 'Rua Dom Pedro I', '977', 'Jardim Florença', 'SP', 'Rose'), 
( 'VN Vinhos', '+55 1192466-0980', 'clienteempresa04@gmail.com','www.vnvinhos.com.br', 'senha454$', '10.545.841/0001-38', '348.583.000-30','19806-310', 'Rua Antônio Negrizolo','126', 'Vila Orestes','SP', 'Branco');

 -- TESTE PARA VERIFICAÇÃO DO EXEMPLO TABELA
 SELECT nome_empresa AS EMPRESAS,
 numero_contratante AS CONTATO,
 email_contatocomcliente AS EMAIL,
 site_empresa AS SITE,
 cnpj_contratante AS CNPJ,
 cpf_contratante AS CPF,
 cep_contratante AS CEP,
 endereço AS ENDEREÇO,
 numero AS NÚMERO ,
 bairro AS BAIRRO,
 estado AS ESTADO,
 tipos_de_vinho AS VINHOS,
 dtCadastro AS REGISTRO_CADASTRO
 FROM cadastro;
 
 
 
 

 -- CRIANDO UMA TABELA PARA OS DADOS RECEBIDOS PELO ARDUÍNO
 CREATE TABLE dadosard(
 idarduino INT PRIMARY KEY AUTO_INCREMENT,
 Horadata_monitoramento DATETIME DEFAULT CURRENT_TIMESTAMP,
 barril_vinho_monitorado VARCHAR (50),
 temp_maxreg  VARCHAR (10),
 temp_minreg  VARCHAR (10),
 umid_min VARCHAR (10),
 umid_max VARCHAR (10),
 CONSTRAINT chkbarril
 CHECK( barril_vinho_monitorado= 'Vinho Tinto' OR barril_vinho_monitorado= 'Vinho Rose' OR barril_vinho_monitorado= 'Vinho Branco') );
 
 -- INSERIR OS DADOS REGISTRADOS PELO ARDUÍNO NA TABELA 
 INSERT INTO dadosard (barril_vinho_monitorado, temp_maxreg, temp_minreg, umid_min, umid_max) VALUES
 ('Vinho Tinto', '18*C', '16*C', '62%', '69%'),
 ('Vinho Branco', '6*C', '9*C', '65%', '67%'),
 ('Vinho Rose', '11*C', '7*C', '60%', '66%'),
 ('Vinho Tinto', '17*C', '16*C', '61%', '68%');
 
 
 SELECT barril_vinho_monitorado AS BARRIL_MONITORADO,
 temp_maxreg AS TEMPERATURA_MÁXIMA,
 temp_minreg AS TEMPERATURA_MÍNIMA,
 umid_min AS UMIDADE_MÍNIMA,
 umid_max AS UMIDADE_MÁXIMA
 FROM dadosard;
 
 
 
 
 -- CRIANDO TABELA DETALHES DE ALERTA
 CREATE TABLE details (
 iddetails INT PRIMARY KEY AUTO_INCREMENT,
 Alerta_emitido VARCHAR(60),
 data_hora_do_alerta DATETIME DEFAULT CURRENT_TIMESTAMP,
 relatorios_alert VARCHAR(200),
 equipedest VARCHAR(30));
 
 -- INSERINDO DADOS DA TABELA 
 INSERT INTO details (Alerta_emitido, relatorios_alert, equipedest) VALUES
 ('irregularidade na temperatura', 'no horário descrito nesta tabela, ocorreu um aumento significativo da temperatura, onde foi ultrapassado o limite máximo em 6*C', 'Equipe de manutenção'),
 ('irregularidade na umidade', 'no horário descrito nesta tabela, ocorreu uma diminuição significativa da umidade, onde foi ultrapassado o limite minima em 5%', 'Equipe de manutenção'),
 ('irregularidade na temperatura', 'no horário descrito nesta tabela, ocorreu uma diminuição significativa da temperatura, onde foi ultrapassado o limite máximo em 10%', 'Equipe de manutenção');
 
 
 -- VISUALIZAÇÃO DA TABELA
 SELECT Alerta_emitido AS ALERTA,
 relatorios_alert AS RELATÓRIOS,
 equipedest AS EQUIPE_DESTINADA
 FROM details;
 
 
 





 
 
 


 
