    
    function ok(data) {
        let object = {response: {code: 0, data: data, message: 'Petición realizada exitosamente'}, status: 200}
        return object
    }

    function requestValidation(message) {
        let object = {response: {code: 21, data: 'error', message: message}, status: 400}
        return object
    }

    function requestNotExist(message) {
        let object = {response: {code: 22, data: 'S/R', message: message}, status: 400}
        return object
    }

    function requestDuplicated(message) {
        let object = {response: {code: 23, data: 'error', message: message}, status: 400}
        return object
    }

    function requestNoResult(message) {
        let object = {response: {code: 24, data: 'S/R', message: message}, status: 400}
        return object
    }

    function requestAutentication(message) {
        let object = {response: {code: 25, data: 'No Autorizado', message: message}, status: 401}
        return object
    }

    function requestRutaValidation(response, message) {
        return response.status(400).json({code: 20, data: 'S/R', message: message})
    }

    function server(data) {
        let object = {response: {code: 11, data: data, message: 'Error rn la secuencia del proceso'}, status: 500}
        return object
    }

    function serverQuery(data, message) {
        let object = {response: {code: 12, data: data, message: message}, status: 500}
        return object
    }
    
    function serverTime(data) {
        let object = {response: {code: 13, data: data, message: 'Tiempo de espera excedido'}, status: 504}
        return object
    }
    
    function serverProcess(data) {
        let object = {response: {code: 15, data: data, message: 'Error interno del servidor'}, status: 500}
        return object
    }

    function serverMcrypt(data) {
        let object = {response: {code: 16, data: data, message: 'Error interno del servidor'}, status: 500}
        return object
    }
    
    
    exports.ok = ok
    exports.requestValidation = requestValidation
    exports.requestNotExist = requestNotExist
    exports.requestDuplicated = requestDuplicated
    exports.requestNoResult = requestNoResult
    exports.requestAutentication = requestAutentication
    exports.requestRutaValidation = requestRutaValidation
    exports.server = server
    exports.serverQuery = serverQuery
    exports.serverTime = serverTime
    exports.serverProcess = serverProcess
    exports.serverMcrypt = serverMcrypt
