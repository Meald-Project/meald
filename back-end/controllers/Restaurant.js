const Restaurant =require('../models/Restaurant')
const Category =require ('../models/Categories')
const Commande =require('../models/Commande')
// Create a restaurant
const createRestaurant = async (req, res) => {
    try {
        const result = await Restaurant.create(req.body);
        res.json(result);
    } catch (error) {
        res.send(error);
    }
};

// Get all restaurants
const getAllRestaurants = async (req, res) => {
    try {
        const result = await Restaurant.findAll();
        res.json(result);
    } catch (error) {
        res.send(error);
    }
};

// Get restaurant by ID
const getRestaurantById = async (req, res) => {
    try {
        const result = await Restaurant.findByPk(req.params.id, {
            include: [Category, Commande]
        });
        res.json(result);
    } catch (error) {
        res.send(error);
    }
};

// Update restaurant by ID
const updateRestaurant = async (req, res) => {
    try {
        const result = await Restaurant.update(req.body, { where: { restaurant_id: req.params.id } });
        res.json(result);
    } catch (error) {
        res.send(error);
    }
};

// Delete restaurant by ID
const deleteRestaurant = async (req, res) => {
    try {
        const result = await Restaurant.destroy({ where: { restaurant_id: req.params.id } });
        res.json(result);
    } catch (error) {
        res.send(error);
    }
};

module.exports = { createRestaurant, getAllRestaurants, getRestaurantById, updateRestaurant, deleteRestaurant };
