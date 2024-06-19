const { DataTypes } = require("sequelize");
const sequelize = require("../config/config");

const Client = sequelize.define(
  "Client",
  {
    client_id: {
      type: DataTypes.INTEGER,
      allowNull: false,
      autoIncrement: true,
      primaryKey: true,
    },
    mode_de_payement: {
      type: DataTypes.STRING(50),
      allowNull: true,
    },
    user_user_id: {
      type: DataTypes.INTEGER,
      allowNull: false,
    },
  },
  {
    tableName: "clients",
    timestamps: false,
  }
);

module.exports = Client;
