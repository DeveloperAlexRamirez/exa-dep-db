

CREATE DATABASE IF NOT EXISTS ExamenII;

USE ExamenII;

CREATE TABLE IF NOT EXISTS tblClientes(
    cliId INT PRIMARY KEY NOT NULL,
    cliNombre INT,
    cliDomicilio VARCHAR(20),
    cliCol VARCHAR(20),
    cliTel VARCHAR(20)
);

/* a) */
ALTER TABLE tblClientes
MODIFY COLUMN cliNombre VARCHAR(40);

/* b) */
ALTER TABLE tblClientes
ADD COLUMN cliExiste INT;

/* c) */
ALTER TABLE tblClientes
CHANGE cliCol cliColonia VARCHAR(20);


INSERT INTO tblClientes
VALUES (1, 'Adolfo Ochoa Ramirez', '25 de Marzo 308', 'Palo seco', '2246808', 1);

INSERT INTO tblClientes
VALUES (2, 'Claudia Cervantes', 'miramar 246', 'Pitillal', '2285151', 1);

INSERT INTO tblClientes(cliId, cliNombre, cliDomicilio, cliColonia, cliTel)
VALUES (3, 'Ferando Corona Mendoza', NULL, NULL, 1);



CREATE TABLE IF NOT EXISTS tblProductos(
    proId INT PRIMARY KEY NOT NULL,
    proNombre INT,
    proCosto DOUBLE,
    proExiste INT
);

INSERT INTO tblProductos
VALUES (10, 'MANZANA',10.50, 1);

INSERT INTO tblProductos
VALUES (20, 'PERA',5.00, 1);

INSERT INTO tblProductos
VALUES (30, 'TORONJA',4.50, 1);

ALTER TABLE tblProductos
MODIFY COLUMN proNombre VARCHAR(40);

CREATE TABLE IF NOT EXISTS tblVentas(
    venFolio INT PRIMARY KEY NOT NULL,
    venFecha DATETIME,
    venTotal DOUBLE,
    cliId INT NOT NULL,

    FOREIGN KEY(cliId) references tblClientes(cliId)
);

UPDATE tblVentas
SET venFecha = '2001-10-17'
WHERE venFolio = 4



INSERT INTO tblVentas
VALUES (1, '2011-09-16' ,20.50, 1);

INSERT INTO tblVentas
VALUES (2, '2011-09-17' ,46.50, 1);

INSERT INTO tblVentas
VALUES (3, '2011-06-18' ,45.50, 1);

INSERT INTO tblVentas
VALUES (4, '2011-10-16' ,18, 2);

INSERT INTO tblVentas
VALUES (5, '2011-10-19' ,4.50, 2);

INSERT INTO tblVentas
VALUES (6, '2011-10-16' ,10.50, 3);

CREATE TABLE IF NOT EXISTS tblDetVentas(
    venFolio INT NOT NULL,
    proId INT NOT NULL,
    detCantidad INT,
    detImporte INT,

    FOREIGN KEY(venFolio) references tblVentas(venFolio),

    FOREIGN KEY(proId) references tblProductos(proId)
);



ALTER TABLE tblDetVentas
MODIFY COLUMN detImporte DOUBLE;

INSERT INTO tblDetVentas
VALUES (1, 10 ,1, 10.50);

INSERT INTO tblDetVentas
VALUES (1, 20 ,2, 10.00);

INSERT INTO tblDetVentas
VALUES (2, 10 ,3, 31.50);

INSERT INTO tblDetVentas
VALUES (2, 20 ,3, 15.00);

INSERT INTO tblDetVentas
VALUES (3, 10 ,3, 31.50);

INSERT INTO tblDetVentas
VALUES (3, 20 ,1, 5);

INSERT INTO tblDetVentas
VALUES (3, 30 ,2, 9);

INSERT INTO tblDetVentas
VALUES (4, 30 ,4, 18);

INSERT INTO tblDetVentas
VALUES (5, 30 ,1, 4.50);

INSERT INTO tblDetVentas
VALUES (6, 10 ,1, 10.50);
