const {Livreur}=require('../models/livreur')



//Creer un livreur 
const createLivreur=async(req,res)=>{
    try{
        const result=await Livreur.create(req.body)
        res.json(result)
    } catch (error){
        res.send(error)
    }
}

//Afficher les informations du livreur par son nom
const getLivreur=async(req,res)=>{
    try{
        const result=await Livreur.findAll({attributes:["nom"]})
        res.json(result)
    } catch (error){
        res.send(error)
    }
}

//Afficher les informations du livreur par sa localisation
const getLivreurByLocation=async(req,res)=>{
    try{
        const result=await Livreur.findAll({attributes:["location"]})
        res.json(result)
    } catch (error){
        res.send(error)
    }
}

//Effacer les informations du livreur par son identité
const deleteLivreur=async(req,res)=>{
    try{
        let id=req.params.id
        const result=await Livreur.destroy({where:{livreur_id:id}})
        res.json(result)
    }
    catch(error){
        res.send(error)
    }
}

//Modifier les informations du livreur 
const updateLivreur=async(req,res)=>{
    try{
        let id=req.params.id
        const result=await Livreur.update(req.body,{where:{livreur_id:id}})
        res.json(result)
    }
    catch(error){
        res.send(error)
    }
}

export default {createLivreur,getLivreur,getLivreurByLocation,deleteLivreur,updateLivreur}



