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

CREATE TABLE JogoMemoria (
idJogoMemoria INT PRIMARY KEY AUTO_INCREMENT,
dtTentativa DATE
) AUTO_INCREMENT = 100;

CREATE TABLE Tentativa (
idTentativa INT,
horaInicio TIME,
horaFim TIME,
tentativa_erro INT,
fkUsuario INT,
fkJogoMemoria INT,
CONSTRAINT UsuarioTentativa
	FOREIGN KEY (fkUsuario)
		REFERENCES Usuario (idUsuario),
CONSTRAINT JogoMemoriaTentativa
	FOREIGN KEY (fkJogoMemoria)	
		REFERENCES JogoMemoria (idJogoMemoria),
CONSTRAINT pkComposta
	PRIMARY KEY (idTentativa, fkUsuario, fkJogoMemoria)
);

CREATE TABLE Tenis (
idTenis INT PRIMARY KEY AUTO_INCREMENT,
modelo VARCHAR (45),
colorway VARCHAR (45),
dtLancamento DATE,
fkJogoMemoria INT,
CONSTRAINT JogoMemoriaTenis
	FOREIGN KEY (fkJogoMemoria)
		REFERENCES JogoMemoria (idJogoMemoria)
);