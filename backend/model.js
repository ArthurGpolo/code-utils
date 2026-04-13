import { create, read, update, deleteRecord, getConnection } from '../config/database.js';

class EquipesModel {

    // LISTAR EQUIPES
    static async listarTodos() {
        try {
            const connection = await getConnection();

            try {
                // Comando para obter as equipes
                const sql = 'SELECT * FROM equipes ORDER BY id';

                // Fazendo a consulta
                const [equipes] = await connection.query(sql);

                // Retornando as equipes
                return { equipes };
            } finally {
                connection.release();
            }

        } catch (error) {
            console.error('Erro ao listar equipes:', error);
            throw error;
        }
    }

    // LISTAR UMA EQUIPE ESPECÍFICA
    static async listarEquipe(idEquipe) {
        try {
            const connection = await getConnection();

            try {
                // Comando para obter a equipe com id = idEquipe
                const sql = `SELECT * FROM equipes WHERE id = ${idEquipe}`;

                // Fazendo a consulta
                const [[equipe]] = await connection.query(sql);

                // Retornando a equipe
                return { equipe };
            } finally {
                connection.release();
            }

        } catch (error) {
            console.error('Erro ao listar equipe:', error);
            throw error;
        }
    }

    // LISTAR OS MEMBROS DE UMA EQUIPE
    static async listarMembros(idEquipe) {
        try {
            const connection = await getConnection();

            try {
                // Comando para obter os membros de uma equipe
                const sql = `
                    SELECT id, nome, email, telefone, tipo, id_equipe 
                    FROM usuarios u 
                    WHERE u.id_equipe = ${idEquipe}
                ;`

                // Fazendo a consulta
                const [membros] = await connection.query(sql);

                // Retornando os membros separados por cargo
                return {
                    MT: membros.filter(m => m.tipo === "mt"),
                    FT: membros.filter(m => m.tipo === "ft")
                };
            } finally {
                connection.release();
            }

        } catch (error) {
            console.error('Erro ao listar membros:', error);
            throw error;
        }
    }
}


export default EquipesModel;