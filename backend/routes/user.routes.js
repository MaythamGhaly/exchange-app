const {Router} = require('express');
const authMiddleware = require('../middlewares/auth.middleware')
const router = Router();
const {addProduct, editProfile} = require('../controllers/user.controller')



router.post('/add-Product',authMiddleware, addProduct);
router.post('/edit-Profile',authMiddleware, editProfile);


module.exports = router;