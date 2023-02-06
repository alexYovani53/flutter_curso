const Mensaje = require('../models/mensaje')


const mensajes = async (req, resp, next) =>{

  const miId = req.uid;
  const mensajesDe = req.params.de;

  const last30 = await Mensaje.find({
    $or: [{de: miId, para: mensajesDe}, {de: mensajesDe, para: miId}]
  })
    .sort({createdAt: 'desc'})
    .limit(30);

  return resp.status(200).json({
    ok: true,
    mensajes: last30
  });

}

module.exports = {
  mensajes
}