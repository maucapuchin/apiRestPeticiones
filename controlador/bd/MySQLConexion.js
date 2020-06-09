const mysql = require('mysql');
const constante = require('../../modelo/object/constantes');

function connectDB(){
    return  new Promise((resolve, reject) => {
        let connection = mysql.createConnection(constante.mysqlObject);
        connection.connect((error) => {
            if(error){
                console.log("error---");
                console.log(error);
                reject(error);
            }else{
                resolve(connection);
            }
        });
        connection.on('error', function(error) {
            console.log('db error', error);
            if(error.code === 'PROTOCOL_CONNECTION_LOST') { // Connection to the MySQL server is usually
                connectDB().then((connection) => {
                    resolve(connection);
                }).catch((error) =>{
                    reject(error);
                }) // lost due to either server restart, or a
            } else { // connnection idle timeout (the wait_timeout
                reject(error);
                //throw err; // server variable configures this)
            }
        });
    });
}

exports.connectDB = connectDB;