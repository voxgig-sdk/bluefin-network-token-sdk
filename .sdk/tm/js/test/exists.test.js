
const { test, describe } = require('node:test')
const { equal } = require('node:assert')


const { BluefinNetworkTokenSDK } = require('..')


describe('exists', async () => {

  test('test-mode', async () => {
    const testsdk = await BluefinNetworkTokenSDK.test()
    equal(null !== testsdk, true)
  })

})
