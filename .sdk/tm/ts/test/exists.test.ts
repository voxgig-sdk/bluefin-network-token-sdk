
import { test, describe } from 'node:test'
import { equal } from 'node:assert'


import { BluefinNetworkTokenSDK } from '..'


describe('exists', async () => {

  test('test-mode', async () => {
    const testsdk = await BluefinNetworkTokenSDK.test()
    equal(null !== testsdk, true)
  })

})
