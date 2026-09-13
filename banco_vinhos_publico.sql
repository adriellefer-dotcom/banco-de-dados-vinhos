CREATE TABLE mydb.Regiao (
    codRegiao BIGINT AUTO_INCREMENT PRIMARY KEY,
    nomeRegiao VARCHAR(100),
    descricaoRegiao TEXT
);

CREATE TABLE mydb.Vinicola (
    codVinicola BIGINT AUTO_INCREMENT PRIMARY KEY,
    nomeVinicola VARCHAR(100),
    descricaoVinicola TEXT,
    foneVinicola VARCHAR(15),
    emailVinicola VARCHAR(15),
    codRegiao BIGINT,
    FOREIGN KEY (codRegiao) REFERENCES mydb.Regiao(codRegiao)
);

CREATE TABLE mydb.Vinho (
    codVinho BIGINT AUTO_INCREMENT PRIMARY KEY,
    nomeVinho VARCHAR(50),
    tipoVinho VARCHAR(30),
    anoVinho INT,
    descricaoVinho TEXT,
    codVinicola BIGINT,
    FOREIGN KEY (codVinicola) REFERENCES mydb.Vinicola(codVinicola)
);


INSERT INTO mydb.Regiao (nomeRegiao, descricaoRegiao) VALUES
('Sul', 'Região Sul do Brasil'),
('Sudeste', 'Região Sudeste do Brasil'),
('Nordeste', 'Região Nordeste do Brasil'),
('Centro-Oeste', 'Região Centro-Oeste do Brasil'),
('Norte', 'Região Norte do Brasil');

INSERT INTO mydb.Vinicola (nomeVinicola, descricaoVinicola, foneVinicola, emailVinicola, codRegiao) VALUES
('Vinicola A', 'Produção artesanal', '111111111111111', 'a@vin.com', 1),
('Vinicola B', 'Vinhos finos', '222222222222222', 'b@vin.com', 2),
('Vinicola C', 'Produção familiar', '333333333333333', 'c@vin.com', 3),
('Vinicola D', 'Alta qualidade', '444444444444444', 'd@vin.com', 4),
('Vinicola E', 'Exportação', '555555555555555', 'e@vin.com', 5);

INSERT INTO mydb.Vinho (nomeVinho, tipoVinho, anoVinho, descricaoVinho, codVinicola) VALUES
('Vinho A', 'Tinto', 2018, 'Vinho encorpado', 1),
('Vinho B', 'Branco', 2019, 'Vinho leve', 2),
('Vinho C', 'Rosé', 2020, 'Vinho suave', 3),
('Vinho D', 'Tinto', 2021, 'Vinho seco', 4),
('Vinho E', 'Branco', 2022, 'Vinho frutado', 5);


-- Usei o JOIN para relacionar dados de tabelas diferentes através das chaves estrangeiras.
SELECT 
    V.nomeVinho,
    V.anoVinho,
    VI.nomeVinicola,
    R.nomeRegiao
FROM mydb.Vinho V
JOIN mydb.Vinicola VI ON V.codVinicola = VI.codVinicola
JOIN mydb.Regiao R ON VI.codRegiao = R.codRegiao;

-- Credencial removida da versão pública.
-- Para executar localmente, substitua 'SUA_SENHA_LOCAL' por uma senha definida no seu ambiente.
CREATE USER 'sommelier'@'localhost' IDENTIFIED BY 'SUA_SENHA_LOCAL';

GRANT SELECT ON mydb.Vinho TO 'sommelier'@'localhost';

GRANT SELECT (codVinicola, nomeVinicola)
ON mydb.Vinicola
TO 'sommelier'@'localhost';

ALTER USER 'sommelier'@'localhost'
WITH MAX_QUERIES_PER_HOUR 40;

-- Consulta para verificação dos dados
SELECT * FROM mydb.Regiao;
SELECT * FROM mydb.Vinicola;
SELECT * FROM mydb.Vinho;
