const {Router} = require('express');
const authMiddleware = require('../middlewares/auth.middleware')
const router = Router();
const {addProduct, editProfile, getAllProduct, getProductByCategory, addFavorite, getFavorites} = require('../controllers/user.controller')



router.post('/add-Product',authMiddleware, addProduct);
router.post('/edit-Profile',authMiddleware, editProfile);
router.get('/get-all-products',authMiddleware, getAllProduct);
router.post('/get-products-by-category',authMiddleware, getProductByCategory);
router.post('/add-to-Favorite',authMiddleware, addFavorite);
router.get('/get-user',authMiddleware, getFavorites);






module.exports = router;