//HTTP Protocol
const http = require('http');

//Express Application
const app = require('./src/app');

// Reads from .env file
require('dotenv').config();

//Gets Database Configuration
require('./src/config/db')

//Builds Server
const server = http.createServer(app)

//Server Listener
const PORT = process.env.PORT || 3000
server.listen(PORT);

//On server launched
server.on('listening', () =>{
    console.log(`Listening to ${PORT}`)
})

//On Server Error
server.on('error', ()=>{
    console.log(error);
})