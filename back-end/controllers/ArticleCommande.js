const {ArticleCommande}=require('../models/ArticleCommande')

//Creer un ArticleCommande 
const createArticleCommande=async(req,res)=>{
    try{
        const result=await ArticleCommande.create(req.body)
        res.json(result)
    } catch (error){
        res.send(error)
    }
}

//Afficher les informations du ArticleCommande par son identité
const getArticleCommande=async(req,res)=>{
    try{
        const result=await ArticleCommande.findAll({ where:{article_id:id}})
        res.json(result)
    } catch (error){
        res.send(error)
    }
}

//Effacer les informations du ArticleCommande par son identité
const deleteArticleCommande=async(req,res)=>{
    try{
        let id=req.params.id
        const result=await ArticleCommande.destroy({where:{articleCommande_id:id}})
        res.json(result)
    }
    catch(error){
        res.send(error)
    }
}

//Modifier les informations du ArticleCommande 
const updateArticleCommande=async(req,res)=>{
    try{
        let id=req.params.id
        const result=await ArticleCommande.update(req.body,{where:{articleCommande_id:id}})
        res.json(result)
    }
    catch(error){
        res.send(error)
    }
}

export default {createArticleCommande,getArticleCommande,deleteArticleCommande,updateArticleCommande}



