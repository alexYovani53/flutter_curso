const { usuarioConectado, usuarioDesconectado, grabarMensaje } = require("../controllers/socket");
const { validarToken } = require("../helpers/jwt");
const { io } = require("../index");

// Mensajes de Sockets
io.on("connection", (client) => {


  const [valido, uid] = validarToken(client.handshake.headers.authentication)
  if(!valido) {return client.disconnect();}

  usuarioConectado(uid);

  // Unir el usuario a una sala en particular
  // El usuario estara en la sala global, sala en propia - client.id y una en particular;

  client.join(uid);

  client.on('mensaje-personal', (payload)=>{
    grabarMensaje(payload);
    io.to(payload.para).emit('mensaje-recibido', payload);
  })



  client.on("disconnect", () => {
    console.log("Cliente desconectado");
    usuarioDesconectado(uid);
  });

});
