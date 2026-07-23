
const envlocal = __dirname + '/../../../.env.local'
require('dotenv').config({ quiet: true, path: [envlocal] })

const Path = require('node:path')
const Fs = require('node:fs')

const { test, describe } = require('node:test')
const assert = require('node:assert')


const { BluefinNetworkTokenSDK, BaseFeature, stdutil, config } = require('../../..')

const {
  envOverride,
  makeCtrl,
  makeMatch,
  makeReqdata,
  makeStepData,
  makeValid,
} = require('../../utility')


describe('NetworkTokenBundleEntity', async () => {

  test('instance', async () => {
    const testsdk = BluefinNetworkTokenSDK.test()
    const ent = testsdk.NetworkTokenBundle()
    assert(null != ent)
  })


  // Feature #4: the entity `stream(action, ...)` method runs the op pipeline
  // and returns an async iterator over result items. With the streaming
  // feature active it yields the feature's incremental output; otherwise it
  // falls back to the materialised list so `stream` always yields.
  test('stream', async () => {
    const seed = {
      entity: {
        network_token_bundle: { s1: { id: 's1' }, s2: { id: 's2' }, s3: { id: 's3' } }
      }
    }

    // Fallback: streaming inactive -> yields the materialised list items.
    const base = BluefinNetworkTokenSDK.test(seed)
    const seen = []
    for await (const item of base.NetworkTokenBundle().stream('list')) {
      seen.push(item)
    }
    assert.equal(seen.length, 3)

    // Inbound: streaming active -> yields each item from the feature iterator.
    if (config.feature && config.feature.streaming) {
      const sdk = BluefinNetworkTokenSDK.test(seed, { feature: { streaming: { active: true } } })
      const got = []
      for await (const item of sdk.NetworkTokenBundle().stream('list')) {
        if (Array.isArray(item)) { got.push(...item) } else { got.push(item) }
      }
      assert.equal(got.length, 3)
    }
  })


  test('basic', async () => {

    const setup = basicSetup()
    const client = setup.client
    const struct = setup.struct

    const isempty = struct.isempty
    const select = struct.select


    // CREATE
    const network_token_bundle_ref01_ent = client.NetworkTokenBundle()
    let network_token_bundle_ref01_data = setup.data.new.network_token_bundle['network_token_bundle_ref01']

    network_token_bundle_ref01_data = await network_token_bundle_ref01_ent.create(network_token_bundle_ref01_data)
    assert(null != network_token_bundle_ref01_data)


    // LOAD
    const network_token_bundle_ref01_match_dt0 = {}
    const network_token_bundle_ref01_data_dt0 = await network_token_bundle_ref01_ent.load(network_token_bundle_ref01_match_dt0)
    assert(null != network_token_bundle_ref01_data_dt0)



  })
})



function basicSetup(extra) {
  // TODO: fix test def options
  const options = {} // null

  // TODO: needs test utility to resolve path
  const entityDataFile =
    Path.resolve(__dirname,
      '../../../../.sdk/test/entity/network_token_bundle/NetworkTokenBundleTestData.json')

  // TODO: file ready util needed?
  const entityDataSource = Fs.readFileSync(entityDataFile).toString('utf8')

  // TODO: need a xlang JSON parse utility in voxgig/struct with better error msgs
  const entityData = JSON.parse(entityDataSource)

  options.entity = entityData.existing

  let client = BluefinNetworkTokenSDK.test(options, extra)
  const struct = client.utility().struct
  const merge = struct.merge
  const transform = struct.transform

  let idmap = transform(
    ['network_token_bundle01','network_token_bundle02','network_token_bundle03'],
    {
      '`$PACK`': ['', {
        '`$KEY`': '`$COPY`',
        '`$VAL`': ['`$FORMAT`', 'upper', '`$COPY`']
      }]
    })

  const env = envOverride({
    'BLUEFIN_NETWORK_TOKEN_TEST_NETWORK_TOKEN_BUNDLE_ENTID': idmap,
    'BLUEFIN_NETWORK_TOKEN_TEST_LIVE': 'FALSE',
    'BLUEFIN_NETWORK_TOKEN_TEST_EXPLAIN': 'FALSE',
    'BLUEFIN_NETWORK_TOKEN_APIKEY': 'NONE',
  })

  idmap = env['BLUEFIN_NETWORK_TOKEN_TEST_NETWORK_TOKEN_BUNDLE_ENTID']

  if ('TRUE' === env.BLUEFIN_NETWORK_TOKEN_TEST_LIVE) {
    client = new BluefinNetworkTokenSDK(merge([
      {
        apikey: env.BLUEFIN_NETWORK_TOKEN_APIKEY,
      },
      extra
    ]))
  }

  const setup = {
    idmap,
    env,
    options,
    client,
    struct,
    data: entityData,
    explain: 'TRUE' === env.BLUEFIN_NETWORK_TOKEN_TEST_EXPLAIN,
    now: Date.now(),
  }

  return setup
}
  
