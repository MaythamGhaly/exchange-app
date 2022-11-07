const mongoose = require('mongoose');

const userSchema = new mongoose.Schema({
    first_name: {
        type: String,
        required: 'first_name is required'
    },
    last_name: {
        type: String,
        required: 'last_name is required'
    },
    email: {
        type: String,
        required: 'email is required',
        unique: true,
        trim: true
    },
    password: {
        type: String,
        required: 'password is required',
        select: false
    },
    confirm_pass: {
        type: String,
        required: 'confirm_pass is required',
        select: false
    },
    type: {
        type: String,
        required: 'type is required',
        enum: ['Admin', 'User']
    },
    banned: {
        type: Boolean,
        default: false
    },
    products: [
        {
            product_name: {
                type: String,
                required: 'product_name is required'
            },
            expiry_date: {
                type: Date,
                required: 'expiry_date is required'
            },
            picture_url: {
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
                enum: ['food', 'beverage', 'medicine', 'beauty', 'donate']
            },
            approved: {
                type: Boolean,
                default: false,
            },
            favorite: {
                type: Boolean,
                default: false,
            },

        }
    ],
})

module.exports = mongoose.model('User', userSchema);