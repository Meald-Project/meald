const {Commande}=require('../models/Commande')

//Creer un Commande 
const createCommande=async(req,res)=>{
    try{
        const result=await Commande.create(req.body)
        res.json(result)
    } catch (error){
        res.send(error)
    }
}

//Afficher les informations du Commande par son nom
const getCommande=async(req,res)=>{
    try{
        const result=await Commande.findAll({attributes:["nom"]})
        res.json(result)
    } catch (error){
        res.send(error)
    }
}

//Afficher les informations du Commande par sa localisation
const getCommandeByLocation=async(req,res)=>{
    try{
        const result=await Commande.findAll({attributes:["location"]})
        res.json(result)
    } catch (error){
        res.send(error)
    }
}

//Effacer les informations du Commande par son identité
const deleteCommande=async(req,res)=>{
    try{
        let id=req.params.id
        const result=await Commande.destroy({where:{Commande_id:id}})
        res.json(result)
    }
    catch(error){
        res.send(error)
    }
}

//Modifier les informations du Commande 
const updateCommande=async(req,res)=>{
    try{
        let id=req.params.id
        const result=await Commande.update(req.body,{where:{Commande_id:id}})
        res.json(result)
    }
    catch(error){
        res.send(error)
    }
}

export default {createCommande,getCommande,getCommandeByLocation,deleteCommande,updateCommande}



