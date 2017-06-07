var _ = require('underscore')

module.exports = function Handle (data) {

  // this properly private stuff.

  var handlers = {}
  var normalizedPath = require('path').join(__dirname, '../handlers')

  function loadHandlers () {
    console.log(`loading handlers from ${normalizedPath}`)

    require('fs').readdirSync(normalizedPath).forEach(function (file) {
      var handlerName = file.split('.')[0]
      console.log(`loading ${handlerName} handler`)
      handlers[handlerName] = require(`${normalizedPath}/${file}`)
      handlers[handlerName].init()
    })

    console.log(`finished loading handlers`)
  }

  return {
    init: function (cb) {
      loadHandlers()
    },
    get: function (name) {
      return handlers[name]
    },
    count: function () {
      return _.size(handlers)
    }
  }
}
