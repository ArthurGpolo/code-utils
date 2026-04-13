-- Migration: Criar tabela equipes
-- Data: 2025-11-11
-- Descrição: Tabela para as equipes do sistema

-- RELATÓRIO:		(Por favor, anote as alterações que fizer)
-- 	2025-11-13
-- 		Arthur : Criação das tabelas e inserts
--  2025-11-14
--      Gabriel  : Alteração dos IDs, removendo o auto_increment e deixando a adição de forma manual
-- 	20255-11-22
-- 		Giovanne : Equipe 'Administradores'

USE CONTROLE_TREINAMENTOS;

-- CRIANDO A TABELA EQUIPES
CREATE TABLE equipes (
    id INT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL UNIQUE,
    descricao VARCHAR(250) NOT NULL,
    icone VARCHAR(100)
); 

-- Inserindo as equipes
INSERT INTO equipes (id, nome, descricao, icone)
VALUES 
(0, 'Administradores', 'Equipe de administração do site', 'bi bi-people'),
(1, 'TDO - Ferramentaria', 'Equipe de desenvolvimento de ferramentas especiais', 'bi bi-tools'),
(2, 'Pintura', 'Equipe responsavel pela pintura', 'bi bi-brush'),
(3, 'GA - Gestão de Almoxarifado/Geral', 'Equipe responsável pela linha de montagem', 'bi bi-car-front-fill'),
(4, 'Manutenção', 'Equipe responsável pela manutenção geral da fábrica', 'bi bi-wrench-adjustable'),
(5, 'RH - Recursos Humanos', 'Equipe responsável por cuidar dos funcionários da empresa', 'bi bi-person-arms-up'),
(6, 'IT - Tecnologia da Informação', 'Equipe responsável pelo suporte tecnológico a toda a empresa', 'bi bi-pc-display-horizontal'),
(7, 'Estamparia', 'Equipe responsável por modelar chapas de aço (ou alumínio) para formar as peças da carroceria', 'bi bi-car-front'),
(8, 'Engenharia', 'Equipe responsável por projetar, desenvolver e melhorar os veículos e os processos de produção', 'bi bi-gear-wide-connected'),
(9, 'Polímeros', 'Equipe responsável pela engenharia de materiais e produção', 'bi bi-flask');