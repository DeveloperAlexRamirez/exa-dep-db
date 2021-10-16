

CREATE DATABASE IF NOT EXISTS ExamenII;

USE ExamenII;

CREATE TABLE IF NOT EXISTS tblClientes(
    cliId INT PRIMARY KEY NOT NULL,
    cliNombre INT,
    cliDomicilio VARCHAR(20),
    cliCol VARCHAR(20),
    cliTel VARCHAR(20)
);

CREATE TABLE IF NOT EXISTS tblProductos(
    proId INT PRIMARY KEY NOT NULL,
    proNombre INT,
    proCosto DOUBLE,
    proExiste INT
);

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
