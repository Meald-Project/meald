const {Article}=require('../models/Article')

//Creer un Article 
const createArticle=async(req,res)=>{
    try{
        const result=await Article.create(req.body)
        res.json(result)
    } catch (error){
        res.send(error)
    }
}

//Afficher les informations du Article par son nom
const getArticle=async(req,res)=>{
    try{
        const result=await Article.findAll({attributes:["nom"]})
        res.json(result)
    } catch (error){
        res.send(error)
    }
}

//Afficher les informations du Article par sa localisation
const getArticleByLocation=async(req,res)=>{
    try{
        const result=await Article.findAll({attributes:["location"]})
        res.json(result)
    } catch (error){
        res.send(error)
    }
}

//Effacer les informations du Article par son identité
const deleteArticle=async(req,res)=>{
    try{
        let id=req.params.id
        const result=await Article.destroy({where:{Article_id:id}})
        res.json(result)
    }
    catch(error){
        res.send(error)
    }
}

//Modifier les informations du Article 
const updateArticle=async(req,res)=>{
    try{
        let id=req.params.id
        const result=await Article.update(req.body,{where:{Article_id:id}})
        res.json(result)
    }
    catch(error){
        res.send(error)
    }
}

export default {createArticle,getArticle,getArticleByLocation,deleteArticle,updateArticle}



