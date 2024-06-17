const Sequelize = require("sequelize");

const sequelize = new Sequelize("whirlpool", "root", "tassou", {
    dialect: "mysql",
    host: "localhost",
  });
  
  module.exports = sequelize;