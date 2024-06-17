// models/livreur.js
module.exports = (sequelize, DataTypes) => {
    const Livreur = sequelize.define('Livreur', {
      livreur_id: {
        type: DataTypes.INTEGER,
        autoIncrement: true,
        primaryKey: true,
      },
      nom: DataTypes.STRING,
      phone: DataTypes.STRING,
      location: DataTypes.STRING,
      email: DataTypes.STRING,
      motdepasse: DataTypes.STRING,
      matricule: DataTypes.STRING,
      compte_bancaire: DataTypes.STRING,
    }, {
      tableName: 'liveurs',
      timestamps: false,
    });
    return Livreur;
  };
  