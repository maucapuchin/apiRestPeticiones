const bodyParse = require('body-parser');
const express = require('express');
const morgan = require('morgan');
const app = express();
const dotenv = require('dotenv').config();

if (dotenv.error) {
    console.log('Archivo .env: '+ dotenv.error)
}

//Middleware para ver la peticiones llevadas a cabo
app.use(morgan('dev'));

app.use(bodyParse.json());
app.use(bodyParse.urlencoded({extended:true}));

require('./servicios/ruta/delete')(app)
require('./servicios/ruta/get')(app)
require('./servicios/ruta/notify')(app)
require('./servicios/ruta/post')(app)
require('./servicios/ruta/request')(app)
require('./servicios/ruta/update')(app)

function init (){
    app.listen(16060, () => {
        console.log("El servidor esta escuchando en el puerto 16060");
    })
}

init()