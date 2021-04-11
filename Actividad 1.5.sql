
create database Blueprintactiv1_5
GO
use Blueprintactiv1_5
GO
create table Paises(
	IdPais int not null primary key identity(1,1), 
	Nombre varchar(100) not null
	)

GO
create table Ciudades(
	IdCiudad int not null primary key identity(1,1), 
	Nombre varchar(100) not null,
	IdPais int null foreign key references Paises(IdPais)
	)

GO
create table TiposClientes( 
	IdTipo int not null primary key identity(1,1),
	Descripcion varchar(50) not null
)
GO
create table Clientes(
	IdCliente int not null primary key identity(1,1), 
	RazonSocial varchar(100) not null unique, 
	Cuit varchar(11) not null unique, 
	IdTipo int not null foreign key references TiposClientes (IdTipo), 
	Email varchar(100) null, 
	Telefono varchar(20) null, 
	Celular varchar(20) null,
	Idciudad int null foreign key references Ciudades(IdCiudad)

	
	)
GO
create table Proyectos(
	IdProyect varchar(5) not null primary key, 
	Nombreproy varchar(50) not null, 
	Descriproyect varchar(300) null, 
	IdCliente int not null foreign key references Clientes (IdCliente), 
	FechaInicio date not null, 
	FechaFinal date null, 
	Costo money not null check (Costo > 0), 
	Estado bit not null default (1)
)

GO
create table Modulos(
	IdMod int not null primary key identity(1,1), 
	IdProyect varchar(5) not null foreign key references Proyectos (IdProyect),
	Nombres varchar(100) not null, 
	Descripcion varchar(300) null, 
	Horas int not null check (Horas >0 ),
	Costomod money not null check (Costomod > 0),
	FechaEst date not null ,
	FechaInico date not null,
	FechaFinal date not null,
	check (FechaFinal>=FechaInico)
		
	)

GO
create table Colaboradores(
	IdColab int not null primary key identity(1,1), 
	Apellidos varchar(100) not null, 
	Nombres varchar(100) not null,
	Genero char(1) null check (Genero='F' or Genero='M' or Genero='N'),
	Email varchar(100) null, 
	Celular varchar(20) null,
	check (Email != NULL or Celular !=NULL),
	FechaNac date not null check (FechaNac < getdate()),
	Direccion varchar(100) null,
	Idciudad int null foreign key references Ciudades(IdCiudad),
	IdPais int null foreign key references Paises(IdPais),
	TipoColaborador char(1) not null check(TipoColaborador='I' or TipoColaborador='E')
	)

GO
create table TiposTareas(
IDTipoTarea int not null primary key identity(1,1),
Descripcion varchar(100) not null
)

GO
create table Tareas(
	IdTarea int not null primary key identity(1,1),
	IdMod int not null foreign key references Modulos(IdMod),
	IDTipoTarea int not null foreign key references TiposTareas (IDTipoTarea),
	FechaInico date null,
	FechaFinal date  null,
	EstadoTarea char(1) not null check(EstadoTarea ='a' or EstadoTarea ='s'),
	
)
GO
create table Colaboraciones(
	IdTarea int not null foreign key references Tareas(IdTarea),
	IdColab int not null foreign key references Colaboradores(IdColab),
	Horas int not null,
	Valor money not null,
	EstadoColab varchar(11) not null check(EstadoColab ='aceptada' or EstadoColab ='suspendida'),
	primary key (IdTarea, IdColab)
)


	

