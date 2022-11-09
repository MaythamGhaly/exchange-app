const { Router } = require('express');
const authMiddleware = require('../middlewares/auth.middleware');
const router = Router();
const { addProduct, editProfile, getAllProduct, getProductByCategory, addFavorite, getFavorites, getProductById, dealDone , upload } = require('../controllers/user.controller');
// user routes
router.post('/add-Product',upload.single('productPicture'), authMiddleware, addProduct);
router.post('/edit-Profile', upload.single('profilePicture') , authMiddleware, editProfile);
router.get('/get-all-products', authMiddleware, getAllProduct);
router.post('/get-products-by-category', authMiddleware, getProductByCategory);
router.post('/add-to-Favorite', authMiddleware, addFavorite);
router.get('/get-favorites', authMiddleware, getFavorites);
router.get('/get-product-by-id/:id', authMiddleware, getProductById);
router.get('/deal-done/:id', authMiddleware, dealDone);



module.exports = router;