const express = require('express');
const router = express.Router();
const {
    createArticleCommande,
    getAllArticleCommandes,
    getArticleCommandeById,
    updateArticleCommande,
    deleteArticleCommande
} = require('../controllers/ArticleCommande');

router.post('/', createArticleCommande);
router.get('/', getAllArticleCommandes);
router.get('/:id', getArticleCommandeById);
router.put('/:id', updateArticleCommande);
router.delete('/:id', deleteArticleCommande);

module.exports = router;
