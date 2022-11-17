const {Router} = require('express');
const router = Router();
const authMiddleware = require('../middlewares/auth.middleware');
const adminMiddleware = require('../middlewares/admin.middleware');
const {approvedPost, getAllUsers, getBannedUsers, banUser, removeBan,posts,deletePost} = require('../controllers/admin.controller')

// admin routes
router.get('/approved/:id', authMiddleware ,adminMiddleware, approvedPost );
router.get('/delete-post/:id', authMiddleware ,adminMiddleware, deletePost );
router.get('/get-all-users', authMiddleware ,adminMiddleware, getAllUsers );
router.get('/get-posts', authMiddleware ,adminMiddleware, posts );
router.get('/get-banned-users', authMiddleware ,adminMiddleware, getBannedUsers );
router.get('/ban-user/:id', authMiddleware ,adminMiddleware, banUser );
router.get('/remove-ban/:id', authMiddleware ,adminMiddleware, removeBan );





module.exports = router;
