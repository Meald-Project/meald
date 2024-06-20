const express = require('express');
const router = express.Router();
const {
    createDepotLivreur,
    getAllDepotLivreurs,
    getDepotLivreurById,
    updateDepotLivreur,
    deleteDepotLivreur
} = require('../controllers/DepotLivreur');

router.post('/', createDepotLivreur);
router.get('/', getAllDepotLivreurs);
router.get('/:id', getDepotLivreurById);
router.put('/:id', updateDepotLivreur);
router.delete('/:id', deleteDepotLivreur);

module.exports = router;
