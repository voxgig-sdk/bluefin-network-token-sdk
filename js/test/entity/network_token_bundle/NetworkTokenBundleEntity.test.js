
const envlocal = __dirname + '/../../../.env.local'
require('dotenv').config({ quiet: true, path: [envlocal] })

const Path = require('node:path')
const Fs = require('node:fs')

const { test, describe, afterEach } = require('node:test')
const assert = require('node:assert')


const { BluefinNetworkTokenSDK, BaseFeature, stdutil, config } = require('../../..')

const {
  envOverride,
  liveClientOptions,
  liveDelay,
  makeCtrl,
  makeMatch,
  makeReqdata,
  makeStepData,
  makeValid,
} = require('../../utility')


describe('NetworkTokenBundleEntity', async () => {

  // Per-test live pacing. Delay is read from sdk-test-control.json's
  // `test.live.delayMs`; only sleeps when BLUEFIN_NETWORK_TOKEN_TEST_LIVE=TRUE.
  afterEach(liveDelay('BLUEFIN_NETWORK_TOKEN_TEST_LIVE'))

  test('instance', async () => {
    const testsdk = BluefinNetworkTokenSDK.test()
    const ent = testsdk.NetworkTokenBundle()
    assert(null != ent)
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

    network_token_bundle_ref01_data = (await network_token_bundle_ref01_ent.create(network_token_bundle_ref01_data)).data()
    assert(null != network_token_bundle_ref01_data.id)


    // LOAD
    const network_token_bundle_ref01_match_dt0 = {}
    network_token_bundle_ref01_match_dt0.id = network_token_bundle_ref01_data.id
    const network_token_bundle_ref01_data_dt0 = (await network_token_bundle_ref01_ent.load(network_token_bundle_ref01_match_dt0)).data()
    assert(network_token_bundle_ref01_data_dt0.id === network_token_bundle_ref01_data.id)


    // REMOVE
    const network_token_bundle_ref01_match_rm0 = {}
    network_token_bundle_ref01_match_rm0.id = network_token_bundle_ref01_data.id
    await network_token_bundle_ref01_ent.remove(network_token_bundle_ref01_match_rm0)
  

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
    'BLUEFIN_NETWORK_TOKEN_APIKEY': '',
  })

  idmap = env['BLUEFIN_NETWORK_TOKEN_TEST_NETWORK_TOKEN_BUNDLE_ENTID']

  if ('TRUE' === env.BLUEFIN_NETWORK_TOKEN_TEST_LIVE) {
    client = new BluefinNetworkTokenSDK(merge([
      // FIRST, so the generated fields below win: sdk-test-control.json's
      // test.client.options adds to the live client, it does not redirect it.
      liveClientOptions(),
      {
        apikey: env.BLUEFIN_NETWORK_TOKEN_APIKEY,
      },
      // 'extra || {}', not a bare 'extra': struct.merge returns UNDEFINED when
      // the last entry is undefined, and basicSetup is normally called with no
      // argument at all - so a bare 'extra' silently discarded the apikey and
      // server values above and handed the SDK undefined.
      extra || {}
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
  
