
import { Context } from './Context'


class BluefinNetworkTokenError extends Error {

  isBluefinNetworkTokenError = true

  sdk = 'BluefinNetworkToken'

  code: string
  ctx: Context

  constructor(code: string, msg: string, ctx: Context) {
    super(msg)
    this.code = code
    this.ctx = ctx
  }

}

export {
  BluefinNetworkTokenError
}

