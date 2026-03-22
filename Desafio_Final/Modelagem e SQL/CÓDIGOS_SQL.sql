CRIANDO SCHEMA

CREATE SCHEMA desafio_final;

-------------


CRIAÇÃO TABELAS E INSERÇÃO DE VALORES

CREATE TABLE CLIENTE(
	cliente_id INT PRIMARY KEY auto_increment,
    nome VARCHAR(100) NOT NULL,
	cpf VARCHAR(100) NOT NULL UNIQUE,
    telefone VARCHAR(100) NOT NULL,
    endereco VARCHAR(100) NOT NULL,
    e_mail VARCHAR(100) NOT NULL,
    data_cadastro DATETIME NOT NULL,
    nacionalidade VARCHAR(100) NOT NULL
   
);

CREATE TABLE FUNCIONARIO(
	funcionario_id INT PRIMARY KEY auto_increment,
    nome VARCHAR(100) NOT NULL,
    cpf VARCHAR(100) NOT NULL UNIQUE,
    endereco VARCHAR(100) NOT NULL,
    telefone VARCHAR(100) NOT NULL,
    e_mail VARCHAR(100) NOT NULL,
    data_cadastro DATETIME NOT NULL,
    data_saida DATETIME
   
);

CREATE TABLE VEICULO(
	placa VARCHAR(50) PRIMARY KEY NOT NULL,
    modelo VARCHAR(100) NOT NULL,
    cor VARCHAR(100) NOT NULL,
    ano_fabricacao INT(50) NOT NULL,
    marca VARCHAR(100) NOT NULL,
    valor_diaria DECIMAL(10,2) NOT NULL,
    status VARCHAR(100) NOT NULL,
    FIPE DECIMAL(10,2) NOT NULL
);

CREATE TABLE ALUGUEL(
	aluguel_id INT PRIMARY KEY NOT NULL auto_increment,
    cliente_id INT(50) NOT NULL,
    funcionario_id INT(50) NOT NULL,
	veiculo_placa VARCHAR(50) NOT NULL,
    data_inicio DATETIME NOT NULL,
    data_fim DATETIME,
    valor_total DECIMAL(10,2) NOT NULL,
    status_aluguel VARCHAR(30) NOT NULL,
    
    FOREIGN KEY (cliente_id) REFERENCES cliente(cliente_id),
    FOREIGN KEY (funcionario_id) REFERENCES funcionario(funcionario_id),
    FOREIGN KEY (veiculo_placa) REFERENCES veiculo(placa)
);

CREATE TABLE PAGAMENTO(
	pagamento_id INT PRIMARY KEY auto_increment,
    valor DECIMAL(10,2) NOT NULL,
    data_pagamento DATE,
    metodo VARCHAR(50) NOT NULL,
    status VARCHAR(30) NOT NULL,
    aluguel_id INT NOT NULL,
    data_vencimento DATE NOT NULL,
    juros_multa DECIMAL(10,2) DEFAULT 0,
    
    FOREIGN KEY (aluguel_id) REFERENCES aluguel(aluguel_id)
);

CREATE TABLE MANUTENCAO(
	id_manutencao INT PRIMARY KEY auto_increment NOT NULL,
    veiculo_placa VARCHAR(50) NOT NULL,
    descricao_servico TEXT NOT NULL,
    custo DECIMAL(10,2) NOT NULL,
    data_manutenção datetime NOT NULL,
    responsavel VARCHAR(100) NOT NULL,
    
    FOREIGN KEY (veiculo_placa) REFERENCES veiculo(placa)
);



