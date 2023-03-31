-- Seleciona um registro aleatório, no caso seleciona apenas o campo CPF 

USE `vendas_sucos`;
DROP function IF EXISTS `f_cliente_aleatorio`;

USE `vendas_sucos`;
DROP function IF EXISTS `vendas_sucos`.`f_cliente_aleatorio`;
;

DELIMITER $$
USE `vendas_sucos`$$
CREATE DEFINER=`root`@`localhost` FUNCTION `f_cliente_aleatorio`() RETURNS varchar(11) CHARSET utf16
BEGIN
	declare vretorno varchar(11);
    declare num_max_tabela int;
    declare num_aleatorio int;
    -- como achar num de linhas da tabela:
    select count(*) into num_max_tabela from clientes;
    -- usa função que escolhe um num aleatorio entre os parâmetros min e max:
    set num_aleatorio = f_numero_aleatorio(1, num_max_tabela);
    -- como o comando limit que vai ser utilizado para selecionar o registro vai sempre selecionar o registro após o primeiro 
    -- parâmetro precismos de um número entre 0 e o número de linhas -1:
    set num_aleatorio = num_aleatorio - 1;
    -- Usando o comando limit dessa forma ele mostrará apenas o registro após o num_aleatorio
    select cpf into vretorno from clientes
    limit num_aleatorio, 1;

RETURN vretorno;
END$$

DELIMITER ;
;

