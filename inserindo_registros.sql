-- INSERINDO REGISTROS(1):
-- insert into <nome_tabela> (escreva separado por vírgula os nome dos campos, se não escrever nada o SQL supõe as colunas na sequência registradas 
-- values (insere os valores das colunas na sequência escrita acima, no caso de data o formato é 'yyyy-mm-dd', também pode colocar sem hífen)
-- obs: para inserir vários registros coloque vários parênteses após values separados por vírgula.

insert into CLIENTES
values ('19290992743', 'Fernando Cavalcante', 'R. Dois de Fevereiro', 'Água Santa', 'Rio de Janeiro', 'RJ', '22000000', '2000-02-12', 18, 'M',100000,20000,1),
       ('2600586709','César Teixeira', 'Rua Conde de Bonfim', 'Tijuca', 'Rio de Janeiro', 'RJ', '22020001', '2000-03-12', 18, 'M', 120000, '22000',0);

-- INSERINDO REGISTROS(2): a partir de consultas, o que permite inserir inserir registros de outra tabela (até mesmo se ela estiver em outro banco de dados)
-- select: insira o nome das colunas das tabelas origem com alias correspondente aos nomes da tabela destino
-- from: se a tabela estiver em outro banco de dados insira <nome_schema>.<nome_tabela>
-- where: esse último passo garante que não serão inseridos registros repetidos, WHERE <nome_coluna_tabela_origem> NOT IN (SELECT <coluna_destino> FROM <tabela_destino>)

INSERT INTO clientes
(CPF,NOME,ENDERECO,BAIRRO,CIDADE,ESTADO,CEP,DATA_NASCIMENTO,IDADE,SEXO,LIMITE_CREDITO,VOLUME_COMPRA,PRIMEIRA_COMPRA)

SELECT CPF, NOME, ENDERECO_1 AS ENDERECO, BAIRRO, CIDADE, ESTADO, CEP,DATA_DE_NASCIMENTO AS  DATA_NASCIMENTO, IDADE, SEXO,LIMITE_DE_CREDITO AS LIMITE_CREDITO, VOLUME_DE_COMPRA AS VOLUME_COMPRA,PRIMEIRA_COMPRA 
 FROM sucos_vendas.tabela_de_clientes 
 WHERE CPF NOT IN (SELECT CPF FROM clientes);
 
-- DELETAR REGISTRO:
-- delete from <nome_tabela> where <escreve a condição, se escrevo coluna1 = 'valor1' serão excluídos todos os registros onde isso for verdadeito>

DELETE FROM tbproduto WHERE PRODUTO = '1078680';
 
 
