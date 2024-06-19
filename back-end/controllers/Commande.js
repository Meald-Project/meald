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
        const result=await Commande.findAll({attributes:["commande_id"]})
        res.json(result)
    } catch (error){
        res.send(error)
    }
}
//Afficher les informations du Commande par son nom
const getAllCommandes=async(req,res)=>{
    try{
        const result=await Commande.findAll()
        res.json(result)
    } catch (error){
        res.send(error)
    }
}


//Effacer les informations du Commande par son identité
const deleteCommande=async(req,res)=>{
    try{
        let id=req.params.id
        const result=await Commande.destroy({where:{commande_id:id}})
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
        const result=await Commande.update(req.body,{where:{commande_id:id}})
        res.json(result)
    }
    catch(error){
        res.send(error)
    }
}

export default {createCommande,getCommande,getAllCommandes,deleteCommande,updateCommande}



