CREATE DATABASE Biblioteca;
GO

USE Biblioteca;
GO

CREATE TABLE Usuario (
	cod_usuario INT IDENTITY(1, 1) NOT NULL,
	nome VARCHAR(50) NOT NULL,
	endereco VARCHAR(150),
	CEP VARCHAR(15),
	CONSTRAINT PK_cod_usuario PRIMARY KEY CLUSTERED (cod_usuario)
);
GO

CREATE TABLE Funcionario (
	cod_funcionario INT IDENTITY(1, 1) NOT NULL,
	cod_usuario INT NOT NULL,
	salario NUMERIC (7, 2) NOT NULL,
	CONSTRAINT PK_cod_funcionario PRIMARY KEY CLUSTERED (cod_funcionario),
	CONSTRAINT FK_usuario_funcionario FOREIGN KEY (cod_usuario) REFERENCES Usuario(cod_usuario)
);
GO

CREATE TABLE Professor (
	cod_professor INT IDENTITY(1, 1) NOT NULL,
	cod_usuario INT NOT NULL,
	curso VARCHAR(20) NOT NULL,
	CONSTRAINT PK_cod_professor PRIMARY KEY CLUSTERED (cod_professor),
	CONSTRAINT FK_usuario_professor FOREIGN KEY (cod_usuario) REFERENCES Usuario(cod_usuario)
);
GO

CREATE TABLE Aluno (
	cod_aluno INT IDENTITY(1, 1) NOT NULL,
	cod_usuario INT NOT NULL,
	curso VARCHAR(20) NOT NULL,
	data_inicio DATE NOT NULL,
	data_termino DATE NOT NULL,
	CONSTRAINT PK_cod_aluno PRIMARY KEY CLUSTERED (cod_aluno),
	CONSTRAINT FK_usuario_aluno FOREIGN KEY (cod_usuario) REFERENCES Usuario(cod_usuario)
);
GO

CREATE TABLE Obra (
	cod_obra INT IDENTITY(1, 1) NOT NULL,
	nome VARCHAR(50) NOT NULL,
	classificacao VARCHAR(30) NOT NULL,
	idioma VARCHAR(20) NOT NULL,
	disponibilidade CHAR NOT NULL DEFAULT '1',
	midia VARCHAR(20),
	editora VARCHAR(30)NOT NULL,
	ano_edicao DATE NOT NULL,
	num_edicao INT NOT NULL,
	CONSTRAINT PK_cod_obra PRIMARY KEY CLUSTERED (cod_obra)
);
GO

CREATE TABLE Autor (
	cod_autor INT IDENTITY(1, 1) NOT NULL,
	nome VARCHAR(50) NOT NULL,
	nacionalidade VARCHAR(20) NOT NULL,
	CONSTRAINT PK_cod_autor PRIMARY KEY CLUSTERED (cod_autor)
);
GO

CREATE TABLE Autoria (
	cod_autor INT NOT NULL,
	cod_obra INT NOT NULL,
	CONSTRAINT FK_autor_autoria FOREIGN KEY (cod_autor) REFERENCES Autor(cod_autor),
	CONSTRAINT FK_obra_autoria FOREIGN KEY (cod_obra) REFERENCES Obra(cod_obra)
);
GO

CREATE TABLE Emprestimo_professor (
	cod_professor INT NOT NULL,
	cod_obra INT NOT NULL,
	data_retirada DATE NOT NULL DEFAULT GETDATE(),
	data_entrega DATE,
	CONSTRAINT FK_professor_emprestimo_professor FOREIGN KEY (cod_professor) REFERENCES Professor(cod_professor),
	CONSTRAINT FK_obra_emprestimo_professor FOREIGN KEY (cod_obra) REFERENCES Obra(cod_obra)
);
GO

