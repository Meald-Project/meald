const DepotLivreur = require("../models/DepotLivreur");


//ajouter un depot
const addDepot = async (req, res) => {
    const { montant, livreur_id } = req.body;
  
    try {
      const newDepotLivreur = await DepotLivreur.create({
        date_depot: new Date(),
        montant: montant,
        livreur_id: livreur_id,
      });
  
      res.status(201).json(newDepotLivreur);
    } catch (error) {
      console.error("Error creating DepotLivreur:", error);
      res.status(500).json({ error: "Failed to create DepotLivreur" });
    }
  }
  
module.exports={addDepot}