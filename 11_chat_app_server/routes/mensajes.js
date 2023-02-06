/**
 * 
 * path : /api/mensajes
 */

const { Router } = require("express");

const { mensajes } = require("../controllers/mensajes");
const { validarJWT } = require("../middlewares/validar-jwt");

const router = Router();

router.get(
  "/:de", 
  [validarJWT], 
  mensajes
);

module.exports = router;
