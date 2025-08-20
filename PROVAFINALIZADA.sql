--1 - Buscar o nome e ano dos filmes

--2 - Buscar o nome e ano dos filmes, ordenados por ordem crescente pelo ano

--3 - Buscar pelo filme de volta para o futuro, trazendo o nome, ano e a duração

--4 - Buscar os filmes lançados em 1997

--5 - Buscar os filmes lançados APÓS o ano 2000

--6 - Buscar os filmes com a duracao maior que 100 e menor que 150, ordenando pela duracao em ordem crescente

--7 - Buscar a quantidade de filmes lançadas no ano, agrupando por ano, ordenando pela duracao em ordem decrescente

--8 - Buscar os Atores do gênero masculino, retornando o PrimeiroNome, UltimoNome

--9 - Buscar os Atores do gênero feminino, retornando o PrimeiroNome, UltimoNome, e ordenando pelo PrimeiroNome

--10 - Buscar o nome do filme e o gênero

--11 - Buscar o nome do filme e o gênero do tipo "Mistério"

--12 - Buscar o nome do filme e os atores, trazendo o PrimeiroNome, UltimoNome e seu Papel

CREATE TABLE Atores(
	IdAtor INT PRIMARY KEY IDENTITY(1,1) NOT NULL,
	PrimeiroNome VARCHAR(20),
	UltimoNome VARCHAR(20),
	Genero VARCHAR(100)
)

---------------------------------------------8
SELECT PrimeiroNome, UltimoNome
FROM Atores
WHERE Genero = 'Masculino'
---------------------------------------------9
SELECT PrimeiroNome, UltimoNome
FROM Atores
WHERE Genero = 'Femenino'
ORDER BY PrimeiroNome

INSERT INTO Atores(PrimeiroNome, UltimoNome, Genero) VALUES
('Tobey', 'Maguire', 'Masculino'),
('Kristen', 'Dusk', 'Femenino'),
('Tom', 'Holland', 'Masculino'),
('Tom', 'Cruise', 'Masculino'),
('Emma', 'Lawrence', 'Femenino');

---------------------------------------------

DROP TABLE Filmes
DROP TABLE Atores
DROP TABLE ElencoFilme
DROP TABLE FilmesGenero
DROP TABLE Generos

CREATE TABLE Filmes(
	IdFilme INT PRIMARY KEY IDENTITY(1,1) NOT NULL,
	Nome VARCHAR(50),
	Ano DATE,
	Duracao INT
)

INSERT INTO Filmes(Nome, Ano, Duracao) VALUES
('Mision Imposible', '1999-11-18', 120),
('Mision Imposible 2', '2004-10-22', 140),
('Volta para o futuro', '1987-09-02', 500),
('Terminator', '1997-02-02', 200),
('Titanic', '1997-08-02', 300),
('Spider-man', '2002-06-02', 150),
('Pixels', '2013-04-04', 50),
('The Amazing Spider-man','2012-04-17', 250);

SELECT * FROM Filmes
-------------------------------------1
SELECT Nome, Ano FROM Filmes
--------------------------------------

--------------------------------------2
SELECT Nome, Ano
FROM Filmes
ORDER BY Ano ASC
-------------------------------------3

SELECT * FROM Filmes
WHERE Nome = 'Volta para o futuro'

--------------------------------------4
SELECT * FROM Filmes
WHERE Ano >= '1997-01-01' AND Ano <= '1997-12-31'
---------------------------------------5
SELECT * FROM Filmes
WHERE Ano >= '2001-01-01'
-------------------------------------6

SELECT * FROM Filmes
WHERE Duracao > 100 AND Duracao < 150

----------------------------------------- 7
--7 - Buscar a quantidade de filmes lançadas no ano, agrupando por ano, ordenando pela duracao em ordem decrescente

SELECT Ano, Duracao, COUNT(Ano) AS TotalDeFilmesNoAno
FROM Filmes
GROUP BY Ano, Duracao
ORDER BY Duracao DESC

--------------------------------------8


-----------------------------------------------

CREATE TABLE ElencoFilme(
	IdElenco INT PRIMARY KEY IDENTITY(1,1) NOT NULL,
	IdAtor INT NOT NULL,
	IdFilme INT,
	Papel VARCHAR(30),

	FOREIGN KEY (IdAtor) REFERENCES Atores(IdAtor),
	FOREIGN KEY (IdFilme) REFERENCES Filmes(IdFilme)

)
--12 - Buscar o nome do filme e os atores, trazendo o PrimeiroNome, UltimoNome e seu Papel
INSERT INTO ElencoFilme(IdAtor, IdFilme, Papel) VALUES
(1, 3, 'HEROE-PROTAGONICO'),
(2, 3, 'CO-PROTAGONISTA'),
(3, 5, 'HEROE'),
(4, 7, 'PROTAGONISTA'),
(4, 8, 'PROTAGONISTA'),
(5, NULL, NULL)


