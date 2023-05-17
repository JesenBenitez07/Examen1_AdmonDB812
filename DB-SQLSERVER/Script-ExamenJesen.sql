create database examen_JesenBenitez

create table proveedor(
id_proveedor varchar(5) not null Primary key,
nombre varchar(20) not null,
contacto int not null,
direccion varchar(20) not null
);

create table gestioncompra(
id_compra varchar(5) not null Primary key,
id_proveedor varchar (5) not null,
monto int not null,
Foreign Key(id_proveedor) References proveedor(id_proveedor),
);

create table productos(
id_producto varchar(5) not null Primary key,
producto varchar (20) not null,
monto int not null,
);

create table inventario(
id_inventario varchar(5) not null Primary key,
id_producto varchar (5) not null,
id_compra varchar (5) not null,
cantidad int not null
Foreign Key(id_compra) References gestioncompra(id_compra),
Foreign Key(id_producto) References productos(id_producto),
);

INSERT INTO proveedor VALUES 
('P001', 'Proveedor 1', 123456789, 'SPS'),
('P002', 'Proveedor 2', 987654321, 'Villanueva'),
('P003', 'Proveedor 3', 555555555, 'Choloma'),
('P004', 'Proveedor 4', 111111111, 'Tegucigalpa'),
('P005', 'Proveedor 5', 222222222, 'San Pedro Sula'),
('P006', 'Proveedor 6', 333333333, 'La Ceiba'),
('P007', 'Proveedor 7', 444444444, 'Comayagua'),
('P008', 'Proveedor 8', 555555555, 'Copán'),
('P009', 'Proveedor 9', 666666666, 'Roatán'),
('P010', 'Proveedor 10', 777777777, 'Gracias'),
('P011', 'Proveedor 11', 888888888, 'Danlí'),
('P012', 'Proveedor 12', 999999999, 'Juticalpa'),
('P013', 'Proveedor 13', 101010101, 'El Progreso'),
('P014', 'Proveedor 14', 121212121, 'Santa Rosa de Copán'),
('P015', 'Proveedor 15', 131313131, 'Yoro');

INSERT INTO gestioncompra VALUES 
('C001', 'P001', 1000),
('C002', 'P002', 2000),
('C003', 'P003', 1500),
('C004', 'P004', 3000),
('C005', 'P005', 4000),
('C006', 'P006', 2500),
('C007', 'P007', 3500),
('C008', 'P008', 5000),
('C009', 'P009', 2000),
('C010', 'P010', 1500),
('C011', 'P011', 4500),
('C012', 'P012', 6000),
('C013', 'P013', 7000),
('C014', 'P014', 5500),
('C015', 'P015', 2500);

INSERT INTO productos VALUES 
('PR001', 'Pasta dental', 25),
('PR002', 'Desodorante P/H', 75),
('PR003', 'Desodorante P/M', 75),
('PR004', 'Jabon de baño', 15),
('PR005', 'Huevo und', 6),
('PR006', 'Maseca lb', 15),
('PR007', 'Cloro', 10),
('PR008', 'Pollo lb', 40),
('PR009', 'Chuleta lb', 40),
('PR010', 'Camaron lb', 100),
('PR011', 'Azucar lb', 15),
('PR012', 'Aceite lb', 25),
('PR013', 'Papel higienico', 16),
('PR014', 'Cepillo dental',13),
('PR015', 'Pescado lb', 60);


INSERT INTO inventario VALUES 
('I001', 'PR001', 'C001', 50),
('I002', 'PR002', 'C001', 30),
('I003', 'PR003', 'C002', 10),
('I004', 'PR004', 'C002', 20),
('I005', 'PR005', 'C003', 15),
('I006', 'PR006', 'C003', 25),
('I007', 'PR007', 'C004', 40),
('I008', 'PR008', 'C004', 35),
('I009', 'PR009', 'C005', 60),
('I010', 'PR010', 'C005', 50),
('I011', 'PR011', 'C006', 55),
('I012', 'PR012', 'C006', 45),
('I013', 'PR013', 'C007', 30),
('I014', 'PR014', 'C007', 25),
('I015', 'PR015', 'C008', 20);

