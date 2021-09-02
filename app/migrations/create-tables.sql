CREATE DATABASE Finanzas;

USE Finanzas;

CREATE TABLE Usuarios (
    Id INT AUTO_INCREMENT,
    Nombre VARCHAR(20) NOT NULL,
    Apellidos VARCHAR(50),
    Email VARCHAR(100) UNIQUE NOT NULL,
    Contraseña VARCHAR(250) NOT NULL,
    PRIMARY KEY (Id)
);

CREATE TABLE Categorias (
    Id int AUTO_INCREMENT NOT NULL,
    Nombre varchar(100) NOT NULL,
    Usuario int not null,
    Tipo ENUM('Gastos','Ingresos') NOT NULL,
    PRIMARY KEY (Id),
    FOREIGN KEY (Usuario) REFERENCES Usuarios(Id) ON DELETE CASCADE ON UPDATE CASCADE,
    UNIQUE CategoriaUsuario (Nombre, Usuario),
    INDEX Nombre (Nombre)
);

CREATE TABLE Subcategorias (
    Id int AUTO_INCREMENT NOT NULL,
    Nombre varchar(100) NOT NULL,
    Categoria int NOT NULL,
    PRIMARY KEY (Id),
    FOREIGN KEY (Categoria) REFERENCES Categorias(Id) ON DELETE CASCADE ON UPDATE CASCADE,
    UNIQUE SubcategoriaCategoria (Nombre, Categoria),
    INDEX Nombre (Nombre)
);

CREATE TABLE Movimientos (
    Id int AUTO_INCREMENT NOT NULL,
    Concepto varchar(200) NOT NULL,
    Subcategoria int NOT NULL,
    Fecha date NOT NULL,
    PRIMARY KEY (Id),
    FOREIGN KEY (Subcategoria) REFERENCES Subcategorias(Id) ON DELETE CASCADE ON UPDATE CASCADE,
    INDEX Concepto (Concepto),
    INDEX Fecha (Fecha),
    Index SubcategoriaFecha (Subcategoria, Fecha)
);
