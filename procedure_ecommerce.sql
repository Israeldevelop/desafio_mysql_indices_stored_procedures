use ecommerce;

delimiter $$

create procedure manipular_cliente (
	in p_opcao int,
    IN p_idClient INT,
    IN p_Fname VARCHAR(10),
    IN p_Minit CHAR(3),
    IN p_Lname VARCHAR(20),
    IN p_CPF CHAR(11),
    IN p_Address VARCHAR(255)
)
begin 
	case p_opcao
		
        when 1 then 
			insert into clients (
				Fname, Minit, Lname, CPF, Address
            )
            values (
				p_Fname, p_Minit, p_Lname, p_CPF, p_address
            );
            
		when 2 then 
			update clients
            set Fname = p_Fname,
				Minit = p_Minit,
				Lname = p_Lname,
                CPF = p_CPF,
                Address = p_Address
			where idClient = p_idClient;
		
        when 3 then 
			delete from clients
            where idClient = p_idClient;
		
        else
			signal sqlstate '45000'
				set message_text = 'Opção inválida. Use 1, 2 ou 3.';
	end case;
end $$

delimiter ;


INSERT INTO clients (
    Fname,
    Minit,
    Lname,
    CPF,
    Address
)
VALUES
    ('Ana',      'M', 'Costa',     '11122233301', 'Rua das Acácias, 120 - Curitiba'),
    ('Bruno',    'R', 'Almeida',  '11122233302', 'Rua Paraná, 250 - Curitiba'),
    ('Camila',   'S', 'Ferreira', '11122233303', 'Avenida Brasil, 500 - São Paulo'),
    ('Daniel',   'P', 'Oliveira', '11122233304', 'Rua das Flores, 80 - Londrina'),
    ('Eduarda',  'L', 'Santos',   '11122233305', 'Rua Central, 340 - Maringá'),
    ('Felipe',   'A', 'Rodrigues','11122233306', 'Avenida Paraná, 900 - Curitiba'),
    ('Gabriela', 'C', 'Martins',  '11122233307', 'Rua do Comércio, 150 - Joinville'),
    ('Henrique', 'J', 'Lima',     '11122233308', 'Rua das Palmeiras, 70 - São Paulo'),
    ('Isabela',  'F', 'Gomes',    '11122233309', 'Rua XV de Novembro, 200 - Curitiba'),
    ('Lucas',    'B', 'Pereira',  '11122233310', 'Avenida Central, 410 - Florianópolis');


CALL manipular_cliente(
    2,
    9,
    'João',
    'J',
    'Oliveira',
    '12312312132',
    'Rua das Palmeiras, 200'
);


select * from clients;


USE ecommerce;

SHOW PROCEDURE STATUS
WHERE Db = 'ecommerce';

SHOW CREATE PROCEDURE manipular_cliente;

SELECT * FROM clients
ORDER BY idClient DESC;

SELECT *
FROM clients
WHERE CPF = '11122233310';