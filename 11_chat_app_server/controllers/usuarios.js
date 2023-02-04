
const Usuario = require("../models/usuario")

const getAllUsers =  async (req, resp, next) => {

  const desde = Number(req.query.desde) || 0;

  const usuarios = await Usuario
    .find({ _id: {$ne : req.uid}})
    .sort("-online")
    .skip(desde)
    .limit(10);

  return resp.status(200).json({
    ok: true,
    usuarios
  });
}

module.exports = {
  getAllUsers
}