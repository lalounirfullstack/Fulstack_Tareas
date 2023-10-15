const express = require('express');
//const Inmueble = require("./models/inmuebles");
const app = express();

app.use(express.json());

app.use('/api/inmuebles', require('./routes/inmuebles'))

module.exports = app;