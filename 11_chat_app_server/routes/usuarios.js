/*
    path: api/usuarios

*/
const { Router } = require("express");

const { getAllUsers } = require("../controllers/usuarios");
const { validarJWT } = require("../middlewares/validar-jwt");

const router = Router();

router.get(
  "/", 
  [validarJWT], 
  getAllUsers
);

module.exports = router;
