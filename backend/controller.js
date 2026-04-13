import EquipesModel from '../models/EquipesModel.js'


class EquipesController {

    /* LISTAR TODAS AS EQUIPES */
    static async listarTodos(req, res) {
        try {
            // Chamando o model para fazer a consulta
            const resultado = await EquipesModel.listarTodos();

            // Respondendo a requisição com as equipes
            res.status(200).json({
                sucesso: true,
                dados: { equipes: resultado.equipes }
            });
            
        } catch (error) {
            console.error('Erro ao listar as equipes:', error);
            res.status(500).json({
                sucesso: false,
                erro: 'Erro interno do servidor',
                mensagem: 'Não foi possível listar as equipes'
            });
        }
    }

    /* LISTAR UMA EQUIPE ESPECÍFICA */
    static async listarEquipe(req, res) {
        try {
            // Obtendo o id da equipe
            const idEquipe = parseInt(req.params.idEquipe)

            // Chamando o model para fazer a consulta
            const resultado = await EquipesModel.listarEquipe(idEquipe);

            // Retornando a equipe
            res.status(200).json({
                sucesso: true,
                dados: {
                    equipe: resultado.equipe
                },
            });
            
        } catch (error) {
            console.error('Erro ao listar a equipe:', error);
            res.status(500).json({
                sucesso: false,
                erro: 'Erro interno do servidor',
                mensagem: 'Não foi possível listar a equipe'
            });
        }
    }

    /* LISTAR MEMBROS DE UMA EQUIPE ESPECÍFICA */
    static async listarMembros(req, res) {
        try {
            // Obtendo o id da equipe
            const idEquipe = parseInt(req.params.idEquipe)

            // Chamando o model para fazer a consulta
            const resultado = await EquipesModel.listarMembros(idEquipe);

            // Retornando os membros
            res.status(200).json({
                sucesso: true,
                dados: {
                    FT: resultado.FT,
                    MT: resultado.MT,
                }
            });

        } catch (error){
            console.error('Erro ao listar os membros da equipe:', error);
            res.status(500).json({
                sucesso: false,
                erro: 'Erro interno do servidor',
                mensagem: 'Não foi possível listar os membros da equipe'
            });
        }
    }
}


export default EquipesController;