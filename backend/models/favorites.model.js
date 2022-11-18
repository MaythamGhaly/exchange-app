const mongoose = require('mongoose');
// favoriteSchema
const favoritesSchema = new mongoose.Schema({

    product :{
        type:mongoose.Schema.Types.ObjectId,
        ref:'Product',
    },
    user :{
        type:mongoose.Schema.Types.ObjectId,
        ref:'User',
    },
    
})


module.exports = mongoose.model('Favorite',favoritesSchema);