CREATE DATABASE PRESUPUESTOLOTES;
USE PRESUPUESTOLOTES;

CREATE TABLE LOTES (
    nLote VARCHAR(10) NOT NULL PRIMARY KEY,
    ubicacion VARCHAR(255) NOT NULL,
    costMt  DECIMAL(10,2) NOT NULL,
    dimension  VARCHAR(255) NOT NULL,
)
CREATE TABLE CLIENTES(
    nCliente VARCHAR(10) PRIMARY KEY NOT NULL,
    nombre VARCHAR(255) NOT NULL,
    telefono VARCHAR(15) NOT NULL,
    email VARCHAR(255) NOT NULL,
)

CREATE TABLE VENDEDORES (
    nVendedor VARCHAR(10) PRIMARY KEY NOT NULL,
    nombre VARCHAR(255) NOT NULL,
    telefono VARCHAR(15) NOT NULL,
    email VARCHAR(255) NOT NULL,
)

CREATE TABLE PRESUPUESTO(
    folio VARCHAR(10) NOT NULL PRIMARY KEY,
    fecha DATE NOT NULL,
    nVendedor VARCHAR(10) NOT NULL,
    nCliente VARCHAR(10) NOT NULL,

    FOREIGN KEY (nVendedor) REFERENCES VENDEDORES(nVendedor),
    FOREIGN KEY (nCliente) REFERENCES CLIENTES(nCliente)    
)
CREATE TABLE PRESUPUESTOLOTE(
    folio VARCHAR(10) NOT NULL,
    nLote VARCHAR(10) NOT NULL,

    FOREIGN KEY (folio) REFERENCES PRESUPUESTO(folio),
    FOREIGN KEY (nLote) REFERENCES LOTES(nLote)

    PRIMARY KEY (folio, nLote)
)