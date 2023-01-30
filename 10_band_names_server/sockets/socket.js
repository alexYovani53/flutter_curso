const { io } = require('../index');
const Band = require('../models/band');

const Bands = require('../models/bands')
const bands = new Bands();

console.log('init-server');

bands.addBand( new Band('Queen'));
bands.addBand( new Band('Bon Jovi'));
bands.addBand( new Band('Heroes del Silencio'));
bands.addBand( new Band('Metallica'));

// Mensajes de Sockets
io.on('connection', client => {
    console.log('Cliente conectado', client.id);

    client.emit('active-bands', bands.getBands());
    
    client.on('disconnect', () => {
        console.log('Cliente desconectado');
    });
    
    client.on('mensaje', ( payload ) => {
        console.log('Mensaje', payload);
        io.emit( 'mensaje', { admin: 'Nuevo mensaje' } );
    });
    
    client.on('vote-band', (payload )=>{
        bands.voteBand(payload.id);
        console.log(bands)
        io.emit('active-bands', bands.getBands());
    })

    client.on('add-band', (payload )=>{
        bands.addBand(new Band(payload.name));
        io.emit('active-bands', bands.getBands());
    })

    // client.on('emitir-mensaje', (payload)=>{
    //     console.log(payload);
    //     io.emit('nuevo-mensaje', payload);  // emite a todos
    //     client.broadcast.emit('nuevo-mensaje', payload);  // emite a todos menos el que lo emitió
    // })
});
