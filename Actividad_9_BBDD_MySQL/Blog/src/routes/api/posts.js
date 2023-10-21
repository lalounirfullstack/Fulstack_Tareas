const PostsController = require("../../controllers/posts.controllers");
const router = require('express').Router();

router.get('/', PostsController.getPosts);
router.get('/:id', PostsController.getPostByAuthorId);
router.post('/', PostsController.createPost)
router.put('/:id', PostsController.updatePost)
router.delete('/:id', PostsController.deletePost)

module.exports = router;