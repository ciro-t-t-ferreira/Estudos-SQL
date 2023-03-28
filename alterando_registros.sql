-- ALTERALDO REGISTRO: 
-- update <tabela a ser alterada>
-- set <nome_coluna> = <novo_valor> [OBS:novo valor pode ser dado por expressão matemática, ex: set <nome_coluna> = 3 * <nome_coluna>]
-- where [oferece a condição para identificar o(s) registro(s) a ser alterado, ex: <nome_coluna> = <valor>. Se não colocar WHERE todos os registros são alterados]

UPDATE clientes
SET ENDERECO = 'R. Jorge Emilio 23',
BAIRRO = 'Santo Amaro',
CIDADE = 'São Paulo',
ESTADO = 'SP',
CEP = '8833223'
WHERE CPF = '19290992743';

-- Exemplo de Update utilizando uma tabela mais complexa (construída a partir de um join)

UPDATE clientes A INNER JOIN VENDEDORES B
ON A.BAIRRO = B.BAIRRO
SET A.VOLUME_COMPRA = A.VOLUME_COMPRA * 1.30;

-- Exemplo de update com o o filtro "where":

UPDATE tbproduto SET SABOR = 'Cítricos' WHERE SABOR = 'Limão';
