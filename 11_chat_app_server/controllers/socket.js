const Usuario = require("../models/usuario");
const Mensaje = require("../models/mensaje");

const usuarioConectado = async (uid = '') => {

  const usuarioEncontrado = await Usuario.findById(uid );
  usuarioEncontrado.online = true;
  await usuarioEncontrado.save();
  return usuarioConectado;
}

const usuarioDesconectado = async (uid = '') => {
  const usuarioEncontrado = await Usuario.findById(uid );

  usuarioEncontrado.online = false;
  await usuarioEncontrado.save();
  return usuarioConectado;
}

const grabarMensaje = async (payload) =>{
  try {
    /**
     * {
     *    de: '', 
     *    para: '', 
     *    mensaje: ''
     * }
     * 
     */

    const mensajeNuevo = new Mensaje(payload);
    mensajeNuevo.save();

    return true;
  } catch (error) {
    return false;
  }
}


module.exports = {
  usuarioConectado, 
  usuarioDesconectado, 
  grabarMensaje
}