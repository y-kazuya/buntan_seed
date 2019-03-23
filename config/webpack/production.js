process.env.NODE_ENV = process.env.NODE_ENV || 'production'

const environment = require('./environment')

module.exports = environment.toWebpackConfig()

module.exports = Object.assign({}, environment.toWebpackConfig(), {
  resolve: {
    alias: {
      'vue$': 'vue/dist/vue.common.js'
    }
  }
})