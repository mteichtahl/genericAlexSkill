var Alexa = require('alexa-sdk')
var handlers = require('lib/handle')()

var APP_ID = undefined
var SKILL_NAME = 'alexaSkill'

exports.handler = function (event, context, callback) {
  var alexa = Alexa.handler(event, context)
  alexa.appId = APP_ID

  handlers.init({
    'alexa': alexa
  })

  handlers.register()
  alexa.execute()

  callback(null, 'ok')
}
