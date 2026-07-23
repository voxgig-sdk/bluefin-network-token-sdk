

class BluefinNetworkTokenError extends Error {

  isBluefinNetworkTokenError = true

  sdk = 'BluefinNetworkToken'

  constructor(code, msg, ctx) {
    super(msg)
    this.code = code
    this.ctx = ctx
  }

}

module.exports = {
  BluefinNetworkTokenError
}

