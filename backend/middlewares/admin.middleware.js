const adminMiddleware = async (req, res, next) => {
    if(req.user.type === 'Admin'){
         return next()
    }
     return res.status(401).json({message: "Unauthorized"});
}

module.exports = adminMiddleware;