

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

CREATE TABLE IF NOT EXISTS tblDetVentas(
    venFolio INT NOT NULL,
    proId INT NOT NULL,
    detCantidad INT,
    detImporte INT,

    FOREIGN KEY(venFolio) references tblVentas(venFolio),

    FOREIGN KEY(proId) references tblProductos(proId)
);
