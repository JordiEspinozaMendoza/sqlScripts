USE PERSONALIDADES;

CREATE TABLE Roles(
    tipoRol VARCHAR(50) NOT NULL PRIMARY KEY,
    descripcion VARCHAR(100) NOT NULL
)
CREATE TABLE Estrategias(
    cveEstrategia VARCHAR(50) NOT NULL PRIMARY KEY,
    descripcion VARCHAR(100) NOT NULL
)
CREATE TABLE Tipos(
    tipo VARCHAR(50) NOT NULL PRIMARY KEY,
    descripcion VARCHAR(100) NOT NULL
)
CREATE TABLE DatosGenerales (
    matricula VARCHAR(50) NOT NULL PRIMARY KEY,
    cauteloso INTEGER NOT NULL,
    asertivo INTEGER NOT NULL,
    prospectador INTEGER NOT NULL,
    pensador INTEGER NOT NULL,
    juzgador INTEGER NOT NULL,
    codigo INTEGER NOT NULL,
    extrovertido INTEGER NOT NULL,
    obervador INTEGER NOT NULL,
    introvertido INTEGER NOT NULL,
    emocional INTEGER NOT NULL,

    tipo VARCHAR(50) NOT NULL,
    tipoRol VARCHAR(50) NOT NULL,
    cveEstrategia VARCHAR(50) NOT NULL,

    FOREIGN KEY (tipo) REFERENCES Tipos(tipo),
    FOREIGN KEY (tipoRol) REFERENCES Roles(tipoRol),
    FOREIGN KEY (cveEstrategia) REFERENCES Estrategias(cveEstrategia)
    
)