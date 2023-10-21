const PostModel = require('../models/post.model')


const getPosts = async (req, res)=>{
    try{
        const [result] = await PostModel.getAllPosts();
        console.log(result);
        res.json(result)
    }catch(error){
        res.json({
            fatal: `Error: ${error.message}`
        })
    }
}

const getPostByAuthorId = async (req, res) =>{
    const authorId = req.params.id;
    try{
        const [author] = await PostModel.selectPostByAuthorId(authorId);
        res.json(author)
    }catch(error){
        res.json({
            fatal: `Error: ${error.message}`
        })
    }
}

const createPost = async (req, res)=>{
    try{
        const [result] = await PostModel.insertPost(req.body);
        const [author] = await PostModel.selectPostByAuthorId(result.insertId);
        res.json(author[0]);
    }catch(error){
        res.json({
            fatal: `Error: ${error.message}`
        })
    }
}


const updatePost = async (req, res) =>{
    const authorId = req.params.id;
    try{
        const [result] = await PostModel.updatePostById(authorId, req.body);
        res.json(result)
    }catch(error){
        res.json({
            fatal: `Error: ${error.message}`
        })
    }
}

const deletePost = async (req,res) =>{
    const authorId = req.params.id;
    try{
        const [result] = await PostModel.deletePostById(authorId);
        res.json(`User deleted successfully`)
    }catch(error){
        res.json({
            fatal: `Error: ${error.message}`
        })
    }
}

module.exports = { getPosts, getPostByAuthorId, createPost, updatePost, deletePost }