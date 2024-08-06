const Sequelize = require("sequelize");

const sequelize = new Sequelize("meald", "root", "tassou", {
    dialect: "mysql",
    host: "localhost",
  });
  
  module.exports = sequelize;