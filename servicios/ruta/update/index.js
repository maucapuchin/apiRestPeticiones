'use strict'

const glob = require('glob')
const path = require('path')

module.exports = (app) => {
  glob.sync('./servicios/ruta/update/**/*.js').forEach((file) => {
    if (!file.includes('index.js')) {
      require(path.resolve(file))(app)
    }
  })
}