-- ###################################
-- Organizando o resultado da consulta
-- ###################################

	-- DISTINCT: não mostra registros repetidos (vai depender de quais colunas estão selecionadas na consulta)

SELECT DISTINCT EMBALAGEM, TAMANHO FROM tabela_de_produtos;

	-- LIMIT
-- Com um único parâmetro(x): mostra os x primeiros registros

SELECT * FROM tabela_de_produtos LIMIT 5;

-- Com dois parâmetros (x,y): mostra os y primeiros registros a partir do x-ésimo registro

SELECT * FROM tabela_de_produtos LIMIT 2,3;

	-- ORDER BY
-- Ordena em ordem ascendente, dada a coluna <PRECO_DE_LISTA>:

SELECT * FROM tabela_de_produtos ORDER BY PRECO_DE_LISTA;

-- Pode ordenar na sequência inversa também:

SELECT * FROM tabela_de_produtos ORDER BY PRECO_DE_LISTA DESC;

	-- GROUP BY: (!IMPORTANTE!) exige que se estabeleça um critério de agrupamento (sum, max, min, avg)
-- No exemplo abaixo todos os registros com o mesmo valor para ESTADO (argumento do GROUP BY) serão mostrados como um único registro, sendo que todos os valores
-- da coluna LIMITE_DE_CREDITO serão somados 

SELECT ESTADO, SUM(LIMITE_DE_CREDITO) AS LIMITE_TOTAL FROM tabela_de_clientes GROUP BY ESTADO;    

-- Group by também pode ser utilizado para contar certos tipos de registro da tabela:

SELECT EMBALAGEM, COUNT(*) AS CONTADOR FROM tabela_de_produtos GROUP BY EMBALAGEM;

-- Group by pode agrupar conjuntos de colunas, ver ex:alter

SELECT ESTADO, BAIRRO, SUM(LIMITE_DE_CREDITO) AS LIMITE FROM tabela_de_clientes
GROUP BY ESTADO, BAIRRO;

	-- HAVING: ele é basicamente um WHERE, estabelece um filtro de quais resultados serão mostrados, mas ao invés do condicional ser uma coluna o condicional é 
    -- algum agrupamento (sum, max, min, avg):
    
SELECT EMBALAGEM, MAX(PRECO_DE_LISTA) AS MAIOR_PRECO,
MIN(PRECO_DE_LISTA) AS MENOR_PRECO FROM tabela_de_produtos
GROUP BY EMBALAGEM HAVING SUM(PRECO_DE_LISTA) <= 80;

	-- CASE: organiza os registros em categorias, o rótulo escrito após THEN ('PRODUTO CARO', 'PRODUTO EM CONTA') e após ELSE aparece em uma coluna adicional
    -- com o título colocado após o "END AS" (STATUS_PRECO) ver ex:

SELECT NOME_DO_PRODUTO, PRECO_DE_LISTA,
CASE
   WHEN PRECO_DE_LISTA >= 12 THEN 'PRODUTO CARO'
   WHEN PRECO_DE_LISTA >= 7 AND PRECO_DE_LISTA < 12 THEN 'PRODUTO EM CONTA'
   ELSE 'PRODUTO BARATO'
END AS STATUS_PRECO
FROM tabela_de_produtos;



