const User = require('../models/users.model');
const Product = require('../models/products.model');



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



module.exports = {
    addProduct,
    editProfile
}