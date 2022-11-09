const User = require('../models/users.model');
const Product = require('../models/products.model');
const Favorite = require('../models/favorites.model');
const multer = require('multer');

// function to upload image in the public folder
const storage = multer.diskStorage({
    destination: function (req, file, cb) {
        cb(null, 'public/uploads/')
    },
    filename: function (req, file, cb) {
        cb(null, Date.now() + file.originalname);
    }
})
const fileFilter = (req, file, cb) => {
    if (file.mimetype === 'image/jpeg' || file.mimetype === 'image/png') {
        cb(null, true);
    } else {
        cb(Error('upload jpg or png onlyge') , false);
    }
}
const upload = multer({storage: storage , limits: {
    fileSize: 1024 * 1024 * 5 // we are allowing only 5 MB files
},
fileFilter: fileFilter
});
// api to add product
const addProduct = async (req, res) => {
    id = req.user._id;
    const { product_name, expiry_date, description, category } = req.body;
    const product = await Product.create({
        product_name,
        expiry_date,
        productPicture: req.file.filename,
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
// api to get all products
const getAllProduct = async (req, res) => {
    const product = await Product.find({ approved: true, deal_done: false });
    return res.send(product)
}
// api to get products by category
const getProductByCategory = async (req, res) => {
    const { category } = req.body;
    const product = await Product.find({ 'category': category, approved: true, deal_done: false });
    return res.send(product)
}
// api to get products by id
const getProductById = async (req, res) => {
    const { id } = req.params;
    const product = await Product.findById(id).populate('user');
    return res.send(product)
}
//  api to add to favorites
const addFavorite = async (req, res) => {
    id = req.user._id;
    const { product_id } = req.body;
    const favorite = await Favorite.create({
        product_id: product_id,
        user: id,

    });
    await favorite.save();

    return res.send({ message: "success" });
}
// api to edit profile
const editProfile = async (req, res) => {
    id = req.user._id;
    const { first_name, last_name, password, confirm_pass } = req.body;
    if (password !== confirm_pass) return res.status(400).json({ message: "Passwords do not match" });
    await User.findOneAndUpdate(id, {
        first_name,
        last_name,
        password,
        confirm_pass,
        profilePicture: req.file.filename
    })

    return res.send({ 'status': "success" })
}
//  api to get favorites
const getFavorites = async (req, res) => {
    id = req.user._id;
    const user = await Favorite.find({ id }).populate('product_id');
    return res.send(user)
}
// api to get the deals done
const dealDone = async (req, res) => {
    const { id } = req.params;
    await Product.findByIdAndUpdate(id, {
        deal_done: true
    })
    return res.send({ 'status': "success" })
}

// export all the functions
module.exports = {
    addProduct,
    editProfile,
    getAllProduct,
    getProductByCategory,
    addFavorite,
    getFavorites,
    getProductById,
    dealDone,
    upload
}