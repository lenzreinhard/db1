create database ecommerce;

use ecommerce;

create table Cliente (

	Nome varchar(150) not null,
	CPF char(11) not null,
	Email varchar (30) not null,
	IdCliente int primary key identity (1,1)
);

Create Table Endereco (
	IdEndereco int primary key identity (1,1),
	CEP char (9) not null,
	Cidade varchar(150) not null,
	Estado char(2) not null,
	Logradouro varchar (150) not null,
	Numero int not null,
	Complemento varchar(150)
);

Create Table Cliente_Endereco(
	IdCliente int not null,
	IdEndereco int not null,
	primary key (IdCliente,IdEndereco),
	foreign key (IdCliente) references Cliente(IdCliente),
	foreign key (IdEndereco) references Endereco(IdEndereco)
);

Create Table Produto (
	IdProduto int primary key identity (1,1),
	Descricao varchar(150) not null,
	Valor Decimal(10,2) not null,
);

Create table Pedido(
	IdPedido int,
	IdProduto int not null,
	primary key(IdPedido,IdProduto),
	foreign key (IdProduto) references Produto(IdProduto)
);



Create Table Venda (
	IdVenda int not null identity(1,1),
	IdCliente int not null,
	IdPedido int not null,
	Valor Decimal(10,2) not null,
	DataCompra datetime not null,
	DataEntrega datetime not null,

	primary key (IdVenda,IdCliente,IdPedido),
	foreign key (IdCliente) references Cliente(IdCliente)
);



insert into Cliente(Nome,CPF,Email) values
('Reinhard Lenz','38287608805','reinhard.lenz@cs.unicid.edu.br');

insert into Endereco(CEP,Cidade,Estado,Logradouro,Numero,Complemento)
values ('09791-240','São Bernardo do Campo','SP','Rua das dores','324','Apartamento 2 Torre 3');

insert into Cliente_Endereco values (1,1);

insert into Produto (Descricao,Valor) values ('Caneta',0.99);
insert into Produto (Descricao,Valor) values ('Borracha',1.25);
insert into Produto (Descricao,Valor) values ('Lapis',0.89);
insert into Produto (Descricao,Valor) values ('Apontador',2.99);
insert into Produto (Descricao,Valor) values ('Caderno',11.99);

insert into Pedido(IdPedido,IdProduto)
values(1,1);
insert into Pedido(IdPedido,IdProduto)
values(1,2);
insert into Pedido(IdPedido,IdProduto)
values(1,3);
insert into Pedido(IdPedido,IdProduto)
values(1,4);
insert into Pedido(IdPedido,IdProduto)
values(1,5);

insert into Venda(IdCliente,IdPedido,Valor,DataCompra,DataEntrega)
values (1,1,15.99,GETDATE(),GETDATE());


select sum(Valor)Total from Produto where Valor < 10;

select c.Nome,c.CPF,e.CEP,sum (p.Valor) ValorReal,v.Valor as ValorDesconto from Cliente c inner join Cliente_Endereco ce on c.IdCliente = ce.IdCliente inner join Endereco e on ce.IdEndereco =e.IdEndereco

inner join Venda v on v.IdCliente = c.IdCliente inner join Pedido pe on pe.IdPedido = v.IdPedido inner join Produto p on pe.IdProduto = p.IdProduto where c.IdCliente=1 group by c.Nome,c.CPF,e.CEP,v.Valor ;

update Produto set Valor = 7.50 where IdProduto = 2;

update Produto set Valor = 4.99 where IdProduto = 3;

update Produto set Descricao='Lapis de Cor' where IdProduto = 3;


delete from Pedido where IdProduto = 5;

delete from Produto where IdProduto = 5;

delete from Cliente_Endereco where IdCliente is null;
