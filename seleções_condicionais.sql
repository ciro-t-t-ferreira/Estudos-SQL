-- #######################
-- SELEÇÕES E CONDICIONAIS:
-- #######################
	-- LIMITANDO NÚMERO DE REGISTROS MOSTRADOS:

SELECT CPF, NOME FROM tbcliente LIMIT 5;

-- CRIANDO ALIAS PARA OS NOMES DAS COLUNAS:

SELECT CPF AS CPF_CLIENTE, NOME AS NOME_CLIENTE FROM tbcliente;

	-- FILTRANDO RESULTADOS DA BUSCA:
-- Só mostrará os registros onde PRODUTO = '544931' for verdadeiro

SELECT * FROM tbproduto WHERE PRODUTO = '544931';

-- LIKE: selecionará registros como 'bla Maçã', 'Maçã bla' e 'bla Maçã bla', se usarmos '%' só à direita ou só à esquerda da palavra ele permitirá textos
-- diferentes só à esquerda ou à direita da palavra:

SELECT * FROM tabela_de_produtos WHERE SABOR LIKE '%Maça%';

-- AND, OR: é possível adicionar mais de uma condição ao condicional 'WHERE"

	-- MAIOR, MENOR e BETWEEN: o condicional where também pode ser utilizado com esses sinais, isso é particularmente relevante para tipos FLOAT, porque o sinal
-- de igual não funciona para esse tipo:

SELECT * FROM tbproduto WHERE PRECO_LISTA BETWEEN 16.007 AND 16.009;


