const {Router} = require('express');
const {login, signup} = require('../controllers/auth.controller')
const router = Router();
// auth routes
router.post('/login', login);
router.post('/signup', signup);


module.exports = router;