const User = require('../models/users.model');
const Product = require('../models/products.model');


const approvedPost = async (req, res) => {
    const { id } = req.params;
    await Product.findByIdAndUpdate(id, {
        approved:true
    })
return res.send({'status': "success"})
}



module.exports = {
    approvedPost
}