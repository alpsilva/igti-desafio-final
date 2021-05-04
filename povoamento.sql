USE Biblioteca;
GO

--Inserindo Usu�rios que ser�o professores
INSERT INTO Usuario(nome, endereco, CEP) VALUES
('Professor 1', 'Rua do professor 1', '00111-111'),
('Professor 2', 'Rua do professor 2', '00222-222'),
('Professor 3', 'Rua do professor 3', '00333-333'),
('Professor 4', 'Rua do professor 4', '00444-444'),
('Professor 5', 'Rua do professor 5', '00555-555');

--Inserindo Usu�rios que ser�o alunos
INSERT INTO Usuario(nome, endereco, CEP) VALUES
('Aluno 1', 'Avenida do aluno 1', '01111-111'),
('Aluno 2', 'Avenida do aluno 2', '01222-222'),
('Aluno 3', 'Avenida do aluno 3', '01333-333'),
('Aluno 4', 'Avenida do aluno 4', '01444-444'),
('Aluno 5', 'Avenida do aluno 5', '01555-555'),
('Aluno 6', 'Avenida do aluno 6', '01666-666'),
('Aluno 7', 'Avenida do aluno 7', '01777-777'),
('Aluno 8', 'Avenida do aluno 8', '01888-888'),
('Aluno 9', 'Avenida do aluno 9', '01999-999'),
('Aluno 10', 'Avenida do aluno 10', '01000-000');

--Inserindo Usu�rios que ser�o funcion�rios
INSERT INTO Usuario(nome, endereco, CEP) VALUES
('Funcionario 1', 'Pra�a do funcionario 1', '02111-111'),
('Funcionario 2', 'Pra�a do funcionario 2', '02222-222'),
('Funcionario 3', 'Pra�a do funcionario 3', '02333-333');

--SELECT * FROM Usuario;

--Inserindo professores
INSERT INTO Professor (cod_usuario, curso) VALUES
(1, 'Computa��o'),
(2, 'Design Gr�fico'),
(3, 'Hist�ria'),
(4, 'Filosofia'),
(5, 'Sociologia');
GO

--Inserindo alunos
INSERT INTO Aluno(cod_usuario, curso, data_inicio, data_termino) VALUES
(6, 'Computa��o', '20150801', '20200801'),
(7, 'Design Gr�fico', '20170801', '20220801'),
(8, 'Hist�ria', '20200801', '20250801'),
(9, 'Filosofia', '20140801', '20180801'),
(10, 'Sociologia', '20150801', '20200801'),
(11, 'Computa��o', '20200801', '20250801'),
(12, 'Design Gr�fico', '20150801', '20220801'),
(13, 'Hist�ria', '20150801', '20200801'),
(14, 'Filosofia', '20100801', '20140801'),
(15, 'Sociologia', '20210801', '20250801');
GO

--Inserindo funcion�rios
INSERT INTO Funcionario(cod_usuario, salario) VALUES
(16, 1525.50),
(17, 1300.00),
(18, 1450.75);
GO

/*
SELECT * FROM Professor;
GO
SELECT * FROM Aluno;
GO
SELECT * FROM Funcionario;
GO
*/

--Inserindo autores
INSERT INTO Autor (nome, nacionalidade) VALUES
('Miguel de Cervantes', 'Castelhano'),
('Charles Dickens', 'Ingl�s'),
('Paulo Coelho', 'Portugu�s'),
('J. R. R. Tolkien', 'Ingl�s'),
('Antoine de Saint-Exup�ry', 'Franc�s'),
('J. K. Rowling', 'Ingl�s'),
('Agatha Christie', 'Ingl�s'),
('Cao Xueqin', 'Chin�s'),
('H. Rider Haggard', 'Ingl�s'),
('Osamu Dazai', 'Japon�s');

