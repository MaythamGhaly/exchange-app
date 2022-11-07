const mongoose = require('mongoose');

const favoritesSchema = new mongoose.Schema({

    product_id :{
        type:mongoose.Schema.Types.ObjectId,
        ref:'Product',
    },
    user :{
        type:mongoose.Schema.Types.ObjectId,
        ref:'User',
    },
    
})


module.exports = mongoose.model('Favorite',favoritesSchema);