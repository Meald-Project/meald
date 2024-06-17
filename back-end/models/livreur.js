const { DataTypes } = require("sequelize");
const sequelize = require("../config");

const Livreur = sequelize.define(
  "Livreur",
  {
    livreur_id: {
      type: DataTypes.INTEGER,
      autoIncrement: true,
      primaryKey: true,
    },
    nom: {
      type: DataTypes.STRING(255),
      allowNull: true,
    },
    phone: {
      type: DataTypes.STRING(20),
      allowNull: true,
    },
    location: {
      type: DataTypes.STRING(255),
      allowNull: true,
    },
    email: {
      type: DataTypes.STRING(255),
      allowNull: true,
    },
    motdepasse: {
      type: DataTypes.STRING(45),
      allowNull: true,
    },
    matricule: {
      type: DataTypes.STRING(55),
      allowNull: true,
    },
    compte_bancaire: {
      type: DataTypes.STRING(50),
      allowNull: true,
    },
  },
  {
    tableName: "livreurs",
    timestamps: false,

  }
);

module.exports = Livreur;
