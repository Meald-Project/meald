const { DataTypes } = require("sequelize");
const sequelize = require("../config");

const Client = sequelize.define(
  "Client",
  {
    client_id: {
      type: DataTypes.INTEGER,
      autoIncrement: true,
      primaryKey: true,
    },
    nom: {
      type: DataTypes.STRING(255),
      allowNull: true,
    },
    email: {
      type: DataTypes.STRING(255),
      allowNull: true,
      unique: true,
    },
    motdepasse: {
      type: DataTypes.STRING(255),
      allowNull: true,
    },
    telephone: {
      type: DataTypes.STRING(20),
      allowNull: true,
    },
    addresse: {
      type: DataTypes.STRING(200),
      allowNull: true,
    },
    mode_de_payement: {
      type: DataTypes.STRING(50),
      allowNull: true,
    },
  },
  {
    tableName: "clients",
    timestamps: false,

  }
);

module.exports = Client;
