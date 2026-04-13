-- Migration: Criar tabela usuarios
-- Data: 2025-11-11
-- Descrição: Tabela para os usuários do sistema

-- RELATÓRIO:		(Por favor, anote as alterações que fizer)
-- 	2025-11-11
-- 		Giovanne : Criação das tabelas e inserts
-- 2025-11-14
--  	Gabriel  : Adição de id_equipe para identificação de área
-- 2025-11-22
-- 		Giovanne : Alterando o atributo id_equipe para uma FK
-- 2025-11-25
--      Arthur   : Adição de telefone para modal cardTimes



USE CONTROLE_TREINAMENTOS;

-- Criando a tebela de usuarios
CREATE TABLE if not exists usuarios (
	id					INT PRIMARY KEY AUTO_INCREMENT,
    nome				VARCHAR(255) NOT NULL,
    email				VARCHAR(255) UNIQUE NOT NULL,
    senha				VARCHAR(255) NOT NULL,
    telefone            VARCHAR(255) UNIQUE NOT NULL,
    bio					VARCHAR(200) NOT NULL DEFAULT '',
    tipo				ENUM('admin', 'ft', 'mt') NOT NULL DEFAULT 'mt',
    data_criacao		DATETIME DEFAULT CURRENT_TIMESTAMP,
    data_atualizacao	DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    id_equipe			INT,
    
    FOREIGN KEY (id_equipe) REFERENCES equipes(id) ON DELETE SET NULL
);

