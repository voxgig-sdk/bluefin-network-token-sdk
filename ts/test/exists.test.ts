
import { test, describe } from 'node:test'
import { equal } from 'node:assert'


import { BluefinNetworkTokenSDK } from '..'


describe('exists', async () => {

  test('test-mode', () => {
    const testsdk = BluefinNetworkTokenSDK.test()
    equal(testsdk instanceof BluefinNetworkTokenSDK, true,
      'BluefinNetworkTokenSDK.test() must return a client synchronously')
  })

})
