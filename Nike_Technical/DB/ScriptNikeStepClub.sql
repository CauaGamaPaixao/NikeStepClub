CREATE DATABASE NikeStepClub;
USE NikeStepClub;

CREATE TABLE Usuario (
idUsuario INT PRIMARY KEY AUTO_INCREMENT,
nome VARCHAR (45),
sobrenome VARCHAR (45),
email VARCHAR (45),
senha VARCHAR (45),
dtNascimento DATE
);

CREATE TABLE Tenis (
idTenis INT PRIMARY KEY AUTO_INCREMENT,
modelo VARCHAR (45),
colorway VARCHAR (45),
dtLancamento DATE,
tipo VARCHAR (45),
HOF INT,
CONSTRAINT chkHOF
	CHECK (HOF IN (0, 1))
);

CREATE TABLE Inventario (
idInventario INT,
fKUsuario INT,
fkTenis INT,
quantidade INT,
valor DECIMAL (8, 2),
CONSTRAINT pkComposta
	PRIMARY KEY (idInventario, fkUsuario, fkTenis),
CONSTRAINT UsuarioInventario
	FOREIGN KEY (fkUsuario)
		REFERENCES Usuario (idUsuario),
CONSTRAINT TenisInventario
	FOREIGN KEY (fkTenis)
		REFERENCES Tenis (idTenis)
);