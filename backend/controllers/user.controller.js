const User = require('../models/users.model');


const addProduct = async (req, res) => {
    id = req.user._id;
    const { product_name, expiry_date, picture_url, description , category  } = req.body;
    const post = await Post.create({
        product_name,
        expiry_date,
        picture_url,
        description,
        category,
    });
    await post.save();

    const userById = await User.findById(id);

    userById.posts.push(post);
    await userById.save();

    return res.send(userById);
}

module.exports = {
    addProduct
}