//Crear Inmueble
const Inmueble = require("../models/inmuebles");

//CRUD Actions
//Create (POST)
const createInmueble = async (req, res) =>{
    try{
        console.log(req.body);
        const inmueble = await Inmueble.create(req.body);
        res.status(200).json(inmueble);
    } catch(error){
        console.log(`Error: ${error.message}`);
        res.status(500).json({message: error.message})
    }
}

//Read (GET)
const getAllInmuebles = async (req, res)=>{
     try{
      const inmuebles = await Inmueble.find({})
      res.status(200).json(inmuebles);
    }catch(error){
     console.log(`Error: ${error.message}`);
     res.status(500).json({message: error.message})
  }
}

const getInmuebleById = async (req, res)=>{
    try{
    //Deconstruct ID from Params to get ID
    const {id} = req.params;
    const inmueble = await Inmueble.findById(id);
    res.status(200).json(inmueble);
  } catch(error){
    console.log(`Error: ${error.message}`);
    res.status(500).json({message: error.message})
  }
}

//Update
const updateInmueble = async (req, res)=>{
    try{
      //Destructuring from Params to get ID
      const {id} = req.params;
      const inmueble = await Inmueble.findByIdAndUpdate(id, req.body);
      if(!inmueble){
        return res.status(404).json({message: `Inmueble ${inmueble} cannot be found`});
      }
      const updatedInmueble = await Inmueble.findById(id);
      res.status(200).json(updatedInmueble);

    }catch(error){
      console.log(`Error: ${error.message}`)
      res.status(500).json({message: error.message})
    }
}

//Delete
const deleteInmueble = async (req, res)=>{
    try{
      //Decounstruct From Params to get ID
      const {id} = req.params;
      const inmueble = await Inmueble.findByIdAndDelete(id);
      if(!inmueble){
        return res.status(404).json({message: `Inmueble ${inmueble} cannot be found`});
      }
      res.status(200).json(inmueble);
    }catch(error){
      console.log(`Error: ${error.message}`)
      res.status(500).json({message: error.message})
    }
}


module.exports = {createInmueble, getAllInmuebles, getInmuebleById, updateInmueble, deleteInmueble}