const conexion = require('../bd/MySQLConexion')

/* ********************INSERCIONES*******************INSERCIONES*************INSERCIONES************************ */

function insertarUsuario(params, conexion){   
    return new Promise((resolve, reject) => {
        let consulta = "INSERT INTO usuario (nombre, telefono, correo, tipousuario_id) VALUES (?, ?, ?, ?)"
        conexion.query(consulta, [params.nombre, params.telefono, params.correo, params.tipousuario_id], (error,resultado) =>{
            if(error){
                reject(error)
            }else{
                resolve(resultado)
            }
        })
    })
}

/* ********************SELECT*******************SELECT*************SELECT************************ */

function buscarTelefono(params, conexion){   
    return new Promise((resolve, reject) => {
        let consulta = "SELECT * FROM usuario WHERE telefono = ?"
        conexion.query(consulta, [params.telefono], (error,resultado) =>{
            if(error){
                reject(error)
            }else{
                resolve(resultado)
            }
        })
    })
}

function buscarCorreo(params, conexion){   
    return new Promise((resolve, reject) => {
        let consulta = "SELECT * FROM usuario WHERE correo = ?"
        conexion.query(consulta, [params.correo], (error,resultado) =>{
            if(error){
                reject(error)
            }else{
                resolve(resultado)
            }
        })
    })
}
/* ********************PROCESOS*******************PROCESOS*************PROCESOS************************ */
function procesoRegistroUsuario(params, conexion){
    return new Promise((resolve, reject) => {
        /* Validaciones */
        buscarTelefono(params, conexion).then((telefono) => {
            if (Object.keys(telefono).length != 0) {
                reject({"response": 2, "data": "error", "message": "El telefono ya se encuentra registrado"})
            }
            buscarCorreo(params, conexion).then((correo) => {
                if (Object.keys(correo).length != 0) {
                    reject({"response": 2, "data": "error", "message": "El correo ya se encuentra registrado"})
                }
                insertarUsuario(params, conexion).then((resultado) => {
                    
                    resolve({"response": 1, "data": resultado, "message": "Peticion realizada exitosamente"})
                }).catch((error) => {
                    reject({"response": 0, "data": error, "message": "Error busqueda de usuario"})
                })
            
            }).catch((error) => {
                reject({"response": 0, "data": error, "message": "Error busqueda de usuario"})
            })
        }).catch((error) => {
            reject({"response": 0, "data": error, "message": "Error busqueda de usuario"})
        })
    })
}

exports.buscarTelefono = buscarTelefono
exports.buscarCorreo = buscarCorreo
exports.procesoRegistroUsuario = procesoRegistroUsuario
exports.insertarUsuario = insertarUsuario