INSERT INTO cliente (nome, cpf, telefone, endereco, e_mail, data_cadastro, nacionalidade) VALUES
('João Pedro Alves','12345678901','83987654321','Rua das Acácias, 120','joao.alves@gmail.com',NOW(),'Brasileiro'),
('Maria Fernanda Souza','23456789012','83981234567','Av. Epitácio Pessoa, 450','maria.fsouza@gmail.com',NOW(),'Brasileira'),
('Carlos Henrique Lima','34567890123','83999887766','Rua João Pessoa, 88','carlos.lima@gmail.com',NOW(),'Brasileiro'),
('Ana Clara Martins','45678901234','83991234567','Rua das Flores, 230','ana.martins@gmail.com',NOW(),'Brasileira'),
('Pedro Lucas Santos','56789012345','83993456789','Av. Beira Rio, 900','pedro.santos@gmail.com',NOW(),'Brasileiro'),
('Juliana Ribeiro Costa','67890123456','83995678901','Rua São Pedro, 300','juliana.costa@gmail.com',NOW(),'Brasileira'),
('Rafael Gomes Pereira','78901234567','83997890123','Rua das Palmeiras, 150','rafael.gomes@gmail.com',NOW(),'Brasileiro'),
('Camila Fernandes Rocha','89012345678','83998901234','Av. Cabo Branco, 720','camila.rocha@gmail.com',NOW(),'Brasileira'),
('Bruno Carvalho Nunes','90123456789','83999112233','Rua do Sol, 500','bruno.nunes@gmail.com',NOW(),'Brasileiro'),
('Larissa Almeida Melo','11223344556','83992233445','Rua da Areia, 60','larissa.melo@gmail.com',NOW(),'Brasileira'),
('Fernando Batista','22334455667','83993344556','Rua das Laranjeiras, 77','fernando.b@gmail.com',NOW(),'Brasileiro'),
('Patrícia Lopes','33445566778','83994455667','Av. Central, 140','patricia.lopes@gmail.com',NOW(),'Brasileira'),
('Ricardo Tavares','44556677889','83995566778','Rua Nova, 300','ricardo.t@gmail.com',NOW(),'Brasileiro'),
('Aline Barros','55667788990','83996677889','Rua do Comércio, 410','aline.barros@gmail.com',NOW(),'Brasileira'),
('Diego Freitas','66778899001','83997788990','Rua das Mangueiras, 520','diego.freitas@gmail.com',NOW(),'Brasileiro');

INSERT INTO funcionario (nome, cpf, endereco, telefone, e_mail, data_cadastro) VALUES
('Marcos Oliveira','11122233344','Rua A, 10','83990001111','marcos@empresa.com',NOW()),
('Luciana Silva','22233344455','Rua B, 20','83990002222','luciana@empresa.com',NOW()),
('André Costa','33344455566','Rua C, 30','83990003333','andre@empresa.com',NOW()),
('Fernanda Souza','44455566677','Rua D, 40','83990004444','fernanda@empresa.com',NOW()),
('Gustavo Lima','55566677788','Rua E, 50','83990005555','gustavo@empresa.com',NOW()),
('Paula Mendes','66677788899','Rua F, 60','83990006666','paula@empresa.com',NOW()),
('Rodrigo Alves','77788899900','Rua G, 70','83990007777','rodrigo@empresa.com',NOW()),
('Tatiane Rocha','88899900011','Rua H, 80','83990008888','tatiane@empresa.com',NOW()),
('Lucas Ferreira','99900011122','Rua I, 90','83990009999','lucas@empresa.com',NOW()),
('Vanessa Martins','10111213141','Rua J, 100','83991110000','vanessa@empresa.com',NOW()),
('Eduardo Nunes','12131415161','Rua K, 110','83992220000','eduardo@empresa.com',NOW()),
('Beatriz Costa','13141516171','Rua L, 120','83993330000','beatriz@empresa.com',NOW()),
('Felipe Rocha','14151617181','Rua M, 130','83994440000','felipe@empresa.com',NOW()),
('Carla Dias','15161718191','Rua N, 140','83995550000','carla@empresa.com',NOW()),
('Thiago Ribeiro','16171819201','Rua O, 150','83996660000','thiago@empresa.com',NOW());


INSERT INTO veiculo (placa, modelo, cor, ano_fabricação, marca, valor_diaria, status, FIPE) VALUES
('QWE1A23','Onix','Prata',2020,'Chevrolet',120.00,'disponivel',45000.00),
('RTY2B34','HB20','Branco',2021,'Hyundai',130.00,'disponivel',48000.00),
('UIO3C45','Gol','Preto',2019,'Volkswagen',100.00,'manutencao',30000.00),
('PAS4D56','Corolla','Cinza',2022,'Toyota',220.00,'disponivel',95000.00),
('DFG5E67','Civic','Preto',2021,'Honda',210.00,'disponivel',90000.00),
('GHJ6F78','Argo','Vermelho',2020,'Fiat',110.00,'disponivel',42000.00),
('JKL7G89','Kwid','Branco',2019,'Renault',90.00,'disponivel',35000.00),
('ZXC8H90','Tracker','Azul',2022,'Chevrolet',180.00,'disponivel',85000.00),
('VBN9I01','Compass','Preto',2023,'Jeep',250.00,'disponivel',120000.00),
('MNB0J12','Sandero','Prata',2018,'Renault',85.00,'manutencao',28000.00),
('LKJ1K23','Uno','Branco',2017,'Fiat',70.00,'disponivel',20000.00),
('HGF2L34','Cruze','Preto',2020,'Chevrolet',160.00,'disponivel',75000.00),
('TRE3M45','HR-V','Cinza',2021,'Honda',200.00,'disponivel',98000.00),
('YUI4N56','T-Cross','Branco',2022,'Volkswagen',190.00,'disponivel',92000.00),
('OPQ5O67','Spin','Prata',2019,'Chevrolet',140.00,'disponivel',60000.00);



