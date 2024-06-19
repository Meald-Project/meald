const { Article } = require('../models/Article');

// creer un Article
const createArticle = async (req, res) => {
    try {
        const result = await Article.create(req.body);
        res.json(result);
    } catch (error) {
        res.status(500).send(error);
    }
}

// avoir les details d'un Article d'apres son nom
const getOneArticle = async (req, res) => {
    try {
        const result = await Article.findAll({
            where: { nom: req.params.nom }, 
            attributes: ["nom"]  
        });
        res.json(result);
    } catch (error) {
        res.status(500).send(error);
    }
}

// tous les Articles
const getAllArticles = async (req, res) => {
    try {
        const result = await Article.findAll();
        res.json(result);
    } catch (error) {
        res.status(500).send(error);
    }
}

// Effcer Article 
const deleteArticle = async (req, res) => {
    try {
        let id = req.params.id;
        const result = await Article.destroy({ where: { article_id: id } });
        res.json(result);
    } catch (error) {
        res.status(500).send(error);
    }
}

// modifier Article 
const updateArticle = async (req, res) => {
    try {
        let id = req.params.id;
        const result = await Article.update(req.body, { where: { article_id: id } });
        res.json(result);
    } catch (error) {
        res.status(500).send(error);
    }
}

export default { createArticle, getOneArticle, getAllArticles, deleteArticle, updateArticle };