create table cliente(
id_cliente varchar(5) not null Primary key,
nombre varchar(20) not null,
contacto int not null
);

create table credito(
id_credito varchar(5) not null Primary key,
id_cliente varchar(5) not null,
limite_credito int not null,
saldo_pendiente int,
Foreign Key(id_cliente) References cliente (id_cliente),
);

create table pagos(
id_pago varchar(5) not null Primary key,
id_credito varchar(5) not null,
monto_pago int,
Foreign Key(id_credito) References credito (id_credito),
);

create table ventas(
id_venta varchar(5) not null Primary key,
id_cliente varchar(5) not null,
tipo_pago varchar (25) not null,
Foreign Key(id_cliente) References cliente(id_cliente),
);

INSERT INTO cliente VALUES 
('C001', 'Juan Ramirez', 123456789),
('C002', 'Maria Fernandez', 987654321),
('C003', 'Javier Lopez', 555555555),
('C004', 'Ana Perez', 111111111),
('C005', 'Luis Gonzalez', 222222222),
('C006', 'Carla Martinez', 333333333),
('C007', 'Pedro Rodriguez', 444444444),
('C008', 'Laura Gomez', 555555555),
('C009', 'Daniel Herrera', 666666666),
('C010', 'Sofia Torres', 777777777),
('C011', 'Manuel Sanchez', 888888888),
('C012', 'Gabriela Rios', 999999999),
('C013', 'Ricardo Castro', 101010101),
('C014', 'Fernanda Morales', 121212121),
('C015', 'Andres Vargas', 131313131);

INSERT INTO credito VALUES 
('CR001', 'C001', 10000, 5000),
('CR002', 'C002', 15000, 10000),
('CR003', 'C003', 20000, 15000),
('CR004', 'C004', 12000, 8000),
('CR005', 'C005', 18000, 12000),
('CR006', 'C006', 25000, 20000),
('CR007', 'C007', 30000, 25000),
('CR008', 'C008', 22000, 18000),
('CR009', 'C009', 35000, 30000),
('CR010', 'C010', 40000, 35000),
('CR011', 'C011', 28000, 22000),
('CR012', 'C012', 32000, 26000),
('CR013', 'C013', 18000, 14000),
('CR014', 'C014', 24000, 20000),
('CR015', 'C015', 21000, 17000);

INSERT INTO pagos VALUES 
('P001', 'CR001', 1000),
('P002', 'CR001', 500),
('P003', 'CR002', 2000),
('P004', 'CR002', 1500),
('P005', 'CR003', 3000),
('P006', 'CR003', 2500),
('P007', 'CR004', 1200),
('P008', 'CR004', 800),
('P009', 'CR005', 1800),
('P010', 'CR005', 1000),
('P011', 'CR006', 2500),
('P012', 'CR006', 2000),
('P013', 'CR007', 3000),
('P014', 'CR007', 2500),
('P015', 'CR008',1500);

INSERT INTO ventas VALUES
('V001', 'C001', 'efectivo' ),
('V002', 'C002', 'efectivo' ),
('V003', 'C003', 'efectivo'),
('V004', 'C004', 'efectivo' ),
('V005', 'C005', 'efectivo' ),
('V006', 'C006', 'efectivo'),
('V007', 'C007', 'efectivo' ),
('V008', 'C008', 'efectivo' ),
('V009', 'C009', 'efectivo'),
('V0010', 'C010', 'efectivo' ),
('V0011', 'C0011', 'efectivo' ),
('V0012', 'C0012', 'efectivo'),
('V0013', 'C0013', 'efectivo' ),
('V0014', 'C0014', 'efectivo' ),
('V0015', 'C0015', 'efectivo');