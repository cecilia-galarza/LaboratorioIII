create database Alumnos
GO
use Alumnos
GO
create table Carreras(
    ID varchar(4) not null primary key,
    Nombrecarre varchar(30) not null,
    Fechacre date not null check (Fechacre <= getdate()),
    Mail varchar(100) not null ,
	Nivel varchar(11) check( Nivel='Diplomatura' or Nivel='Pregrado' or Nivel='Grado' or Nivel='Posgrado')

)
GO
create table Alumnos(
    Legajo int not null primary key identity(1000, 1),
    IDCarrera varchar(4) not null foreign key references Carreras(ID),
    Apellidos varchar(100) not null,
    Nombres varchar(100) not null,
    Nacimiento date not null check (Nacimiento <= getdate()),
	Mail varchar(100) not null unique,
    Telefono varchar(20) null
)
GO
create table Materias(
    IDmateria int not null primary key identity(1, 1),
	IDCarrera varchar(4) not null foreign key references Carreras(ID),
    Nombrecarrera varchar(100) not null,
    Cargahoraria int not null check (Cargahoraria >0)
    )
