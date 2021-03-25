create database blueprint
GO
use blueprint
GO
create table TiposClientes( --
IdTipos int not null primary key identity(1,1),
Descripcion varchar(50) not null
)
GO
create table Clientes(
    IdCliente int not null primary key identity(1,1), --
    RazonSocial varchar(100) not null, --
	Cuit varchar(11) not null unique, --
	IdTipos int not null foreign key references TiposClientes (IdTipos), --
	Mail varchar(100) null, --
    Telefono varchar(20) null, --
	Celular varchar(20) null --
	)
GO
create table Proyectos(
IdProyect varchar(5) not null primary key, --
Nombreproy varchar(50) not null, --
Descriproyect varchar(300) null, --
IdCliente int not null foreign key references Clientes (IdCliente), --
FechaInicio date not null, --
FechaFinal date null, --
Costo money not null, --
Estado bit not null --
)







