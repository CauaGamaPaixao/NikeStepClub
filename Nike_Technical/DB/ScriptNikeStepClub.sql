CREATE DATABASE NikeStepClub;
USE NikeStepClub;


CREATE TABLE Usuario (
idUsuario INT PRIMARY KEY AUTO_INCREMENT,
nome VARCHAR (45),
sobrenome VARCHAR (45),
email VARCHAR (45),
senha VARCHAR (16),
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

INSERT INTO Tenis (modelo, colorway, dtLancamento, tipo, HOF) VALUES
	('Air Jordan 4', 'University Blue', '2021-04-28', 'Casual', 0),
	('Nike Kobe 06', 'Grinch Green Aple', '2020-12-24', 'Esporte', 0),
	('Nike Ja 1', 'Red Stardust', '2023-05-11', 'Esporte', 0),
	('Nike Air Zoom Alphafly 3', 'Coconut Milk', '2025-05-01', 'Esporte', 0),
	('Nike Air Max', 'Neon Yellow', '2020-12-17', 'Casual', 0),
	('Nike Air Zoom Pegasus', 'Orange Crimson', '2025-03-08', 'Esporte', 0),
	('Air Jordan 3', 'Fire Red', '2022-09-10', 'Casual', 0),
	('Air Jordan 4', 'Thunder', '2023-05-13', 'Casual', 0),
	('Nike Air Max TW', 'Racer Blue', '2022-11-17', 'Casual', 0),
	('Air Jordan 1 Low', 'Reverse Mocha', '2022-07-21', 'Casual', 0),
	('NOCTA x Nike Hot Step 2', 'Total White', '2024-05-20', 'Casual', 0),
	('Air Jordan 1 High', 'Bred Toe', '2018-02-24', 'Casual', 0);
    
SELECT Tenis.modelo AS Tenis 
FROM Usuario JOIN Inventario
ON fkUsuario = idUsuario
JOIN Tenis ON fkTenis = idTenis
WHERE idUsuario = 4;

SELECT * FROM Usuario;

