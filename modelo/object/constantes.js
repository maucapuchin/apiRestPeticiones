/* Constantes para la conexion */
exports.mysqlObject = {
    host: process.env.DB_HOST || 'localhost',
    user: process.env.DB_USER || 'xampp',
    password: process.env.DB_PASS || '',
    database: process.env.DB_NAME || 'niam',
    port: process.env.DB_PORT || 3306
}