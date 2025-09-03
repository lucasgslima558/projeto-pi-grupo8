use sprint1;

create table cadastro (
idCod Int Primary key auto_increment, 
Razão_Social varchar(20), 
Responsável_Contratante varchar(20),
CNPJ varchar(18),
Abertura date);

alter table cadastro add column Tipo_vinho varchar(7);
alter table cadastro add constraint chkType
check(tipo_vinho in('Tinto', 'Rose', 'Branco'));

insert into cadastro values 
(1, 'Banana LTDA', 'Ricardo Eletro', '49.492.539/0001-02', '1991-10-07', 'Branco'),
(default, 'ScoreTech Solucoes', 'Carlos Nascimento', '13.349.660/0001-24', '1787-04-11', 'Rose'),
(default, 'Manancial', 'Paulo Vieira', '48.656.569/0001-36', '1955-09-06', 'Tinto'),
(default, 'Foster Autopeças', 'Bruno Sales', '51.410.495/0001-68', '2006-12-19', 'Rose'),
(default, 'Alliance', 'Miguel Teixeira', '93.501.649/0001-77', '1899-03-27', 'Branco'),
(default, 'Fresh Cola', 'Hugo Vitor', '83.581.860/0001-93', '2001-12-25', 'Tinto');

select * from cadastro;
select Razão_Social, CNPJ  from cadastro ;
 
 

create table arduino (
id Int Primary key, 
temperatura decimal(4,1), 
porc_umidade  decimal(4,1),
hora time);

insert into arduino values
(1, 14.0, 60.0, '13:00:00'),
(2, 16.0, 55.0, '13:05:00'),
(3, 19.0, 49.0, '13:10:00'),
(4, 20.0, 48.0, '13:15:00'),
(5, 19.0, 48.0, '13:20:00'),
(6, 17.0, 49.0, '13:25:00'),
(7, 22.0, 46.0, '13:30:00'),
(8, 24.0, 42.0, '13:35:00'),
(9, 23.0, 42.0, '13:40:00'),
(10, 21.0, 43.0, '13:45:00'),
(11, 19.0, 45.0, '13:50:00'),
(12, 16.0, 45.0, '13:55:00'),
(13, 14.0, 47.0, '14:00:00');

select * from arduino;



