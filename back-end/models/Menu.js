
const { DataTypes } = require("sequelize");
const sequelize = require("../config");

const Menu = sequelize.define(
  "Menu",
  {
    restaurant_id: {
      type: DataTypes.INTEGER,
      allowNull: false,
    },
    article_id: {
      type: DataTypes.INTEGER,
      allowNull: false,
    },
  },
  {
    tableName: "menu",
    timestamps: false,
  }
);

// Définir les clés étrangères
Menu.belongsTo(Restaurant, {
  foreignKey: "restaurant_id",
  targetKey: "restaurant_id",
});
Menu.belongsTo(Article, {
  foreignKey: "article_id",
  targetKey: "article_id",
});

module.exports = Menu;
