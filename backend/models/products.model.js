const mongoose = require('mongoose');
// productSchema
const productsSchema = new mongoose.Schema({

    product_name: {
        type: String,
        required: 'product_name is required'
    },
    expiry_date: {
        type: String,
        required: 'expiry_date is required'
    },
    productPicture: {
        type: String,
        required: 'picture_url is required'
    },
    description: {
        type: String,
        required: 'description is required'
    },
    category: {
        type: String,
        required: 'category is required',
        enum: ['Food', 'Medicine', 'Others', 'Donate']
    },
    approved: {
        type: Boolean,
        default: false,
    },
    deal_done: {
        type: Boolean,
        default: false
    },
    user: {
        type: mongoose.Schema.Types.ObjectId,
        ref: 'User',
    },
    favorites: 
        {type: mongoose.Schema.Types.ObjectId,ref:'Favorite'}
    

})


module.exports = mongoose.model('Product', productsSchema);
