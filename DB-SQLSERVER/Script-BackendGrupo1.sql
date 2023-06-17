CREATE DATABASE ControlMantenimientoComputadoras;
GO

USE ControlMantenimientoComputadoras;
GO

CREATE TABLE Clientes (
    IDCliente INT PRIMARY KEY,
    NombreCliente VARCHAR(50),
    Direccion VARCHAR(50),
	Telefono VARCHAR(50),
	Email VARCHAR(50)
);

CREATE TABLE Tecnicos (
    IDTecnico INT PRIMARY KEY,
    NombreTecnico VARCHAR(50),
    Puesto VARCHAR(50),
	Telefono int
);

CREATE TABLE Procesadores (
    IDProcesador INT PRIMARY KEY,
    Modelo VARCHAR(50),
    Marca  VARCHAR(50),
	Generacion VARCHAR(50)
);

CREATE TABLE SistemasOperativos (
    IDSistemaOperativo INT PRIMARY KEY,
    Nombre VARCHAR(50),
    Arquitectura VARCHAR (50)
);

CREATE TABLE Computadoras (
    IDComputadora INT PRIMARY KEY,
    IDCliente INT,
    IDProcesador INT,
    IDSistemaOperativo INT,
    Service_Tag VARCHAR(50),
    Modelo VARCHAR(50),
	Marca VARCHAR(50),
    FechaAdquisicion DATE,
    Memoria_RAM INT,
    Disco_Duro INT,
    FOREIGN KEY (IDCliente) REFERENCES Clientes(IDCliente),
    FOREIGN KEY (IDProcesador) REFERENCES Procesadores(IDProcesador),
    FOREIGN KEY (IDSistemaOperativo) REFERENCES SistemasOperativos(IDSistemaOperativo)
);

CREATE TABLE Mantenimientos (
    IDMantenimiento INT PRIMARY KEY,
    IDComputadora INT,
    IDTecnico INT,
    FechaMantenimiento DATE,
    Descripcion VARCHAR(255),
    Realizado BIT, 
    FOREIGN KEY (IDComputadora) REFERENCES Computadoras(IDComputadora),
    FOREIGN KEY (IDTecnico) REFERENCES Tecnicos(IDTecnico)
);

CREATE TABLE ProximosMantenimientos (
    IDProximoMantenimiento INT PRIMARY KEY,
    IDMantenimiento INT,
    FechaProximoMantenimiento DATE,
    FOREIGN KEY (IDMantenimiento) REFERENCES Mantenimientos(IDMantenimiento)
);

CREATE TABLE Reparaciones (
    IDReparacion INT PRIMARY KEY,
    IDComputadora INT,
    IDTecnico INT,
    FechaReparacion DATE,
    Problema VARCHAR(255),
    Solucion VARCHAR(255),
    FOREIGN KEY (IDComputadora) REFERENCES Computadoras(IDComputadora),
    FOREIGN KEY (IDTecnico) REFERENCES Tecnicos(IDTecnico)
);

INSERT INTO Clientes (IDCliente, NombreCliente,Direccion,Telefono,Email)
VALUES (1, 'Juan Manuel Padilla','SPS', '98641053', 'juanm.padilla13@hotmail.com'),
       (2, 'Jesen Benitez', 'Choloma','98632154','jesenb.yahoo.com'),
       (3, 'Jorge Emanuel Portillo','Choloma','87563214','jesenb.yahoo.com'),
       (4, 'Beatriz Quijada','Omoa','35462186','bquijada20@gmail.com'),
       (5, 'Elsy Carolina Alas','Villanueva','95122334','elsy.alas@hotmail.com');


INSERT INTO Tecnicos (IDTecnico, NombreTecnico,Puesto,Telefono)
VALUES (1, 'Adrian Padilla','Electronica','99999999'),
       (2, 'Andres Zelaya','Informatica','99999999'),
       (3, 'Blena Carranza','Ventas','99999999'),
       (4, 'Jose Vallecillo','Electronica','99999999'),
       (5, 'Niel Molina','Informatica','99999999');


INSERT INTO Procesadores (IDProcesador, Modelo,Marca,Generacion)
VALUES (1, 'I3-6530','Intel','Sexta'),
       (2, 'Ryzen 5','AMD','Octava'),
       (3, 'I7-6575','Intel','Doceava'),
       (4, 'I5-U3520','Intel','Septima'),
       (5, 'Rysen 9','AMD','Decima');

INSERT INTO SistemasOperativos (IDSistemaOperativo, Nombre,Arquitectura)
VALUES (1, 'Windows 10','32 bits'),
       (2, 'Linux Ubuntu','64 bits'),
       (3, 'Linux Open Suse','64 bits'),
       (4, 'Windows 11','64 bits'),
       (5, 'Windows Server 2019','64 bits');


INSERT INTO Computadoras (IDComputadora, IDCliente, IDProcesador, IDSistemaOperativo, Service_Tag, Modelo,Marca, FechaAdquisicion, Memoria_RAM, Disco_Duro)
VALUES (1, 1, 1, 1, 'NS001', 'Modelo 1','Marca 1', '2022-01-01', 8, 500),
       (2, 2, 2, 2, 'NS002', 'Modelo 2','Marca 2', '2022-02-01', 16, 1000),
       (3, 3, 3, 3, 'NS003', 'Modelo 3','Marca 3', '2022-03-01', 8, 500),
       (4, 4, 4, 4, 'NS004', 'Modelo 4','Marca 4', '2022-04-01', 16, 1000),
       (5, 5, 5, 5, 'NS005', 'Modelo 5','Marca 5', '2022-05-01', 8, 500);

INSERT INTO Mantenimientos (IDMantenimiento, IDComputadora, IDTecnico, FechaMantenimiento, Descripcion, Realizado)
VALUES (1, 1, 1, '2022-01-10', 'Mantenimiento 1', 1),
       (2, 2, 2, '2022-02-10', 'Mantenimiento 2', 1),
       (3, 3, 3, '2022-03-10', 'Mantenimiento 3', 0),
       (4, 4, 4, '2022-04-10', 'Mantenimiento 4', 0),
       (5, 5, 5, '2022-05-10', 'Mantenimiento 5', 1)
