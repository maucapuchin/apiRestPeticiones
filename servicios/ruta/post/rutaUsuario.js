const _ = require('underscore')
const view = require('../../../vista/viewUsuario')
const PATH = '/registro'
const ESPACIOS = /\S/

const rateLimit = require('express-rate-limit');
const apiLimiter = rateLimit({
    //windowMs: 5 * 60 * 1000, //duración de la ventana de tiempo
    max: 1 //peticiones por up dentro de la ventana de tiempo
});

module.exports = (app) => {

    /* Ruta de registro de usuario */
    app.post(`${PATH}/usuario`, apiLimiter, (request, respond) => {
        console.log(app)
        let params = request.body.param 
        const longTelefono = /^\d{10}$/
        /* Validacion de parametros */
        if (!params) {
            respond.status(400).send({"response": 2,"data":"no se recibio informacion","message":"No se realizo la peticion"})
        } else {
            if (!_.isObject(params) && params !== '') {
                params = JSON.parse(params)
            }
                if (!_.isNull(params)) {
                    if ((params.nombre != undefined && ESPACIOS.test(params.nombre)) &&
                    (params.telefono != undefined && ESPACIOS.test(params.telefono)) &&
                    (params.correo != undefined && ESPACIOS.test(params.correo)) &&
                    (params.tipousuario_id != undefined && ESPACIOS.test(params.tipousuario_id))) {
                    if (longTelefono.test(params.telefono)) {
                        console.log(params.telefono)
                        if (/^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,4})+$/.test(params.correo)) {
                            view.registrarUsuario((params), request, respond) 
                        } else {
                            respond.status(400).send({"response": 2, "data": "error", "message": "Formato de correo incorrecto"})
                        }
                    } else {
                        respond.status(400).send({"response": 2, "data": "error", "message": "El número debe contener 10 digitos"})
                    }
                }else {
                    respond.status(400).send({"response": 2, "data": "error", "message": "Parametros no definidos"})
                }
            }
        }

        
        
        
    });
}