/*
Função gera um número aleatório entre os limites min e max inseridos como parâmetro
Obs: para conseguir criar funções precisamos, inicialmente, rodar o seguinte comando:
set global LOG_BIN_TRUST_FUNCTION_CREATORS=1 ;
*/
USE `vendas_sucos`;
DROP function IF EXISTS `f_numero_aleatorio`;

USE `vendas_sucos`;
DROP function IF EXISTS `vendas_sucos`.`f_numero_aleatorio`;
;

DELIMITER $$
USE `vendas_sucos`$$
CREATE DEFINER=`root`@`localhost` FUNCTION `f_numero_aleatorio`(min int, max int) RETURNS int
BEGIN
	declare vretorno int;
    -- Fórmula para transformar o número aleatório rand() que varia pelos valores entre 0 e 1 e um valor que fique entre min e max
	select floor(rand()*(max - min + 1) + min) into vretorno;
    
RETURN vretorno;
END$$

DELIMITER ;
;