CREATE TABLE Emprestimo_aluno (
	cod_aluno INT NOT NULL,
	cod_obra INT NOT NULL,
	data_retirada DATE NOT NULL DEFAULT GETDATE(),
	data_entrega DATE NOT NULL,
	multa INT NOT NULL DEFAULT 0
	CONSTRAINT FK_aluno_emprestimo_aluno FOREIGN KEY (cod_aluno) REFERENCES Aluno(cod_aluno),
	CONSTRAINT FK_obra_emprestimo_aluno FOREIGN KEY (cod_obra) REFERENCES Obra(cod_obra)
);
GO

ALTER TABLE Aluno
ADD emprestimos INT NOT NULL DEFAULT 0;
GO

--Procedures de emprestimo

CREATE PROCEDURE SP_empresta_professor
--Parâmetros de entrada e seus tipos de dados
	@cod_professor INT,
	@cod_obra INT
	--@data_retirada DATE valor default
AS
BEGIN
	DECLARE @disp CHAR;
	SET @disp = (SELECT disponibilidade FROM Obra WHERE cod_obra = @cod_obra);

	IF (@disp = '0')
	BEGIN
		PRINT 'Livro indisponível';
	END
	ELSE
	BEGIN
		--Inserindo os valores de entrada na tabela
		INSERT INTO Emprestimo_professor (cod_professor, cod_obra, data_retirada)
		VALUES (@cod_professor,	@cod_obra, DEFAULT);

		--Atualizando a disponibilidade do livro para '0'
		UPDATE Obra SET disponibilidade = '0' WHERE cod_obra = @cod_obra;
	END
END;
GO

CREATE PROCEDURE SP_empresta_aluno
--Parâmetros de entrada e seus tipos de dados
	@cod_aluno INT,
	@cod_obra INT
	--@data_retirada DATE valor default
AS
BEGIN
	DECLARE @disp CHAR;
	SET @disp = (SELECT disponibilidade FROM Obra WHERE cod_obra = @cod_obra);
	IF (@disp = '0')
	BEGIN
		PRINT 'Livro indisponível';
	END
	ELSE
	BEGIN
		DECLARE @emprestimos INT;
		SET @emprestimos = (SELECT emprestimos FROM Aluno WHERE cod_aluno = @cod_aluno);

		IF (@emprestimos > 2)
		BEGIN
			PRINT 'Número máximo de empréstimos atingido.';
		END
		ELSE
		BEGIN
			DECLARE @entrega DATE;
			SET @entrega = DATEADD(day, 14, GETDATE());

			--Inserindo os valores de entrada na tabela
			INSERT INTO Emprestimo_aluno(cod_aluno, cod_obra, data_retirada, data_entrega, multa)
			VALUES (@cod_aluno,	@cod_obra, DEFAULT, @entrega, 0);

			--Atualizando a disponibilidade do livro para '0'
			UPDATE Obra SET disponibilidade = '0' WHERE cod_obra = @cod_obra;

			--Atualizando os emprestimos do aluno com +1
			UPDATE Aluno SET emprestimos = (emprestimos + 1) WHERE cod_aluno = @cod_aluno;
		END
	END
END;
GO

CREATE PROCEDURE SP_devolver_livro
--Parâmetros de entrada e seus tipos de dados
	@cod_obra INT
AS
BEGIN
	--Atualizando a disponibilidade do livro para '1'
	UPDATE Obra SET disponibilidade = '1' WHERE cod_obra = @cod_obra;
END;
GO

CREATE PROCEDURE SP_devolver_livro_aluno
--Parâmetros de entrada e seus tipos de dados
	@cod_aluno INT,
	@cod_obra INT
AS
BEGIN
	--Atualizando a disponibilidade do livro para '1'
	UPDATE Obra SET disponibilidade = '1' WHERE cod_obra = @cod_obra;

	--Atualizando os emprestimos do aluno com +1
	UPDATE Aluno SET emprestimos = (emprestimos - 1) WHERE cod_aluno = @cod_aluno;
END;
GO

