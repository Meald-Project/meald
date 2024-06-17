const { DataTypes } = require("sequelize");
const sequelize = require("../config");

const DepotLivreur = sequelize.define(
  "DepotLivreur",
  {
    depot_livreur_id: {
      type: DataTypes.INTEGER,
      allowNull: false,
      primaryKey: true,
    },
    date_depot: {
      type: DataTypes.STRING(45),
      allowNull: true,
    },
    montant: {
      type: DataTypes.STRING(45),
      allowNull: true,
    },
    livreur_id: {
      type: DataTypes.INTEGER,
      allowNull: false,
    },
  },
  {
    tableName: "depot_livreur",
  }
);

module.exports = DepotLivreur;
