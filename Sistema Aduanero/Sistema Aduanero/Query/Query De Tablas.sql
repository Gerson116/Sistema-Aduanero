Create Database Sistema_Aduanero
GO --Estos son separadores

use Sistema_Aduanero
GO --Estos son separadores

Create Table Clientes
(
ID int identity(1,1) primary key,
Nombres varchar(50) not null,
Apellidos varchar(50) not null,
Empresa varchar(50),
Provincia varchar(50),
Municipio varchar(50),
Calle varchar(30),
Sector varchar(30),
Usuario varchar(50),
pass varchar(50), --se cambio el nombre de contraseña a pass porque podia generar problemas.
Estatus varchar(50)
)
SELECT * FROM Clientes
GO

Create Table Clientes_Telefono
(
Codigo_Telefono int identity(1,1),
Telefono bigint not null,
Cliente_ID_FK int,
constraint FK_CT foreign key (Cliente_ID_FK) references Clientes(ID) 
)
SELECT * FROM Clientes_Telefono
GO --Estos son separadores

Create Table CLientes_Correo
(
Codigo_Correo int identity(1,1) primary key,
Correo varchar not null, --se cambio la cantidad maxima
Cliente_ID_FK int,
constraint FK_CC foreign key (Cliente_ID_FK) references Clientes(ID)
)
--cambio de caracteres maximo
alter table Clientes_Correo alter column Correo varchar(100)
SELECT * FROM CLientes_Correo
GO

Create Table Pedidos
(
No_Pedido int identity(1,1) primary key,
Tipo_Pedido varchar (40),
TIpo_Mercancia text,
Cantidad int,
Peso int, --se cambio el tipo de datos
Descripcion text, --se cambio la "ó" por una "o" solamente para evitar posibles errores.
Estatus varchar(30),
Cliente_ID_FK int not null,
Constraint Fk_CP foreign key (Cliente_ID_FK) references Clientes(ID)
)
--el dato de peso se cambio a flotante
alter table Pedidos alter column peso float
SELECT * FROM Pedidos
GO

Create Table Facturacion
(
ID_Factura int identity(1,1) primary key,
Cliente_ID_FK int not null,
Tipo_Pago varchar(30),
No_Pedido_FK int not null,
Dia int, 
Mes int,
Anio int,
Balance money,
Estatus varchar(30),
constraint FK_CF foreign key (Cliente_ID_FK) references Clientes(ID),
constraint FK_PF foreign key (No_Pedido_Fk) references Pedidos(No_Pedido)
)
SELECT * FROM Facturacion
GO

Create Table Declaracion 
(
No_Declaracion int identity(1,1) primary key, 
ID_Factura_FK int, 
Cliente_ID_Fk int, 
Descripcion text,
Estatus varchar(30),
constraint FK_FD foreign key (ID_Factura_FK) references Facturacion(ID_Factura),
constraint FK_CD foreign key (Cliente_ID_FK) references Clientes(ID)
)
SELECT * FROM Declaracion
GO

Create Table Entrega 
(
ID_Entrega int identity(1,1) primary key, 
ID_Factura_FK int, 
Cliente_ID_FK int, 
Cantidad_Articulos int,
Dia int, 
Mes int, 
Anio int, --Se cambio el nombre del campo año por "anio"
Estatus varchar(30),
constraint FK_CE foreign key (Cliente_ID_FK) references Clientes(ID),
constraint FK_FE foreign key (ID_Factura_FK) references Facturacion(ID_Factura)
)
SELECT * FROM Entrega
GO

Create Table Envio 
(
ID_Envio int identity(1,1) primary key, 
ID_Factura_FK int, 
Cliente_ID_FK int, 
Cantidad_Articulos int, 
Dia int, 
Mes int, 
Anio int, --Se cambio el nombre del campo año por: "anio"
Estatus varchar(20),
constraint FK_CE1 foreign key (Cliente_ID_FK) references Clientes(ID),
constraint FK_FE1 foreign key (ID_Factura_FK) references Facturacion(ID_Factura)
)
SELECT * FROM Envio
GO


--Este son tablas creadas para los empleado que tendran acenso al sistema
Create Table Empleados
(
Nombre Varchar(50),
Apellidos varchar(50),
Cedula varchar(10) primary key not null,
Usuario varchar(50),
Contrasenia varchar(50), --Se cambio el nombre de este campo Contraseña por: "Contrasenia"
Cargo varchar(50),
Estatus varchar(30)
)
alter table Empleados alter column Cedula varchar(15) not null
SELECT * FROM Empleados
GO