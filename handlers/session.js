module.exports = {
  'init': function () {
    console.log('init session handler')
  },
  'handlers': function () {
    return {
      'LaunchRequest': function () {},
      'IntentRequest': function () {
        this.emit(':tell', 'IntentRequest', false)
      },
      'Unhandled': function () {
        this.emit(':tell', 'Unhandled', true)
      }
    }
  }
}
