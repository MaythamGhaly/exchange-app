const express = require('express');
var http = require('http');
require('dotenv').config();
require('./config/db.config')
const app = express();
app.use(express.json());
var server = http.createServer(app);
var io = require('socket.io')(server,{
    cors: {
        origin: "*", // allow to server to accept request from different origin
    }
});

let cors = require("cors");
app.use(cors())

const authRoutes = require('./routes/auth.routes');
app.use('/auth', authRoutes)

const UsersRoutes = require('./routes/user.routes');
app.use('/', UsersRoutes)

const AdminRoutes = require('./routes/admin.routes');
app.use('/', AdminRoutes)


app.use(express.static('public'));

const connectedUsers = new Set();
io.on('connection', (socket) => {
    console.log('Connected');
    io.emit('connectedUsers', connectedUsers.size);
    connectedUsers.add(socket.id);
    socket.on('disconnect', () => {
        console.log('Disconnected');
        connectedUsers.delete(socket.id);
    });
    socket.on("message", (data) => {
        console.log(data);
        socket.broadcast.emit("message-receive", data);
        
    })
});


server.listen(process.env.PORT, (err)=>{
    if(err) throw err;
    console.log(`server running on port ${process.env.PORT}`);
})