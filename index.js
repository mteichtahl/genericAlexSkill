var Alexa = require('alexa-sdk')
var handlers = require('lib/handle')()

var states = {
  GUESSMODE: '_GUESSMODE', // User is trying to guess the number.
  STARTMODE: '_STARTMODE' // Prompt the user to start or restart the game.
}

exports.handler = function (event, context, callback) {
  var alexa = Alexa.handler(event, context, callback)

  handlers.init()

  console.log(`loaded ${handlers.count()} handlers`)

  callback(null, 'ok')
}
