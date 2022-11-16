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

var clients = {};
io.on('connection', (socket) => {
    console.log('Connected');
    socket.on("signin", (id) => {
        console.log(id);
        clients[id] = socket;
    })
    socket.on('disconnect', () => {
        console.log('Disconnected');
        
    });
    socket.on("message", (data) => {
        let receiver = data.receiver;
        if(clients[receiver]) clients[receiver].emit("message-receive", data);
        
    })
});


server.listen(process.env.PORT, (err)=>{
    if(err) throw err;
    console.log(`server running on port ${process.env.PORT}`);
})