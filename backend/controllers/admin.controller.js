const User = require('../models/users.model');
const Product = require('../models/products.model');
// api to approve posts
const approvedPost = async (req, res) => {
    const { id } = req.params;
    await Product.findByIdAndUpdate(id, {
        approved:true
    })
return res.send({'status': "success"})
}
// api to get all users
const getAllUsers = async (req, res) => {
    const user = await User.find({ $where: "this.banned == false" });
    return res.send(user)
}
// api to ban a user
const banUser = async (req, res) => {
    const { id } = req.params;
    await User.findByIdAndUpdate(id, {
        banned:true
    })
return res.send({'status': "success"})
}
// api to remove ban
const removeBan = async (req, res) => {
    const { id } = req.params;
    await User.findByIdAndUpdate(id, {
        banned:false
    })
return res.send({'status': "success"})
}
// api to get banned users
const getBannedUsers = async (req, res) => {
    const user = await User.find({ $where: "this.banned == true" });
    return res.send(user)
}
//  export all functions
module.exports = {
    approvedPost,
    getAllUsers,
    getBannedUsers,
    banUser,
    removeBan
}