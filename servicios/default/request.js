'use strict'

module.exports = (app) => {
    app.use((request, respond) => {
        respond.status(400).send({"response": 2,"data":"No se encontro la informacion solicitada","message":"No se realizo la peticion"})
    })
}