INSERT INTO aluguel (cliente_id, funcionario_id, veiculo_placa, data_inicio, data_fim, valor_total, status_aluguel) VALUES
(1,1,'QWE1A23','2025-03-01 10:00:00','2025-03-03 10:00:00',240.00,'finalizado'),
(2,2,'RTY2B34','2025-03-05 09:00:00',NULL,130.00,'ativo'),
(3,3,'PAS4D56','2025-03-02 14:00:00','2025-03-04 14:00:00',440.00,'finalizado'),
(4,4,'DFG5E67','2025-03-06 08:00:00',NULL,210.00,'ativo'),
(5,5,'GHJ6F78','2025-03-01 12:00:00','2025-03-02 12:00:00',110.00,'finalizado'),
(6,6,'JKL7G89','2025-03-07 10:00:00',NULL,90.00,'ativo'),
(7,7,'ZXC8H90','2025-03-03 15:00:00','2025-03-05 15:00:00',360.00,'finalizado'),
(8,8,'VBN9I01','2025-03-08 09:00:00',NULL,250.00,'ativo'),
(9,9,'LKJ1K23','2025-03-02 11:00:00','2025-03-03 11:00:00',70.00,'finalizado'),
(10,10,'HGF2L34','2025-03-09 10:00:00',NULL,160.00,'ativo'),
(11,11,'TRE3M45','2025-03-01 13:00:00','2025-03-04 13:00:00',600.00,'finalizado'),
(12,12,'YUI4N56','2025-03-10 09:00:00',NULL,190.00,'ativo'),
(13,13,'OPQ5O67','2025-03-03 16:00:00','2025-03-05 16:00:00',280.00,'finalizado'),
(14,14,'QWE1A23','2025-03-11 08:00:00',NULL,120.00,'ativo'),
(15,15,'RTY2B34','2025-03-04 10:00:00','2025-03-06 10:00:00',260.00,'finalizado');


INSERT INTO pagamento (valor, data_pagamento, metodo, status, aluguel_id, data_vencimento, juros_multa) VALUES
(240.00,'2025-03-03','cartao','pago',16,'2025-03-03',0),
(130.00,NULL,'pix','pendente',17,'2025-03-10',0),
(440.00,'2025-03-04','cartao','pago',18,'2025-03-04',0),
(210.00,NULL,'pix','pendente',19,'2025-03-12',0),
(110.00,'2025-03-02','dinheiro','pago',20,'2025-03-02',0),
(90.00,NULL,'pix','pendente',21,'2025-03-13',0),
(360.00,'2025-03-05','cartao','pago',22,'2025-03-05',5.00),
(250.00,NULL,'pix','pendente',23,'2025-03-15',0),
(70.00,'2025-03-03','dinheiro','pago',24,'2025-03-03',0),
(160.00,NULL,'pix','pendente',25,'2025-03-16',0),
(600.00,'2025-03-04','cartao','pago',26,'2025-03-04',0),
(190.00,NULL,'pix','pendente',27,'2025-03-17',0),
(280.00,'2025-03-05','cartao','pago',28,'2025-03-05',0),
(120.00,NULL,'pix','pendente',29,'2025-03-18',0),
(260.00,'2025-03-06','dinheiro','pago',30,'2025-03-06',0);





