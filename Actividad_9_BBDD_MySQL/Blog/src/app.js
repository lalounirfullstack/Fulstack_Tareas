const express = require('express');

const app = express();

//To use request with JSON Format
app.use(express.json());

//Main API route
app.use('/api', require('./routes/api'));

module.exports = app;