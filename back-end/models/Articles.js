const { DataTypes } = require("sequelize");
const sequelize = require("../config");

const Article = sequelize.define(
  "article",
  {
    // Définition des colonnes du modèle
    article_id: {
      type: DataTypes.INTEGER,
      autoIncrement: true,
      primaryKey: true,
    },
    nom: {
      type: DataTypes.STRING(255),
      allowNull: false,
    },
    prix: {
      type: DataTypes.DECIMAL(10, 2),
      allowNull: false,
    },
    description: {
      type: DataTypes.STRING(225),
      allowNull: true,
    },
  },
  {
    // Options supplémentaires du modèle
    tableName: "articles", // Nom de la table dans la base de données
    timestamps: false, // Désactiver les timestamps par défaut
  }
);

module.exports = Article;
