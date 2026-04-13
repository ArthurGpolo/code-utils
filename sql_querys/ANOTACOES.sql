/*
TABELAS NO BANCO:
	> TABELA DE EQUIPES
	> TABELA DE USUÁRIOS
	> TABELA DE LOGS
	> TABELA DE TREINAMENTOS
	> TABELA DE SESSOES
	> PARTICIPACOES (Relaciona os usuarios aos treinamentos)
    > TABELA DE PRESENÇAS
	> CERTIFICADOS

CHAVES (Relacionamentos) DAS TABELAS:
	• TABELA DE EQUIPES
		PK - id INT (Definido no insert)
		
	• TABELA DE USUÁRIOS
		PK - id INT AUTO INCREMENT
		FK - idEquipe REFERENCES equipes(id)

	• TABELA DE LOGS
		PK - id INT AUTO INCREMENT
		FK - idUsuario REFERENCES usuarios(id)

	• TABELA DE TREINAMENTOS
		PK - id INT AUTO INCREMENT
		FK - idCriador REFENRENCES usuarios(id)

	• TABELA DE SESSOES
		PK - id INT AUTO INCREMENT
		FK - idTreinamento REFERENCES treinamentos(id)
		
	• TABELA DE PARTICIPACOES (Relaciona os usuarios aos treinamentos)
		PK - (idTreinamento, idParticipante)
		FK - idParticipante REFERENCES usuarios(id)
		FK - idTreinamento REFERENCES treinamentos(id)
		
	• TABELA DE PRESENCAS 
		PK - (idSessao, idParticipante)
		FK - idParticipante REFERENCES usuarios(id)
		FK - idSessao REFERENCES sessoes(id)
		
	• TABELA DE CERTIFICADOS (Relaciona os usuarios aos treinamentos)
		PK - (idUsuario, idTreinamento)
		FK - idUsuario REFERENCES usuarios(id)
		FK - idTreinamento REFERENCES treinamentos(id)
*/