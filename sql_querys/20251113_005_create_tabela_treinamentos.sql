-- Migration: Criar tabela usuarios
-- Data: 2025-11-11
-- Descrição: Tabela para os usuários do sistema

-- RELATÓRIO:		(Por favor, anote as alterações que fizer)
-- 	2025-11-11
-- 		Giovanne : Criação das tabelas e inserts
-- 2025-11-22
-- 		Giovanne : 
-- 			Criação da tabela presencas
-- 			Organizando relacionamentos entre as tabelas
-- 			Organizando atributos das tabelas


USE CONTROLE_TREINAMENTOS;

-- Criando a tabela de treinamentos
CREATE TABLE if not exists treinamentos (
	id					INT PRIMARY KEY AUTO_INCREMENT,
    nome				VARCHAR(100) NOT NULL,
    descricao			VARCHAR(300) NOT NULL,
    data_criacao		DATETIME DEFAULT CURRENT_TIMESTAMP,
    data_atualizacao	DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    numSessoes			INT,
    idCriador			INT,
    estado              ENUM('Pendente', 'Em andamento', 'Concluido', 'Cancelado') NOT NULL DEFAULT 'Pendente',
    
    FOREIGN KEY (idCriador) REFERENCES usuarios(id) ON DELETE SET NULL
);

-- =====================================================================================================================================

-- Criando a tabela de sessoes de treinamento
CREATE TABLE if not exists sessoes (
	id					INT PRIMARY KEY AUTO_INCREMENT,
    idTreinamento		INT NOT NULL,
    dia					DATE NOT NULL,
    hora_inicio			TIME NOT NULL,
    hora_fim			TIME NOT NULL,
    localidade			VARCHAR(100) NOT NULL,
    data_criacao		DATETIME DEFAULT CURRENT_TIMESTAMP,
    data_atualizacao	DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    estado				ENUM('Agendada', 'Em andamento', 'Concluida') NOT NULL DEFAULT 'Agendada',
    
    FOREIGN KEY (idTreinamento) REFERENCES treinamentos(id) ON DELETE CASCADE
);

-- =====================================================================================================================================

-- Criando a tabela de participacoes
CREATE TABLE if not exists participacoes (
	idTreinamento			INT NOT NULL,
    idParticipante			INT NOT NULL,
    
    PRIMARY KEY (idTreinamento, idParticipante),
    FOREIGN KEY (idTreinamento) REFERENCES treinamentos(id) ON DELETE CASCADE,
    FOREIGN KEY (idParticipante) REFERENCES usuarios(id) ON DELETE CASCADE
);

-- =====================================================================================================================================

-- Criando a tabela de presencas
CREATE TABLE if not exists presencas (
	idSessao				INT NOT NULL,
    idParticipante			INT NOT NULL,
    presenca				BOOLEAN NOT NULL,
    justificativa			VARCHAR(300),
    
    PRIMARY KEY (idSessao, idParticipante),
    FOREIGN KEY (idSessao) REFERENCES sessoes(id) ON DELETE CASCADE,
    FOREIGN KEY (idParticipante) REFERENCES usuarios(id) ON DELETE CASCADE
);

-- =====================================================================================================================================