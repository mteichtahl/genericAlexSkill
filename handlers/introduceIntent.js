module.exports = {
  'init': function () {
    console.log('introduceIntent handler')
  },
  'handlers': function () {
    return {
      'IntroduceIntent': function () {
        this.emit(':tell', 'hello', true)
      }
    }
  }
}
