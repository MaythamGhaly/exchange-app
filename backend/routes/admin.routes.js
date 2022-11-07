const {Router} = require('express');
const router = Router();
const authMiddleware = require('../middlewares/auth.middleware');
const adminMiddleware = require('../middlewares/admin.middleware');
const {approvedPost} = require('../controllers/admin.controller')




router.get('/approved/:id', authMiddleware , approvedPost );

module.exports = router;
