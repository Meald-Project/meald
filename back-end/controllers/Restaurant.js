const {Restaurant}=require('../models/Restaurant')

//Creer un Restaurant 
const createRestaurant=async(req,res)=>{
    try{
        const result=await Restaurant.create(req.body)
        res.json(result)
    } catch (error){
        res.send(error)
    }
}

//Afficher les informations du Restaurant par son nom
const getRestaurant=async(req,res)=>{
    try{
        const result=await Restaurant.findAll({attributes:["nom"]})
        res.json(result)
    } catch (error){
        res.send(error)
    }
}

//Afficher les informations du Restaurant par sa localisation
const getRestaurantByLocation=async(req,res)=>{
    try{
        const result=await Restaurant.findAll({attributes:["location"]})
        res.json(result)
    } catch (error){
        res.send(error)
    }
}

//Effacer les informations du Restaurant par son identité
const deleteRestaurant=async(req,res)=>{
    try{
        let id=req.params.id
        const result=await Restaurant.destroy({where:{Restaurant_id:id}})
        res.json(result)
    }
    catch(error){
        res.send(error)
    }
}

//Modifier les informations du Restaurant 
const updateRestaurant=async(req,res)=>{
    try{
        let id=req.params.id
        const result=await Restaurant.update(req.body,{where:{Restaurant_id:id}})
        res.json(result)
    }
    catch(error){
        res.send(error)
    }
}

export default {createRestaurant,getRestaurant,getRestaurantByLocation,deleteRestaurant,updateRestaurant}



