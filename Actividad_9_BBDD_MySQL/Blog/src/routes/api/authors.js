const router = require('express').Router();
const AuthorsController = require('../../controllers/authors.controllers')


router.get('/', AuthorsController.getAuthors);
router.get('/:id', AuthorsController.getAuthorById);
router.post('/', AuthorsController.createAuthor)
router.put('/:id', AuthorsController.updateAuthor)
router.delete('/:id', AuthorsController.deleteAuthor)


module.exports = router;