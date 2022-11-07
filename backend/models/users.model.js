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
        {type: mongoose.Schema.Types.ObjectId,ref:'Post'}
    ],
})

module.exports = mongoose.model('User', userSchema);