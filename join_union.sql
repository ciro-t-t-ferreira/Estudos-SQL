	-- JOIN: permite, em uma consulta, visualizar colunas de mais de uma tabela, "uma ao lado da outra" (em contraste com UNION, ver abaixo)
-- Posso dar um "rótulo" pra tabela para facilitar o processo. No exemplo a tabela_de-vendedores recebe o rótulo 'A'. Assim para me referir a uma coluna desta 
-- tabela posso escreve A.<nome_coluna>
-- ON: indica qual coluna de cada tabela vai ser utilizada para conectar ambas as tabelas
-- INNER JOIN: serão mostrados apenas os valores que que aparecerem em ambas as tabelas, existem outras formas de JOIN (right, left, full e cross), procurar alter
-- imagem ilustrativa. 
SELECT * FROM tabela_de_vendedores A
INNER JOIN notas_fiscais B
ON A.MATRICULA = B.MATRICULA;

-- FULL JOIN: não é suportado pelo MySQL, tem que fazer a seguinte gambiarra:

SELECT tabela_de_vendedores.BAIRRO,
tabela_de_vendedores.NOME, DE_FERIAS,
tabela_de_clientes.BAIRRO,
tabela_de_clientes.NOME  FROM tabela_de_vendedores LEFT JOIN tabela_de_clientes
ON tabela_de_vendedores.BAIRRO = tabela_de_clientes.BAIRRO
UNION
SELECT tabela_de_vendedores.BAIRRO,
tabela_de_vendedores.NOME, DE_FERIAS,
tabela_de_clientes.BAIRRO,
tabela_de_clientes.NOME  FROM tabela_de_vendedores RIGHT JOIN tabela_de_clientes
ON tabela_de_vendedores.BAIRRO = tabela_de_clientes.BAIRRO;

	-- UNION: a consulta vai juntar os registros da segunda tabela abaixo dos registros da primeira. Se usado o UNION só serão mostrados os resultados da segunda
    -- tabela que não aparecem na primeira, se for utilizado UNION ALL mostra-se todos os resultados.
    
SELECT DISTINCT BAIRRO FROM tabela_de_clientes
UNION
SELECT DISTINCT BAIRRO FROM tabela_de_vendedores;