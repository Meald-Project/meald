const express = require('express');
const router = express.Router();
const {
    createCommande,
    getAllCommandes,
    getCommandeById,
    updateCommande,
    deleteCommande
} = require('../controllers/Commande');

router.post('/', createCommande);
router.get('/', getAllCommandes);
router.get('/:id', getCommandeById);
router.put('/:id', updateCommande);
router.delete('/:id', deleteCommande);

module.exports = router;
