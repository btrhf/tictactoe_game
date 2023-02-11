// import modules
const express = require('express');
const http = require('http');
const mongoose = require('mongoose');

mongoose.set('strictQuery', true);

const app = express();
const port = process.env.PORT || 3000;
var server = http.createServer(app);

var io = require("socket.io")(server);

const DB = 
    "mongodb+srv://krish:Tester001@cluster0.mcmvfki.mongodb.net/?retryWrites=true&w=majority";

io.on("connection", (socket) => {
    console.log('Connected');
    socket.on('createRoom', ({ nickname }) => {
        console.log(nickname);
    });
});

mongoose
    .connect(DB)
    .then(() => {
        console.log('Connection Successful');
    }).catch((e) => {
        console.log(e);
    });

app.use(express.json)

server.listen(port, '0.0.0.0', () => {
    console.log(`server online on port ${port}`);
});
