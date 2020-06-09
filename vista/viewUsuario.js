const conection = require('../controlador/bd/MySQLConexion')
const usuarioSQL = require('../controlador/dao/usuarioDAO')

const err = require('../modelo/object/errors')
/* ************************POST************************ */
/* ViSta de registro de usuario */
function registrarUsuario(params, request, respond){
    conection.connectDB().then(conexion => {
        conexion.beginTransaction(error => {
            if (error) { 
                conexion.end()
                respond.status(400).send(error) 
            }
            usuarioSQL.procesoRegistroUsuario(params, conexion).then(datosUsuario => {
                conexion.commit(error => {
                    if(error){
                        conexion.rollback(() => {
                            conexion.end()
                            respond.status(400).send(error)
                        })
                    }
                    conexion.end()                
                    respond.status(200).send(datosUsuario)
                })
            }).catch(error => {
                conexion.rollback(() => {
                    conexion.end() 
                    respond.status(400).send(error)
                })
            })
        })
    }).catch((error) => {
        conexion.end()
        respond.status(400).send(error)
    })
}
/* ************************GET************************ */
/* ************************UPDATE************************ */
/* ************************DELETE************************ */

/* ************************POST************************ */
exports.registrarUsuario = registrarUsuario
/* ************************GET************************ */
/* ************************UPDATE************************ */
/* ************************DELETE************************ */
