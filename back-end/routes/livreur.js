const {createLivreur,getLivreur,getLivreurByLocation,deleteLivreur,updateLivreur}=require("../controllers/Livreur");
const livreurRouter=express.Router();

livreurRouter.post("/livreur/create",createLivreur());
livreurRouter.get("/livreur/:name",getLivreur());
livreurRouter.get("/livreur/:location",getLivreurByLocation());
livreurRouter.delete("/livreur/:id",deleteLivreur());
livreurRouter.put("/livreur/update/:id",updateLivreur());

module.exports=livreurRouter;