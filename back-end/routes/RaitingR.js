const express = require('express');
const router = express.Router();
const {
    createRating,
    getAllRatings,
    getRatingById,
    updateRating,
    deleteRating
} = require('../controllers/RatingC');

router.post('/', createRating);
router.get('/', getAllRatings);
router.get('/:id', getRatingById);
router.put('/:id', updateRating);
router.delete('/:id', deleteRating);

module.exports = router;
