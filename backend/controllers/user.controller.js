const User = require('../models/users.model');
const Product = require('../models/products.model');
const Favorite = require('../models/favorites.model');




const addProduct = async (req, res) => {
    id = req.user._id;
    const { product_name, expiry_date, picture_url, description , category  } = req.body;
    const product = await Product.create({
        product_name,
        expiry_date,
        picture_url,
        description,
        category,
        user: id
    });
    await product.save();

    const userById = await User.findById(id);

    userById.products.push(product);
    await userById.save();

    return res.send(userById);
}

const getAllProduct = async (req, res) => {
    const product = await Product.find({});
    return res.send(product)
}

const getProductByCategory = async (req, res) => {
    const { category } = req.body;
    const product = await Product.find({'category': category});
    return res.send(product)
}

const addFavorite = async (req, res) => {
    id = req.user._id;
    const { product_id } = req.body;
    const favorite = await Favorite.create({
        product_id: product_id,
        user: id,
        
    });
    await favorite.save();

    // const userById = await User.findById(id);

    // userById.favorites.push(favorite);
    // await userById.save();

    return res.send(favorite);
}

const editProfile = async (req, res) => {
    id = req.user._id;
    const { first_name, last_name, password , confirm_pass } = req.body;
    if(password !== confirm_pass) return res.status(400).json({message: "Passwords do not match"});
    await User.findOneAndUpdate(id, {
        first_name,
        last_name,
        password,
        confirm_pass
    })

return res.send({'status': "success"})
}

const getFavorites= async (req, res) => {
    id = req.user._id;
    const user = await Favorite.find({id}).populate('product_id');
    return res.send(user)
}

module.exports = {
    addProduct,
    editProfile,
    getAllProduct,
    getProductByCategory,
    addFavorite,
    getFavorites
}