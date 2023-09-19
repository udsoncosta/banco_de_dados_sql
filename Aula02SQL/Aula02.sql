USE db_quitanda;

SELECT * FROM tb_produtos; --lista produtos

SELECT * FROM tb_produtos ORDER BY nome ASC --ordem crescente

SELECT * FROM tb_produtos ORDER BY nome DESC; --ordem decrescente

SELECT * FROM tb_produtos WHERE id = 1; --lista o id desejado

SELECT * FROM tb_produtos WHERE id! = 1; --lista todos com exce��o, podendo usar WHERE NOT

SELECT * FROM tb_produtos 
WHERE preco IN(5,8) ORDER BY nome ASC;--ordem crescente entre o intervalo 

SELECT * FROM tb_produtos 
WHERE preco BETWEEN 5 AND 10.25; --produtos intervalo entre precos

SELECT * FROM tb_produtos WHERE nome LIKE 'm%'; --seleciona os produtos com a letra indicada

SELECT COUNT (*) AS 'Numero de Linhas' FROM tb_produtos; --quantidade de linhas com frase
SELECT COUNT (*) FROM tb_produtos; --quantidade de linhas

SELECT SUM(preco) FROM tb_produtos;
SELECT SUM(preco) as 'Valor total dos produtos' FROM tb_produtos; --soma dos produtos

SELECT AVG(preco) FROM tb_produtos; --media de preco
SELECT AVG(preco)as 'M�dia de pre�o dos produtos' FROM tb_produtos; --m�dia com frase

SELECT MAX(preco) FROM tb_produtos; --valor maximo de preco

SELECT MIN(preco) FROM tb_produtos; --valor minimo de preco

-- Relacionamneto entre tabelas

CREATE TABLE tb_categorias(
   Id BIGINT IDENTITY(1,1),
   Descricao VARCHAR(255) NOT NULL,
   PRIMARY KEY(Id)
); 

SELECT * FROM tb_categorias;

-- Insere dados na tabela tb_categorias


DROP TABLE tb_produtos;

CREATE TABLE tb_produtos(
  Id BIGINT IDENTITY(1,1),
  Nome VARCHAR(255)NOT NULL,
  Quantidade INT,
  DataValidade DATE,
  preco DECIMAL(6,2),
  PRIMARY KEY(Id),
  categoria_id BIGINT,
  FOREIGN KEY(categoria_id) REFERENCES tb_categorias(Id)
);

SELECT * FROM tb_produtos;

SELECT * FROM tb_categorias;

INSERT INTO tb_produtos --Insere dados na tabela produtos
(nome, quantidade, DataValidade, preco, categoria_id)
VALUES
('Banana', 1300, '2022-03-08', 5.00, 1),



SELECT tb_produtos.Id, nome, quantidade, DataValidade, preco, categoria_Id,
Descricao  FROM tb_produtos INNER JOIN tb_categorias
ON tb_categorias.Id = tb_produtos.categoria_id; --juntar as colunas

SELECT tb_produtos.Id, nome, quantidade, DataValidade, preco, categoria_Id,
Descricao  FROM tb_categorias LEFT JOIN tb_produtos
ON tb_categorias.Id = tb_produtos.categoria_id;

INSERT INTO tb_produtos (nome,quantidade, preco)
VALUES('Panela', 1118, 150.00);


SELECT tb_produtos.Id, nome, quantidade, DataValidade, preco, categoria_Id,
Descricao 
FROM tb_categorias RIGHT JOIN tb_produtos
ON tb_categorias.Id = tb_produtos.categoria_id
WHERE nome LIKE '%n%' ORDER BY tb_categorias.ID ASC;











