const User = require('../models/users.model');
const Product = require('../models/products.model');
const Favorite = require('../models/favorites.model');
const Chat = require('../models/chats.model');
const bcrypt = require('bcrypt');


const multer = require('multer');
const { response } = require('express');

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
        cb(Error('upload jpg or png onlyge'), false);
    }
}
const upload = multer({
    storage: storage, limits: {
        fileSize: 1024 * 1024 * 5 // we are allowing only 5 MB files
    },
    fileFilter: fileFilter
});
// api to add product
const addProduct = async (req, res) => {
    console.log(req.file)
    id = req.user._id;
    const { product_name, expiry_date, description, category } = req.body;
    const product = await Product.create({
        product_name,
        expiry_date,
        category,
        description,
        productPicture: req.file.filename,
        user: id
    });
    await product.save();

    const userById = await User.findById(id);

    userById.products.push(product);
    await userById.save();

    return res.send(userById);
}
// api to get products by category
const getProductByCategory = async (req, res) => {
    const { category } = req.params;
    if (category === 'All') {
        const product = await Product.find({ approved: true, deal_done: false }).populate('user');
        return res.send(product)
    }
    const product = await Product.find({ 'category': category, approved: true, deal_done: false }).populate('user');
    return res.send(product)
}
// api to get products by id
const getProductById = async (req, res) => {
    const { id } = req.params;
    const product = await Product.findById(id).populate('user');
    return res.send(product)
}
// api to get products by id
const getUser = async (req, res) => {
    id = req.user._id;
    const user = await User.findById(id).select("+password");
    return res.send(user)
}
//  api to add to favorites
const addFavorite = async (req, res) => {
    const { product_id } = req.params;
    id = req.user._id;
    const exist = await Favorite.find({ $and: [{ product: product_id }, { user: id }] });
    if (exist.length == 0) {
        const favorite = await Favorite.create({
            product: product_id,
            user: id,

        });
        await favorite.save();

        return res.send({ message: "success" });
    }
    return res.send({ message: "already exist" });
}
//  api to get favorites
const getFavorites = async (req, res) => {
    id = req.user._id;
    const favorites = await Favorite.find({ id }).populate({ path: 'product', populate: { path: 'user' } });
    return res.send(favorites)
}
//  api to delete favorites
const deleteFavorites = async (req, res) => {
    const { product_id } = req.params;
    id = req.user._id;
    const reomve = await Favorite.findOneAndRemove({ id, product_id });
    return res.send({ 'status': "success" })
}
// api to edit profile
const editProfile = async (req, res) => {
    id = req.user._id;
    const { firstName, lastName, password, confirm_pass , previousPass} = req.body;
    if (password !== confirm_pass) return res.status(400).json({ message: "Passwords do not match" });
    const user = await User.findById(id).select("+password");
    if (await bcrypt.compare(previousPass, user.password)) {
        console.log(previousPass)
        await User.findOneAndUpdate(id, {
            "first_name": firstName,
            'last_name': lastName,
            "password": await bcrypt.hash(password, 10),
            "confirm_pass": await bcrypt.hash(confirm_pass, 10),
            profilePicture: req.file.filename
        })
        return res.status(200).json({ message: "success" });
    }
    return res.status(403).json({ message: "success" });

}

// api to get the deals done
const dealDone = async (req, res) => {
    const { id } = req.params;
    await Product.findByIdAndUpdate(id, {
        deal_done: true
    })
    return res.send({ 'status': "success" })
}
// api to find a room chat or creat one
const findOneOrCreat = async (req, res) => {

    const { receiver, sender } = req.body;
    const room = await Chat.findOne({ $or: [{ user1: receiver, user2: sender }, { user1: sender, user2: receiver }] });
    if (!room) {
        const addRoom = await Chat.create({
            user1: receiver,
            user2: sender,
        });

        await addRoom.save();
        return res.send({ message: "room added" });
    }
    return res.json(room);

}
// api to get all rooms chat by users id
const getRooms = async (req, res) => {

    id = req.user._id;
    const room = await Chat.find({ $or: [{ user1: id }, { user2: id }] }).populate('user1').populate('user2');

    return res.send(room);
}
// api to save message in db
const addChat = async (req, res) => {

    const { receiver, sender, message } = req.body;
    console.log(req.body);
    const chat = await Chat.findOne({ $or: [{ user1: receiver, user2: sender }, { user1: sender, user2: receiver }] });
    chat.messages.push({
        sender: sender,
        receiver: receiver,
        message: message
    })
    await chat.save();
    return res.send({ message: "success" });
}
// api to get messages from db
const getChat = async (req, res) => {
    const { receiver, sender } = req.params;
    const chat = await Chat.findOne({ sender, receiver });
    return res.send(chat.messages);
}
// api to search by product name
const search = async (req, res) => {
    const { product_name } = req.params;
    const product = await Product.find({ product_name : product_name }).populate('user');
    return res.send(product);
}

// export all the functions
module.exports = {
    addProduct,
    editProfile,
    getProductByCategory,
    addFavorite,
    getFavorites,
    getProductById,
    dealDone,
    upload,
    getUser,
    findOneOrCreat,
    addChat,
    getChat,
    getRooms,
    deleteFavorites,
    search
}