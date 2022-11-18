const { Router } = require('express');
const authMiddleware = require('../middlewares/auth.middleware');
const router = Router();
const { addProduct, editProfile, getProductByCategory,addChat,getChat,getRooms, search, addFavorite,deleteFavorites, getFavorites,findOneOrCreat, getProductById, dealDone , upload, getUser } = require('../controllers/user.controller');
// user routes
router.post('/add-Product',upload.single('imageFile'), authMiddleware, addProduct);
router.post('/edit-Profile', upload.single('imageFile') , authMiddleware, editProfile);
router.get('/get-products-by-category/:category', authMiddleware, getProductByCategory);
router.get('/add-to-Favorite/:product_id', authMiddleware, addFavorite);
router.get('/search/:product_name', authMiddleware, search);
router.get('/get-favorites', authMiddleware, getFavorites);
router.get('/delete-from-Favorite/:product_id', authMiddleware, deleteFavorites);
router.post('/find-create-room', authMiddleware, findOneOrCreat);
router.post('/add-chat', authMiddleware, addChat);
router.get('/get-chats/:id/:id', authMiddleware, getChat);
router.get('/get-rooms', authMiddleware, getRooms);
router.get('/get-product-by-id/:id', authMiddleware, getProductById);
router.get('/deal-done/:id', authMiddleware, dealDone);
router.get('/get-user', authMiddleware, getUser);




module.exports = router;