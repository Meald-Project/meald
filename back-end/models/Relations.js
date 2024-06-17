const sequelize = require("./config");
const Article = require("./Articles");
const Client = require("./Client");
const Livreur = require("./livreur");
const Commande = require("./Commande");
const Paiement = require("./Paiement");
const Restaurant = require("./Restaurant");
const Rating = require("./Rating");
const ArticleCommande = require("./ArticleCommande");
const DepotLivreur = require("./DepotLivreur");
const Menu = require("./Menu");

// Importer tous les modèles ici et définir les relations

// Définir les associations
Client.hasMany(Commande, { foreignKey: "user_id" });
Commande.belongsTo(Client, { foreignKey: "user_id" });

Restaurant.hasMany(Commande, { foreignKey: "restaurant_id" });
Commande.belongsTo(Restaurant, { foreignKey: "restaurant_id" });

Commande.hasMany(Paiement, { foreignKey: "commande_id" });
Paiement.belongsTo(Commande, { foreignKey: "commande_id" });

Client.hasMany(Rating, { foreignKey: "user_id" });
Rating.belongsTo(Client, { foreignKey: "user_id" });

Restaurant.hasMany(Rating, { foreignKey: "restaurant_id" });
Rating.belongsTo(Restaurant, { foreignKey: "restaurant_id" });

Article.belongsToMany(Commande, {
  through: ArticleCommande,
  foreignKey: "article_id",
});
Commande.belongsToMany(Article, {
  through: ArticleCommande,
  foreignKey: "commande_id",
});

Livreur.hasMany(Commande, { foreignKey: "livreur_id" });
Commande.belongsTo(Livreur, { foreignKey: "livreur_id" });

Livreur.hasMany(DepotLivreur, { foreignKey: "liveurs_livreur_id" });
DepotLivreur.belongsTo(Livreur, { foreignKey: "liveurs_livreur_id" });

Restaurant.belongsToMany(Article, {
  through: Menu,
  foreignKey: "restaurant_id",
});
Article.belongsToMany(Restaurant, {
  through: Menu,
  foreignKey: "article_id",
});

// Synchroniser les associations
// sequelize
//   .sync()
//   .then(() => {
//     console.log("Les associations ont été synchronisées");
//   })
//   .catch((err) => {
//     console.error("Erreur lors de la synchronisation des associations :", err);
//   });

module.exports = sequelize;