INSERT INTO manutencao (veiculo_placa, descricao_servico, custo, data_manutenção, responsavel) VALUES
('UIO3C45','Troca de óleo',150.00,'2025-03-01 10:00:00','Auto Center João'),
('MNB0J12','Revisão geral',300.00,'2025-03-02 11:00:00','Oficina Silva'),
('QWE1A23','Alinhamento',120.00,'2025-03-03 09:00:00','Mecânica Central'),
('RTY2B34','Freios',200.00,'2025-03-04 14:00:00','Auto Freios Ltda'),
('PAS4D56','Pintura',600.00,'2025-03-05 15:00:00','Pintura Express'),
('DFG5E67','Suspensão',400.00,'2025-03-06 13:00:00','Suspensão Pro'),
('GHJ6F78','Troca de pneus',500.00,'2025-03-07 08:00:00','PneuCar'),
('JKL7G89','Bateria',250.00,'2025-03-08 10:00:00','Baterias Brasil'),
('ZXC8H90','Ar condicionado',350.00,'2025-03-09 11:00:00','Clima Auto'),
('VBN9I01','Motor',1200.00,'2025-03-10 16:00:00','Motores Premium'),
('LKJ1K23','Correia',180.00,'2025-03-11 09:00:00','Correias Tech'),
('HGF2L34','Radiador',270.00,'2025-03-12 10:00:00','Radiadores BR'),
('TRE3M45','Embreagem',700.00,'2025-03-13 14:00:00','Embreagem Forte'),
('YUI4N56','Filtro',120.00,'2025-03-14 15:00:00','Filtros Auto'),
('OPQ5O67','Velas',90.00,'2025-03-15 08:00:00','Velas Car');


SET SQL_SAFE_UPDATES = 0;

UPDATE veiculo
SET valor_diaria = valor_diaria * 1.10
WHERE marca IN ('Honda', 'Toyota');


UPDATE veiculo
SET valor_diaria = valor_diaria * 1.05
WHERE marca IN ('Volkswagen');

----------------------

DQL

CLIENTE

SELECT NOME FROM CLIENTE
WHERE NACIONALIDADE IN ("Brasileiro", "Brasileira")

SELECT COUNT(*) FROM CLIENTE
WHERE NACIONALIDADE IN ("Brasileiro", "Brasileira")

FUNCIONARIO

SELECT 
  DATE_FORMAT(data_cadastro, '%Y-%m') AS mes,
  COUNT(*) AS contratacoes
FROM FUNCIONARIO
GROUP BY mes
ORDER BY mes;

SELECT 
  DATE_FORMAT(data_saida, '%Y-%m') AS mes,
  COUNT(*) AS desligamentos
FROM FUNCIONARIO
WHERE data_saida IS NOT NULL
GROUP BY mes
ORDER BY mes;

ALUGUEL

SELECT COUNT(*)
FROM ALUGUEL
WHERE status_aluguel = "finalizado";

SELECT sum(valor_total)
FROM ALUGUEL

VEICULO

SELECT avg(valor_diaria)
FROM VEICULO

SELECT * FROM VEICULO
WHERE FIPE > 100000;

PAGAMENTO

SELECT metodo, COUNT(*)
FROM PAGAMENTO
GROUP BY metodo;

SELECT status_aluguel, marca, modelo, valor_total
FROM PAGAMENTO
JOIN ALUGUEL
ON aluguel.aluguel_id = pagamento.aluguel_id
JOIN VEICULO
ON veiculo.placa = aluguel.veiculo_placa


MANUTENÇÃO

SELECT veiculo_placa, marca FROM MANUTENCAO
JOIN VEICULO
ON VEICULO.placa = MANUTENCAO.veiculo_placa
where custo > 500;

SELECT SUM(custo)
FROM MANUTENCAO


-------------------

JOINS

SELECT 
  v.placa,
  v.modelo,
  SUM(a.valor_total) AS receita_total,
  SUM(m.custo) AS custo_manutencao
FROM VEICULO v
LEFT JOIN ALUGUEL a 
  ON v.placa = a.veiculo_placa
LEFT JOIN MANUTENCAO m 
  ON v.placa = m.veiculo_placa
GROUP BY v.placa, v.modelo
ORDER BY receita_total DESC;

SELECT 
  c.nome,
  SUM(p.valor) AS receita_total
FROM CLIENTE c
JOIN ALUGUEL a 
  ON c.cliente_id = a.cliente_id
JOIN PAGAMENTO p 
  ON a.aluguel_id = p.aluguel_id
WHERE p.status = 'pago'
GROUP BY c.nome
ORDER BY receita_total DESC;

SELECT 
  c.nome,
  COUNT(p.pagamento_id) AS total_pendencias,
  SUM(p.valor + p.juros_multa) AS valor_devido
FROM CLIENTE c
JOIN ALUGUEL a 
  ON c.cliente_id = a.cliente_id
JOIN PAGAMENTO p 
  ON a.aluguel_id = p.aluguel_id
WHERE p.status = 'pendente'
GROUP BY c.nome
ORDER BY valor_devido DESC;
