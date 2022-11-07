const User = require('../models/users.model');
const Product = require('../models/products.model');


const approvedPost = async (req, res) => {
    const { id } = req.params;
    await Product.findByIdAndUpdate(id, {
        approved:true
    })
return res.send({'status': "success"})
}

const getAllUsers = async (req, res) => {
    const user = await User.find({ $where: "this.banned == false" });
    return res.send(user)
}

const banUser = async (req, res) => {
    const { id } = req.params;
    await User.findByIdAndUpdate(id, {
        banned:true
    })
return res.send({'status': "success"})
}

const removeBan = async (req, res) => {
    const { id } = req.params;
    await User.findByIdAndUpdate(id, {
        banned:false
    })
return res.send({'status': "success"})
}

const getBannedUsers = async (req, res) => {
    const user = await User.find({ $where: "this.banned == true" });
    return res.send(user)
}




module.exports = {
    approvedPost,
    getAllUsers,
    getBannedUsers,
    banUser,
    removeBan
}