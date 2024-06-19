const  User = require('../models/User');
const Livreur= require('../models/livreur');
const Client = require('../models/Client');

// Create a user
const createUser = async (req, res) => {
    try {
        const result = await User.create(req.body);
        res.json(result);
    } catch (error) {
        res.send(error);
    }
};

// Get all users
const getAllUsers = async (req, res) => {
    try {
        const result = await User.findAll();
        res.json(result);
    } catch (error) {
        res.send(error);
    }
};

// Get user by ID
const getUserById = async (req, res) => {
    try {
        const result = await User.findByPk(req.params.id, {
            include: [Livreur, Client]
        });
        res.json(result);
    } catch (error) {
        res.send(error);
    }
};

// Update user by ID
const updateUser = async (req, res) => {
    try {
        const result = await User.update(req.body, { where: { user_id: req.params.id } });
        res.json(result);
    } catch (error) {
        res.send(error);
    }
};

// Delete user by ID
const deleteUser = async (req, res) => {
    try {
        const result = await User.destroy({ where: { user_id: req.params.id } });
        res.json(result);
    } catch (error) {
        res.send(error);
    }
};

module.exports = { createUser, getAllUsers, getUserById, updateUser, deleteUser };
