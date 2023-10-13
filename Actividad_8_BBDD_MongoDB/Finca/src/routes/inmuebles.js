
const express = require('express');
const router = express.Router();
const InmueblesController = require('../controllers/inmuebles.controller')

router.post('/', InmueblesController.createInmueble)
router.get('/', InmueblesController.getAllInmuebles)
router.get('/:id', InmueblesController.getInmuebleById)
router.put('/:id', InmueblesController.updateInmueble)
router.delete('/:id', InmueblesController.deleteInmueble)

module.exports = router;