--Inserindo obras
INSERT INTO Obra (nome, classificacao, idioma, midia, editora, ano_edicao, num_edicao) VALUES
('Don Quixote', 'Literatura Cl�ssica', 'Portugu�s', 'Livro', 'Editora pt', '20150307', 10),
('Don Quixote', 'Literatura Cl�ssica', 'Ingl�s', 'Livro', 'Editora en', '20150307', 5),
('Don Quixote', 'Literatura Cl�ssica', 'Espanhol', 'Livro', 'Editora esp', '20150307', 3),
('Um conto de duas cidades', 'Literatura Cl�ssica', 'Portugu�s', 'Livro', 'Editora pt', '20150307', 3),
('O alquimista', 'Literatura Nacional', 'Portugu�s', 'Livro', 'Editora pt', '20150307', 2),
('O Senhor dos An�is', 'Fantasia', 'Portugu�s', 'Livro', 'Editora pt', '20150307', 23),
('O Senhor dos An�is', 'Fantasia', 'Ingl�s', 'Livro', 'Editora en', '20150307', 21),
('Harry Potter e a Pedra Filosofal', 'Fantasia', 'Portugu�s', 'Livro', 'Editora pt', '20100307', 2),
('O Hobbit', 'Fantasia', 'Portugu�s', 'Livro', 'Editora pt', '20080307', 1),
('And Then There Were None', 'Fic��o', 'Ingl�s', 'Livro', 'Editora en', '20040307', 2),
('O Sonho da C�mara Vermelha', 'Literatura Asi�tica', 'Portugu�s', 'Livro', 'Editora pt', '20030307', 1),
('Ela, a Feiticeira', 'Literatura Cl�ssica', 'Portugu�s', 'Livro', 'Editora pt', '20120307', 2),
('No Longer Human', 'Literatura Asi�tica', 'Ingl�s', 'Livro', 'Editora en', '20090307', 1),
('O Pequeno Pr�ncipe', 'Literatura Cl�ssica', 'Portugu�s', 'Livro', 'Editora pt', '20020307', 3),
('O Pequeno Pr�ncipe', 'Literatura Cl�ssica', 'Ingl�s', 'Livro', 'Editora en', '20040307', 6),
('O Pequeno Pr�ncipe', 'Literatura Cl�ssica', 'Espanhol', 'Livro', 'Editora esp', '20060307', 9);

/*
SELECT * FROM Autor;
GO
SELECT * FROM Obra;
GO
*/

--Inserindo em Autoria
INSERT INTO Autoria (cod_autor, cod_obra) VALUES
(1, 1),
(1, 2),
(1, 3),
(2, 4),
(3, 5),
(4, 6),
(4, 7),
(4, 9),
(6, 8),
(7, 10),
(8, 11),
(9, 12),
(10, 13),
(5, 14),
(5, 15),
(5, 16);


/*
SELECT * FROM Professor;
GO
SELECT * FROM Obra;
GO
*/

--Fazendo alguns empr�stimos para professores
EXEC SP_empresta_professor @cod_professor=5, @cod_obra=13;
GO
EXEC SP_empresta_professor @cod_professor=3, @cod_obra=1;
GO
EXEC SP_empresta_professor @cod_professor=2, @cod_obra=5;
GO
EXEC SP_empresta_professor @cod_professor=1, @cod_obra=9;
GO
EXEC SP_empresta_professor @cod_professor=4, @cod_obra=15;
GO

--SELECT * FROM Emprestimo_professor;

/*
SELECT * FROM Aluno;
GO
SELECT * FROM Obra;
GO
*/

--Fazendo alguns empr�stimos para alunos
EXEC SP_empresta_aluno @cod_aluno = 1, @cod_obra = 3;
GO
EXEC SP_empresta_aluno @cod_aluno = 1, @cod_obra = 16;
GO
EXEC SP_empresta_aluno @cod_aluno = 2, @cod_obra = 10;
GO
EXEC SP_empresta_aluno @cod_aluno = 9, @cod_obra = 14;
GO
EXEC SP_empresta_aluno @cod_aluno = 10, @cod_obra = 7;
GO

--SELECT * FROM Emprestimo_aluno;

--Fazendo algumas devolu��es
EXEC SP_devolver_livro_aluno @cod_aluno = 1, @cod_obra = 16;
GO
EXEC SP_devolver_livro @cod_obra=15;
GO