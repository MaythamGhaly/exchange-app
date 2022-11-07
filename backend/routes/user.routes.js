const {Router} = require('express');
const authMiddleware = require('../middlewares/auth.middleware')
const router = Router();
const {addProduct} = require('../controllers/user.controller')



router.post('/add-Product',authMiddleware, addProduct);

module.exports = router;