-- ###########################################################################
-- Conteúdos:
-- Criar base de dados, criar tabelas com colunas e tipos de dados das colunas
-- Alterar nome de tabelas e colunas
-- Estabelecer primary key e foreign key
-- ###########################################################################

-- Cria base de dados:
-- if not exists (opcional): adiciona-se isso no caso de não saber se a base de dados já existe, se ela já existir o comando não fará nada
-- default character set (opcional): estabelece um tipo padrão de caracter para os campos da base de dados (utf8 inclui caracteres latinos como 'ç', 'ã', 'á' etc) 

CREATE DATABASE IF NOT exists vendas_sucos DEFAULT CHARACTER SET utf16;

-- APAGAR BASE DE DADOS:
-- if exists (opcional): análogo ao if not exists

DROP DATABASE IF EXISTS vendas_sucos2;

-- CRIANDO TABELA:
-- Para fixar a base dados: use <nome_base>;
-- Para criar a tabela: create table <nome_tabela> (<nome_coluna1> <tipo1(tamanho)> <null ou not null>, [...], primary key (<nome_coluna>));
-- Conceito: Primary key é a coluna cujo campo tem que ser distinto em todos os registros, serve para diferenciar o registro (ex: CPF, se você quer diferenciar pessoas)

use vendas_sucos;

CREATE TABLE PRODUTOS
(CODIGO VARCHAR(10) NOT NULL,
DESCRITOR VARCHAR(100) NULL,
SABOR VARCHAR(50) NULL,
TAMANHO VARCHAR(50) NULL,
EMBALAGEM VARCHAR(50) NULL,
PRECO_LISTA FLOAT NULL,
PRIMARY KEY (CODIGO));

-- Tipo: VARCHAR é string de tamanho variável, CHAR é string com tamanho fixo (preenche os campos extras com espaços), o número diz o tamanho disponível pra string

CREATE TABLE VENDEDORES
(MATRICULA VARCHAR(5) NOT NULL,
NOME VARCHAR(100) NULL,
BAIRRO VARCHAR(50) NULL,
COMISSAO FLOAT NULL,
DATA_ADIMISSAO DATE NULL,
FERIAS BIT(1) NULL,
PRIMARY KEY (MATRICULA));

-- Tipo: BIT pode assumir os valores 0, 1 e Null. Bom para guardar valores de verdadeiro ou falso.

-- ALTERANDO NOME DA COLUNA: alter table <nome_tabela> rename column <nome_atual> to <novo_nome>;

ALTER TABLE VENDEDORES RENAME COLUMN DATA_ADIMISSAO TO DATA_ADMISSAO;

-- ALTERANDO NOME DA TABELA: alter table <nome_atual_tabela> rename <novo_nome_tabela>;

ALTER TABLE TABELA_DE_VENDAS RENAME Notas;

-- INSERINDO CHAVE PRIMÁRIA (PK):

ALTER TABLE tbproduto ADD PRIMARY KEY (PRODUTO); -- nesse caso a coluna PRODUTO da tabela tb produto se tornará PK

-- CONCEITO FOREIGN KEY: ligação entre duas tabelas estabelecendo o campo de cada uma delas pelos quais elas serão ligadas
-- Fazendo Foreign Key: alter table <tabela_mae> add constraint <FK_nome_foreign_key> foreign key <coluna_tabela_mae> references <tabela_filha> (<coluna_tabela_filha>);

ALTER TABLE TABELA_DE_VENDAS ADD CONSTRAINT FK_CLIENTES
FOREIGN KEY (CPF) REFERENCES CLIENTES (CPF);


