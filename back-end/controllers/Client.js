const {Client}=require('../models/Client')

//Creer un Client 
const createClient=async(req,res)=>{
    try{
        const result=await Client.create(req.body)
        res.json(result)
    } catch (error){
        res.send(error)
    }
}

//Afficher les informations du Client par son nom
const getClient=async(req,res)=>{
    try{
        const result=await Client.findAll({attributes:["nom"]})
        res.json(result)
    } catch (error){
        res.send(error)
    }
}

//Afficher les informations du Client par sa localisation
const getClientByLocation=async(req,res)=>{
    try{
        const result=await Client.findAll({attributes:["location"]})
        res.json(result)
    } catch (error){
        res.send(error)
    }
}

//Effacer les informations du Client par son identité
const deleteClient=async(req,res)=>{
    try{
        let id=req.params.id
        const result=await Client.destroy({where:{Client_id:id}})
        res.json(result)
    }
    catch(error){
        res.send(error)
    }
}

//Modifier les informations du Client 
const updateClient=async(req,res)=>{
    try{
        let id=req.params.id
        const result=await Client.update(req.body,{where:{Client_id:id}})
        res.json(result)
    }
    catch(error){
        res.send(error)
    }
}

export default {createClient,getClient,getClientByLocation,deleteClient,updateClient}



