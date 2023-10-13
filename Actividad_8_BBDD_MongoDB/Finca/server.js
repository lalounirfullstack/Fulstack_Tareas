const http = require('http');
const  mongoose = require('mongoose');
const app = require('./src/app');

require('dotenv').config();

const server = http.createServer(app);

const PORT = process.env.PORT || 3000;

// server.listen(PORT, ()=>{
//     console.log(`Listening on PORT ${PORT}`)
// });

mongoose.set("strictQuery", false)
mongoose.connect('mongodb+srv://root:Nikopancho1102@unirfullstack.pctqqu4.mongodb.net/Finca?retryWrites=true&w=majority', {
  dbName: 'Finca',
}).then(()=>{
  console.log('Connected to mongoDB')
  //Defines Port
  server.listen(PORT, ()=>{
    console.log(`Listening on PORT ${PORT}`)
});
}).catch((error)=>{
  console.log(error)
})