-- Usuarios de teste (a senha é 123456)
INSERT INTO usuarios (nome, email, senha, telefone, tipo, id_equipe) VALUES
-- Administrador
('Administrador', 'admin@produtos.com', '$2a$10$BLAcJu1irAzg06WbtoLoPe0RA.hkfZ0oJ25KYARPkHWRweJuWBALy', '(11) 91234-5678', 'admin', 0),
-- Membros de TDO - FERRAMENTARIA
('João Pedro Silva', 'joao@email.com', '$2a$10$BLAcJu1irAzg06WbtoLoPe0RA.hkfZ0oJ25KYARPkHWRweJuWBALy', '(21) 99876-5432', 'ft', 1),
('Maria Eduarda Oliveira', 'maria@email.com', '$2a$10$BLAcJu1irAzg06WbtoLoPe0RA.hkfZ0oJ25KYARPkHWRweJuWBALy', '(31) 98765-4321', 'ft', 1),
('Ana Carolina Souza', 'ana@email.com', '$2a$10$BLAcJu1irAzg06WbtoLoPe0RA.hkfZ0oJ25KYARPkHWRweJuWBALy', '(41) 95555-1122', 'mt', 1),
('Pedro Henrique Santos', 'pedro@email.com', '$2a$10$BLAcJu1irAzg06WbtoLoPe0RA.hkfZ0oJ25KYARPkHWRweJuWBALy', '(51) 97777-2244', 'mt', 1),
('Júlia Fernanda Costa', 'julia@email.com', '$2a$10$BLAcJu1irAzg06WbtoLoPe0RA.hkfZ0oJ25KYARPkHWRweJuWBALy', '(61) 98888-3366', 'mt', 1),
-- Membros de PINTURA
('Lucas Gabriel Almeida', 'lucas@email.com', '$2a$10$BLAcJu1irAzg06WbtoLoPe0RA.hkfZ0oJ25KYARPkHWRweJuWBALy', '(71) 93456-7890', 'ft', 2),
('Beatriz Cristina Rocha', 'beatriz@email.com', '$2a$10$BLAcJu1irAzg06WbtoLoPe0RA.hkfZ0oJ25KYARPkHWRweJuWBALy', '(81) 96666-7788', 'mt', 2),
('Gabriel Augusto Fernandes', 'gabriel@email.com', '$2a$10$BLAcJu1irAzg06WbtoLoPe0RA.hkfZ0oJ25KYARPkHWRweJuWBALy', '(91) 94567-1234', 'mt', 2),
('Camila Beatriz Ribeiro', 'camila@email.com', '$2a$10$BLAcJu1irAzg06WbtoLoPe0RA.hkfZ0oJ25KYARPkHWRweJuWBALy', '(85) 98989-4545', 'mt', 2),
('Rafael Antônio Carvalho', 'rafael@email.com', '$2a$10$BLAcJu1irAzg06WbtoLoPe0RA.hkfZ0oJ25KYARPkHWRweJuWBALy', '(11) 93412-8801', 'mt', 2),
('Mariana Luiza Martins', 'mariana@email.com', '$2a$10$BLAcJu1irAzg06WbtoLoPe0RA.hkfZ0oJ25KYARPkHWRweJuWBALy', '(12) 99741-6620', 'mt', 2),
('Felipe José Azevedo', 'felipe@email.com', '$2a$10$BLAcJu1irAzg06WbtoLoPe0RA.hkfZ0oJ25KYARPkHWRweJuWBALy', '(13) 98853-1947', 'mt', 2),
-- GA - Gestão de Almoxarifado/Geral
('Larissa Helena Correia', 'larissa@email.com', '$2a$10$BLAcJu1irAzg06WbtoLoPe0RA.hkfZ0oJ25KYARPkHWRweJuWBALy', '(14) 95672-3308', 'ft', 3),
('André Luiz Teixeira', 'andre@email.com', '$2a$10$BLAcJu1irAzg06WbtoLoPe0RA.hkfZ0oJ25KYARPkHWRweJuWBALy', '(15) 97944-5126', 'ft', 3),
('Carolina Mendes Duarte', 'Carolina@email.com', '$2a$10$BLAcJu1irAzg06WbtoLoPe0RA.hkfZ0oJ25KYARPkHWRweJuWBALy', '(16) 98127-7490', 'mt', 3),
('Bruno César Moreira', 'bruno@email.com', '$2a$10$BLAcJu1irAzg06WbtoLoPe0RA.hkfZ0oJ25KYARPkHWRweJuWBALy', '(17) 99563-2084', 'mt', 3),
('Daniela Aparecida Pires', 'daniela@email.com', '$2a$10$BLAcJu1irAzg06WbtoLoPe0RA.hkfZ0oJ25KYARPkHWRweJuWBALy', '(18) 98720-4419', 'mt', 3),
('Rodrigo Alexandre Nogueira', 'rodrigo@email.com', '$2a$10$BLAcJu1irAzg06WbtoLoPe0RA.hkfZ0oJ25KYARPkHWRweJuWBALy', '(19) 96455-7002', 'mt', 3),
('Fernanda Maria Castro', 'fernanda@email.com', '$2a$10$BLAcJu1irAzg06WbtoLoPe0RA.hkfZ0oJ25KYARPkHWRweJuWBALy', '(21) 99183-5593', 'mt', 3),
-- Manutenção central
('Thiago Henrique Barros', 'thiago@email.com', '$2a$10$BLAcJu1irAzg06WbtoLoPe0RA.hkfZ0oJ25KYARPkHWRweJuWBALy', '(24) 99371-2286', 'ft', 4),
('Patrícia Regina Lima', 'patricia@email.com', '$2a$10$BLAcJu1irAzg06WbtoLoPe0RA.hkfZ0oJ25KYARPkHWRweJuWBALy', '(27) 98904-7721', 'mt', 4),
('Eduardo Matheus Gonçalves', 'eduardo@email.com', '$2a$10$BLAcJu1irAzg06WbtoLoPe0RA.hkfZ0oJ25KYARPkHWRweJuWBALy', '(31) 97412-6608', 'mt', 4),
('Vanessa Cristina Cardoso', 'vanessa@email.com', '$2a$10$BLAcJu1irAzg06WbtoLoPe0RA.hkfZ0oJ25KYARPkHWRweJuWBALy', '(32) 98651-9044', 'mt', 4),
('Marcelo Augusto Pinto', 'marcelo@email.com', '$2a$10$BLAcJu1irAzg06WbtoLoPe0RA.hkfZ0oJ25KYARPkHWRweJuWBALy', '(33) 99822-1473', 'mt', 4),
('Aline Rafaela Figueiredo', 'aline@email.com', '$2a$10$BLAcJu1irAzg06WbtoLoPe0RA.hkfZ0oJ25KYARPkHWRweJuWBALy', '(34) 99640-3751', 'mt', 4),
('Guilherme Henrique Tavares', 'guilherme@email.com', '$2a$10$BLAcJu1irAzg06WbtoLoPe0RA.hkfZ0oJ25KYARPkHWRweJuWBALy', '(35) 98590-2880', 'mt', 4),
-- RH - Recursos Humanos
('Tatiane Aparecida Monteiro', 'tatiane@email.com', '$2a$10$BLAcJu1irAzg06WbtoLoPe0RA.hkfZ0oJ25KYARPkHWRweJuWBALy', '(41) 98741-2203', 'ft', 5),
('Diego Luiz Freitas', 'diego@email.com', '$2a$10$BLAcJu1irAzg06WbtoLoPe0RA.hkfZ0oJ25KYARPkHWRweJuWBALy', '(42) 99582-7741', 'mt', 5),
('Renata Cristina Mendes', 'renata@email.com', '$2a$10$BLAcJu1irAzg06WbtoLoPe0RA.hkfZ0oJ25KYARPkHWRweJuWBALy', '(43) 98433-9180', 'mt', 5),
('Leonardo Felipe Braga', 'leonardo@email.com', '$2a$10$BLAcJu1irAzg06WbtoLoPe0RA.hkfZ0oJ25KYARPkHWRweJuWBALy', '(44) 99674-5529', 'mt', 5),
('Sofia Helena Torres', 'sofia@email.com', '$2a$10$BLAcJu1irAzg06WbtoLoPe0RA.hkfZ0oJ25KYARPkHWRweJuWBALy', '(45) 97920-8816', 'mt', 1),
('Mateus Vinícius Santana', 'mateus@email.com', '$2a$10$BLAcJu1irAzg06WbtoLoPe0RA.hkfZ0oJ25KYARPkHWRweJuWBALy', '(46) 99351-0047', 'mt', 5),
('Isabela Fernanda Moraes', 'isabela@email.com', '$2a$10$BLAcJu1irAzg06WbtoLoPe0RA.hkfZ0oJ25KYARPkHWRweJuWBALy', '(47) 98992-3348', 'mt', 5),
-- IT - Tecnologia da Informação
('Vinícius Eduardo Campos', 'vinicius@email.com', '$2a$10$BLAcJu1irAzg06WbtoLoPe0RA.hkfZ0oJ25KYARPkHWRweJuWBALy', '(48) 98174-6602', 'ft', 6),
('Paula Regina Rezende', 'paula@email.com', '$2a$10$BLAcJu1irAzg06WbtoLoPe0RA.hkfZ0oJ25KYARPkHWRweJuWBALy', '(49) 99703-5299', 'mt', 6),
('Henrique Augusto Bastos', 'henrique@email.com', '$2a$10$BLAcJu1irAzg06WbtoLoPe0RA.hkfZ0oJ25KYARPkHWRweJuWBALy', '(51) 96444-7815', 'mt', 6),
('Luana Beatriz Macedo', 'luana@email.com', '$2a$10$BLAcJu1irAzg06WbtoLoPe0RA.hkfZ0oJ25KYARPkHWRweJuWBALy', '(53) 98812-9034', 'mt', 6),
('Samuel José Cunha', 'samuel@email.com', '$2a$10$BLAcJu1irAzg06WbtoLoPe0RA.hkfZ0oJ25KYARPkHWRweJuWBALy', '(54) 99203-4412', 'mt', 6),
('Priscila Helena Andrade', 'priscila@email.com', '$2a$10$BLAcJu1irAzg06WbtoLoPe0RA.hkfZ0oJ25KYARPkHWRweJuWBALy', '(55) 98671-2290', 'mt', 6),
('Victor Hugo Lopes', 'victor@email.com', '$2a$10$BLAcJu1irAzg06WbtoLoPe0RA.hkfZ0oJ25KYARPkHWRweJuWBALy', '(62) 99581-7308', 'mt', 6),
-- Estamparia
('Débora Cristina Barcellos', 'debora@email.com', '$2a$10$BLAcJu1irAzg06WbtoLoPe0RA.hkfZ0oJ25KYARPkHWRweJuWBALy', '(64) 98790-1544', 'ft', 7),
('Alexandre Luiz Paiva', 'alexandre@email.com', '$2a$10$BLAcJu1irAzg06WbtoLoPe0RA.hkfZ0oJ25KYARPkHWRweJuWBALy', '(65) 97823-6621', 'mt', 7),
('Natália Fernanda Silveira', 'natalia@email.com', '$2a$10$BLAcJu1irAzg06WbtoLoPe0RA.hkfZ0oJ25KYARPkHWRweJuWBALy', '(66) 99452-1177', 'mt', 7),
('Gustavo Henrique Brito', 'gustavo@email.com', '$2a$10$BLAcJu1irAzg06WbtoLoPe0RA.hkfZ0oJ25KYARPkHWRweJuWBALy', '(67) 98915-4403', 'mt', 7),
('Michele Rafaela Antunes', 'michele@email.com', '$2a$10$BLAcJu1irAzg06WbtoLoPe0RA.hkfZ0oJ25KYARPkHWRweJuWBALy', '(68) 98166-9915', 'mt', 7),
('Ricardo Augusto Xavier', 'ricardo@email.com', '$2a$10$BLAcJu1irAzg06WbtoLoPe0RA.hkfZ0oJ25KYARPkHWRweJuWBALy', '(69) 99777-2048', 'mt',7),
('Adriana Cristina Queiroz', 'adriana@email.com', '$2a$10$BLAcJu1irAzg06WbtoLoPe0RA.hkfZ0oJ25KYARPkHWRweJuWBALy', '(71) 98514-7720', 'mt', 7),
-- Engenharia
('Fernando Luiz Magalhães', 'fernando@email.com', '$2a$10$BLAcJu1irAzg06WbtoLoPe0RA.hkfZ0oJ25KYARPkHWRweJuWBALy', '(73) 99482-1605', 'ft', 8),
('Simone Helena Barreto', 'simone@email.com', '$2a$10$BLAcJu1irAzg06WbtoLoPe0RA.hkfZ0oJ25KYARPkHWRweJuWBALy', '(74) 98391-4482', 'mt', 8),
('César Augusto Guimarães', 'cesar@email.com', '$2a$10$BLAcJu1irAzg06WbtoLoPe0RA.hkfZ0oJ25KYARPkHWRweJuWBALy', '(75) 99630-5571', 'mt', 8),
('Adriano Luiz Ferreira', 'adriano@email.com', '$2a$10$BLAcJu1irAzg06WbtoLoPe0RA.hkfZ0oJ25KYARPkHWRweJuWBALy', '(77) 98874-9032', 'mt', 8),
('Bianca Cristina Nunes', 'bianca@email.com', '$2a$10$BLAcJu1irAzg06WbtoLoPe0RA.hkfZ0oJ25KYARPkHWRweJuWBALy', '(79) 99715-6628', 'mt', 8),
('Caio Eduardo Ramos', 'caio@email.com', '$2a$10$BLAcJu1irAzg06WbtoLoPe0RA.hkfZ0oJ25KYARPkHWRweJuWBALy', '(81) 98420-7754', 'mt', 8),
('Diana Beatriz Lopes', 'diana@email.com', '$2a$10$BLAcJu1irAzg06WbtoLoPe0RA.hkfZ0oJ25KYARPkHWRweJuWBALy', '(82) 99163-4489', 'mt', 8),
-- Polímeros
('Enzo Gabriel Martins', 'enzoGabriel@email.com', '$2a$10$BLAcJu1irAzg06WbtoLoPe0RA.hkfZ0oJ25KYARPkHWRweJuWBALy', '(83) 98602-1175', 'ft', 9),
('Flávia Helena Duarte', 'flavia@email.com', '$2a$10$BLAcJu1irAzg06WbtoLoPe0RA.hkfZ0oJ25KYARPkHWRweJuWBALy', '(84) 97941-3306', 'ft', 9),
('Gustavo Rafael Pacheco', 'gustavoRafael@email.com', '$2a$10$BLAcJu1irAzg06WbtoLoPe0RA.hkfZ0oJ25KYARPkHWRweJuWBALy', '(85) 99822-5044', 'mt', 9),
('Helena Vitória Cardoso', 'helena@email.com', '$2a$10$BLAcJu1irAzg06WbtoLoPe0RA.hkfZ0oJ25KYARPkHWRweJuWBALy', '(86) 98976-1420', 'mt', 9),
('Igor Henrique Monteiro', 'igor@email.com', '$2a$10$BLAcJu1irAzg06WbtoLoPe0RA.hkfZ0oJ25KYARPkHWRweJuWBALy', '(87) 99514-8801', 'mt', 9),
('Janaína Aparecida Silva', 'janaina@email.com', '$2a$10$BLAcJu1irAzg06WbtoLoPe0RA.hkfZ0oJ25KYARPkHWRweJuWBALy', '(88) 98132-6679', 'mt', 9),
('Kevin Augusto Almeida', 'kevinho@email.com', '$2a$10$BLAcJu1irAzg06WbtoLoPe0RA.hkfZ0oJ25KYARPkHWRweJuWBALy', '(89) 99763-2214', 'mt', 9);