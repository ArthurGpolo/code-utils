import express, { Router } from 'express';
import EquipesController from '../controllers/EquipesController.js';

const router = express.Router();

// Listar TODAS as equipes
router.get('/', EquipesController.listarTodos)

// Listar uma equipe ESPECÍFICA
router.get('/:idEquipe', EquipesController.listarEquipe)

// Listar os MEMBROS de uma equipe ESPECÍFICA
router.get('/:idEquipe/membros', EquipesController.listarMembros)    


export default router;