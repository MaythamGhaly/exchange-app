const mongoose = require('mongoose');
// chatsSchema
const chatsSchema = new mongoose.Schema({

    user1 :{
        type:mongoose.Schema.Types.ObjectId,
        ref:'User',
       
       },
    user2 :{
        type:mongoose.Schema.Types.ObjectId,
        ref:'User',
       
    },
    messages :[{
        receiver :{
            type: String,
            ref:'user',
           
           },
        sender :{
            type:String,
            ref:'User', 
        },
        message: {
            type: String,
            
        }
}],
        
   
    time :{
        type:Date,
        default:Date.now,
    },
    
})


module.exports = mongoose.model('Chat',chatsSchema);