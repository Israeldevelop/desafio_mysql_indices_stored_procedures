
USE azure_company;

-- 1. Departamento com maior quantidade de funcionários
SELECT
    d.Dname,
    COUNT(e.Ssn) AS total_funcionarios
FROM departament d
JOIN employee e
    ON e.Dno = d.Dnumber
GROUP BY d.Dnumber, d.Dname
ORDER BY total_funcionarios DESC
LIMIT 1;

-- 2. Departamentos por cidade
SELECT
    dl.Dlocation AS cidade,
    d.Dname AS departamento
FROM dept_locations dl
JOIN departament d
    ON d.Dnumber = dl.Dnumber
ORDER BY dl.Dlocation, d.Dname;

-- 3. Quantidade de funcionários por departamento,
-- incluindo departamentos sem funcionários
SELECT
    d.Dname,
    COUNT(e.Ssn) AS total_funcionarios
FROM departament d
LEFT JOIN employee e
    ON e.Dno = d.Dnumber
GROUP BY d.Dnumber, d.Dname
ORDER BY total_funcionarios DESC;

-- 4. Índices para apoiar as consultas
CREATE INDEX idx_employee_dno
    ON employee(Dno);

CREATE INDEX idx_dept_locations_location
    ON dept_locations(Dlocation);

-- 5. Conferência dos índices
SHOW INDEX FROM employee;
SHOW INDEX FROM dept_locations;

-- 6. Análise do plano de execução
EXPLAIN
SELECT *
FROM employee
WHERE Dno = 1;
