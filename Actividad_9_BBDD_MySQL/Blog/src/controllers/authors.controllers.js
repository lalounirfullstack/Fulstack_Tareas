const AuthorModel = require('../models/author.model')


const getAuthors = async (req, res)=>{
    try{
        const [result] = await AuthorModel.getAllAuthors();
        console.log(result);
        res.json(result)
    }catch(error){
        res.json({
            fatal: `Error: ${error.message}`
        })
    }

}

const getAuthorById = async (req, res) =>{
    const authorId = req.params.id;
    try{
        const [author] = await AuthorModel.selectAuthorById(authorId);
        res.json(author)
    }catch(error){
        res.json({
            fatal: `Error: ${error.message}`
        })
    }
}

const createAuthor = async (req, res)=>{
    try{
        const [result] = await AuthorModel.insertAuthor(req.body);
        const [author] = await AuthorModel.selectAuthorById(result.insertId);
        res.json(author[0]);
    }catch(error){
        res.json({
            fatal: `Error: ${error.message}`
        })
    }
}


const updateAuthor = async (req, res) =>{
    const authorId = req.params.id;
    try{
        const [result] = await AuthorModel.updateAuthorById(authorId, req.body);
        res.json(result)
    }catch(error){
        res.json({
            fatal: `Error: ${error.message}`
        })
    }
}

const deleteAuthor = async (req,res) =>{
    const authorId = req.params.id;
    try{
        const [result] = await AuthorModel.deleteAuthorById(authorId);
        res.json(`User deleted successfully`)
    }catch(error){
        res.json({
            fatal: `Error: ${error.message}`
        })
    }
}

module.exports = { getAuthors, getAuthorById, createAuthor, updateAuthor, deleteAuthor }