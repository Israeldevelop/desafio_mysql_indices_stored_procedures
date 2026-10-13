
USE mydb;

DROP PROCEDURE IF EXISTS manipular_pessoa;

DELIMITER $$

CREATE PROCEDURE manipular_pessoa (
    IN p_opcao INT,
    IN p_idPessoa INT,
    IN p_Nome VARCHAR(45),
    IN p_cpf VARCHAR(45),
    IN p_endereco VARCHAR(45)
)
BEGIN
    CASE p_opcao

        WHEN 1 THEN
            INSERT INTO Pessoa (
                idPessoa, Nome, cpf, `endereço`
            )
            VALUES (
                p_idPessoa, p_Nome, p_cpf, p_endereco
            );

        WHEN 2 THEN
            UPDATE Pessoa
            SET Nome = p_Nome,
                cpf = p_cpf,
                `endereço` = p_endereco
            WHERE idPessoa = p_idPessoa;

        WHEN 3 THEN
            DELETE FROM Pessoa
            WHERE idPessoa = p_idPessoa;

        ELSE
            SIGNAL SQLSTATE '45000'
                SET MESSAGE_TEXT = 'Opção inválida. Use 1, 2 ou 3.';
    END CASE;
END $$

DELIMITER ;


CALL manipular_pessoa(
    1,
    7,
    'Gabriel Souza',
    'CPF-TESTE-007',
    'Rua das Palmeiras, 700'
);

CALL manipular_pessoa(
    3,
    7,
    NULL,
    NULL,
    NULL
);

SELECT * FROM Pessoa;

select * from pessoa;

DROP PROCEDURE IF EXISTS manipular_departamento;

DELIMITER $$

CREATE PROCEDURE manipular_departamento(
    IN p_opcao INT,
    IN p_idDepartamento INT,
    IN p_Nome VARCHAR(45),
    IN p_Campus VARCHAR(45),
    IN p_idProfessor_coordenador INT
)
BEGIN
    CASE p_opcao

        WHEN 1 THEN
            INSERT INTO Departamento (
                idDepartamento,
                Nome,
                Campus,
                idProfessor_coordenador
            )
            VALUES (
                p_idDepartamento,
                p_Nome,
                p_Campus,
                p_idProfessor_coordenador
            );

        WHEN 2 THEN
            UPDATE Departamento
            SET Nome = p_Nome,
                Campus = p_Campus,
                idProfessor_coordenador = p_idProfessor_coordenador
            WHERE idDepartamento = p_idDepartamento;

        WHEN 3 THEN
            DELETE FROM Departamento
            WHERE idDepartamento = p_idDepartamento;

        ELSE
            SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT = 'Opcao invalida. Use 1, 2 ou 3.';

    END CASE;
END $$

DELIMITER ;

CALL manipular_departamento(
    1,
    2,
    'Matematica',
    'Jardim paulista',
    '1');

CALL manipular_departamento(
    2,
    2,
    'Matematica',
    'Curitiba',
    1
);

CALL manipular_departamento(
    3,
    2,
    NULL,
    NULL,
    NULL
);

select * from departamento;