----------------------------------------------------------12
SELECT Nome, PrimeiroNome, UltimoNome, Papel
FROM Filmes
INNER JOIN ElencoFilme ON ElencoFilme.IdFilme = Filmes.IdFilme
INNER JOIN Atores ON Atores.IdAtor = ElencoFilme.IdAtor





SELECT * FROM Atores
SELECT * FROM Filmes

CREATE TABLE Generos(
	IdGenero INT PRIMARY KEY IDENTITY(1,1) NOT NULL,
	Genero VARCHAR(100)
)

INSERT INTO Generos(Genero) VALUES
('Terror'),
('Misterio'),
('Accion'),
('Ficcion');

CREATE TABLE FilmesGenero(
	IdFilmeGenero INT PRIMARY KEY IDENTITY(1,1) NOT NULL,
	IdGenero INT,
	IdFilme INT,

	FOREIGN KEY (IdGenero) REFERENCES Generos(IdGenero),
	FOREIGN KEY (IdFilme) REFERENCES Filmes(IdFilme),
)

--10 - Buscar o nome do filme e o gênero

--11 - Buscar o nome do filme e o gênero do tipo "Mistério"

--12 - Buscar o nome do filme e os atores, trazendo o PrimeiroNome, UltimoNome e seu Papel

---------------------------------------------------------10

SELECT Nome, Genero
FROM Filmes
INNER JOIN FilmesGenero ON FilmesGenero.IdFilme = Filmes.IdFilme
INNER JOIN Generos ON Generos.IdGenero = FilmesGenero.IdGenero

----------------------------------------------------------11
SELECT Nome, Genero
FROM Filmes
INNER JOIN FilmesGenero ON FilmesGenero.IdFilme = Filmes.IdFilme
INNER JOIN Generos ON Generos.IdGenero = FilmesGenero.IdGenero
WHERE Genero = 'Misterio'

----------------------------------------------------------12



SELECT * FROM Filmes
SELECT * FROM Generos

INSERT INTO FilmesGenero(IdGenero, IdFilme) VALUES
(3,1),
(2,2),
(3,3),
(4,4),
(3,5),
(4,6),
(3,7),
(3,8);



-----------------------------------


-------------------------------------1
SELECT Nome, Ano FROM Filmes
--------------------------------------

--------------------------------------2
SELECT Nome, Ano
FROM Filmes
ORDER BY Ano ASC
-------------------------------------3

SELECT * FROM Filmes
WHERE Nome = 'Volta para o futuro'

--------------------------------------4
SELECT * FROM Filmes
WHERE Ano >= '1997-01-01' AND Ano <= '1997-12-31'
---------------------------------------5
SELECT * FROM Filmes
WHERE Ano >= '2001-01-01'
-------------------------------------6

SELECT * FROM Filmes
WHERE Duracao > 100 AND Duracao < 150

----------------------------------------- 7
--7 - Buscar a quantidade de filmes lançadas no ano, agrupando por ano, ordenando pela duracao em ordem decrescente

SELECT Ano, Duracao, COUNT(Ano) AS TotalDeFilmesNoAno
FROM Filmes
GROUP BY Ano, Duracao
ORDER BY Duracao DESC

--------------------------------------8

SELECT PrimeiroNome, UltimoNome
FROM Atores
WHERE Genero = 'Masculino'
---------------------------------------------9
SELECT PrimeiroNome, UltimoNome
FROM Atores
WHERE Genero = 'Femenino'
ORDER BY PrimeiroNome

INSERT INTO Atores(PrimeiroNome, UltimoNome, Genero) VALUES
('Tobey', 'Maguire', 'Masculino'),
('Kristen', 'Dusk', 'Femenino'),
('Tom', 'Holland', 'Masculino'),
('Tom', 'Cruise', 'Masculino'),
('Emma', 'Lawrence', 'Femenino');

---------------------------------------------------------10

SELECT Nome, Genero
FROM Filmes
INNER JOIN FilmesGenero ON FilmesGenero.IdFilme = Filmes.IdFilme
INNER JOIN Generos ON Generos.IdGenero = FilmesGenero.IdGenero

----------------------------------------------------------11
SELECT Nome, Genero
FROM Filmes
INNER JOIN FilmesGenero ON FilmesGenero.IdFilme = Filmes.IdFilme
INNER JOIN Generos ON Generos.IdGenero = FilmesGenero.IdGenero
WHERE Genero = 'Misterio'

----------------------------------------------------------12
SELECT Nome, PrimeiroNome, UltimoNome, Papel
FROM Filmes
INNER JOIN ElencoFilme ON ElencoFilme.IdFilme = Filmes.IdFilme
INNER JOIN Atores ON Atores.IdAtor = ElencoFilme.IdAtor