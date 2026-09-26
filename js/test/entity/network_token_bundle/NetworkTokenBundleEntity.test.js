
const envlocal = __dirname + '/../../../.env.local'
require('../../utility').loadEnvLocal(envlocal)

const Path = require('node:path')
const Fs = require('node:fs')

const { test, describe, afterEach } = require('node:test')
const assert = require('node:assert')
const { createLiveTransport } = require('../../live-runner')
const { runLiveEntity } = require('../../live-entity')


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


  test('basic', async (t) => {

    
    const setup = basicSetup()
    if (setup.live) {
      return runLiveEntity(setup, {"active":true,"alias":{"field":{}},"fields":{"card":{"a":true,"h":"Card","n":"card","r":false,"t":"`$OBJECT`","key$":"card","index$":0},"cardNumber":{"a":true,"h":"Card Number","n":"cardNumber","r":false,"t":"`$STRING`","key$":"cardNumber","index$":1},"expirationMonth":{"a":true,"h":"Expiration Month","n":"expirationMonth","r":false,"sh":"Two-digit month in which the payment card expires.","t":"`$STRING`","key$":"expirationMonth","index$":2},"expirationYear":{"a":true,"h":"Expiration Year","n":"expirationYear","r":false,"sh":"Four-digit year in which the payment card expires.","t":"`$STRING`","key$":"expirationYear","index$":3},"id":{"a":true,"h":"Id","n":"id","r":false,"t":"`$STRING`","key$":"id","index$":4},"issuer":{"a":true,"h":"Issuer","n":"issuer","r":false,"t":"`$OBJECT`","key$":"issuer","index$":5},"metadata":{"a":true,"h":"Metadata","n":"metadata","r":false,"t":"`$OBJECT`","key$":"metadata","index$":6},"networkToken":{"a":true,"h":"Network Token","n":"networkToken","r":false,"t":"`$OBJECT`","key$":"networkToken","index$":7},"networkTokenBundleId":{"a":true,"h":"Network Token Bundle Id","n":"networkTokenBundleId","r":false,"sh":"Unique identifier for the Instrument Identifier token used in the transaction.","t":"`$STRING`","key$":"networkTokenBundleId","index$":8},"networkTokenBundleState":{"a":true,"h":"Network Token Bundle State","n":"networkTokenBundleState","r":false,"t":"`$STRING`","key$":"networkTokenBundleState","index$":9},"securityCode":{"a":true,"h":"Security Code","n":"securityCode","r":false,"t":"`$STRING`","key$":"securityCode","index$":10}},"id":{"field":"id","name":"id"},"name":"network_token_bundle","op":{"create":{"input":"data","name":"create","points":[{"a":true,"co":{"id":"POST /network-token-bundle","source":"openapi3","version":2},"g":{"header":[{"a":true,"k":"header","n":"scx_client_reference","or":"scx_client_reference","r":true,"t":"`$STRING`","index$":0}]},"k":"http","m":"POST","o":"/network-token-bundle","q":{"exist":["scx_client_reference"]},"r":{},"s":[{"lit":"network-token-bundle"}],"t":{"req":"`reqdata`","res":"`body`"},"index$":0}],"key$":"create"},"load":{"input":"data","name":"load","points":[{"a":true,"co":{"id":"GET /network-token-bundle/{networkTokenBundleId}","source":"openapi3","version":2},"g":{"header":[{"a":true,"k":"header","n":"scx_client_reference","or":"scx_client_reference","r":true,"t":"`$STRING`","index$":0}],"params":[{"a":true,"k":"param","n":"id","or":"network_token_bundle_id","r":true,"t":"`$STRING`","index$":0}]},"k":"http","m":"GET","o":"/network-token-bundle/{networkTokenBundleId}","q":{"exist":["id","scx_client_reference"]},"r":{"param":{"networkTokenBundleId":"id"}},"s":[{"lit":"network-token-bundle"},{"var":"id"}],"t":{"req":"`reqdata`","res":"`body`"},"index$":0},{"a":true,"co":{"id":"GET /network-token-bundle/{networkTokenBundleId}/payment-credentials","source":"openapi3","version":2},"g":{"header":[{"a":true,"k":"header","n":"scx_client_reference","or":"scx_client_reference","r":true,"t":"`$STRING`","index$":0}],"params":[{"a":true,"k":"param","n":"id","or":"network_token_bundle_id","r":true,"t":"`$STRING`","index$":0}]},"k":"http","m":"GET","o":"/network-token-bundle/{networkTokenBundleId}/payment-credentials","q":{"$action":"payment_credential","exist":["id","scx_client_reference"]},"r":{"param":{"networkTokenBundleId":"id"}},"s":[{"lit":"network-token-bundle"},{"var":"id"},{"lit":"payment-credentials"}],"t":{"req":"`reqdata`","res":"`body`"},"index$":1}],"key$":"load"},"remove":{"input":"data","name":"remove","points":[{"a":true,"co":{"id":"DELETE /network-token-bundle/{networkTokenBundleId}","source":"openapi3","version":2},"g":{"header":[{"a":true,"k":"header","n":"scx_client_reference","or":"scx_client_reference","r":true,"t":"`$STRING`","index$":0}],"params":[{"a":true,"k":"param","n":"id","or":"network_token_bundle_id","r":true,"t":"`$STRING`","index$":0}]},"k":"http","m":"DELETE","o":"/network-token-bundle/{networkTokenBundleId}","q":{"exist":["id","scx_client_reference"]},"r":{"param":{"networkTokenBundleId":"id"}},"s":[{"lit":"network-token-bundle"},{"var":"id"}],"t":{"req":"`reqdata`","res":"`body`"},"index$":0}],"key$":"remove"}},"relations":{"ancestors":[]},"key$":"network_token_bundle","name__orig":"network_token_bundle","Name":"NetworkTokenBundle","name_":"network_token_bundle","name-":"network-token-bundle","NAME":"NETWORK_TOKEN_BUNDLE","index$":0}, {"active":true,"entity":"network_token_bundle","key$":"BasicNetworkTokenBundleFlow","kind":"basic","name":"BasicNetworkTokenBundleFlow","param":{},"step":[{"a":true,"d":{},"i":{"ref":"network_token_bundle_ref01"},"m":{},"o":"create","s":[],"v":[],"index$":0},{"a":true,"d":{},"i":{"ref":"network_token_bundle_ref01","srcdatavar":"network_token_bundle_ref01_data","suffix":"_dt0"},"m":{"id":"network_token_bundle01"},"o":"load","s":[],"v":[{"apply":"TextFieldMark","def":{"mark":"Mark01-network_token_bundle_ref01"}}],"index$":1},{"a":true,"d":{},"i":{"ref":"network_token_bundle_ref01","suffix":"_rm0"},"m":{"id":"network_token_bundle01"},"o":"remove","s":[],"v":[],"index$":2}]}, 'NetworkTokenBundle', {"POST /network-token-bundle":{"protocol":"http","requestBody":{"description":" ","content":{"application/json":{"schema":{"type":"object","properties":{"cardNumber":{"type":"string","description":" ","key$":"cardNumber"},"expirationMonth":{"type":"string","maxLength":2,"description":"Two-digit month in which the payment card expires.\n\nFormat: `MM`.\n\nValid values: `01` through `12`. Leading 0 is required.\n\n#### Barclays and Streamline\nFor Maestro (UK Domestic) and Maestro (International) cards on Barclays and Streamline, this must be a valid value\n(`01` through `12`) but is not required to be a valid expiration date. In other words, an expiration date that is\nin the past does not cause CyberSource to reject your request. However, an invalid expiration date might cause\nthe issuer to reject your request.\n\n#### Encoded Account Numbers\nFor encoded account numbers (_type_=039), if there is no expiration date on the card, use `12`.\n\n#### FDMS Nashville\nRequired field.\n\n#### All other processors\nRequired if `pointOfSaleInformation.entryMode=keyed`. However, this field is optional if your account is configured\nfor relaxed requirements for address data and expiration date. **Important** It is your responsibility to determine\nwhether a field is required for the transaction you are requesting.\n\n#### Google Pay transactions\nFor PAN-based Google Pay transactions, this field is returned in the API response.","key$":"expirationMonth"},"expirationYear":{"type":"string","maxLength":4,"description":"Four-digit year in which the payment card expires.\n\nFormat: `YYYY`.\n\n#### Barclays and Streamline\nFor Maestro (UK Domestic) and Maestro (International) cards on Barclays and Streamline, this must be a valid value (`1900` through `3000`) but is not required to be a valid expiration date. In other words, an expiration date that is in the past does not cause CyberSource to reject your request. However, an invalid expiration date might cause the issuer to reject your request.\n\n#### Encoded Account Numbers\nFor encoded account numbers (**_type_**`=039`), if there is no expiration date on the card, use `2021`.\n\n#### FDMS Nashville\nRequired field.\n\n#### FDC Nashville Global and FDMS South\nYou can send in 2 digits or 4 digits. If you send in 2 digits, they must be the last 2 digits of the year.\n\n#### All other processors\nRequired if `pointOfSaleInformation.entryMode=keyed`. However, this field is optional if your account is configured\nfor relaxed requirements for address data and expiration date. **Important** It is your responsibility to determine\nwhether a field is required for the transaction you are requesting.\n\n#### Google Pay transactions\nFor PAN-based Google Pay transactions, this field is returned in the API response.","key$":"expirationYear"},"securityCode":{"type":"string","maxLength":4,"description":" ","key$":"securityCode"}},"x-ref":"#/components/schemas/NetworkTokenBundleCreateRequest","index$":1}}},"required":true},"parameters":[{"name":"scx-client-reference","in":"header","required":true,"description":"","schema":{"type":"string","minLength":2,"maxLength":255},"index$":0}]},"GET /network-token-bundle/{networkTokenBundleId}":{"protocol":"http","parameters":[{"name":"scx-client-reference","in":"header","required":true,"description":"","schema":{"type":"string","minLength":2,"maxLength":255},"index$":0},{"name":"networkTokenBundleId","in":"path","required":true,"description":"","schema":{"type":"string"},"index$":1}]},"GET /network-token-bundle/{networkTokenBundleId}/payment-credentials":{"protocol":"http","parameters":[{"name":"scx-client-reference","in":"header","required":true,"description":"","schema":{"type":"string","minLength":2,"maxLength":255},"index$":0},{"name":"networkTokenBundleId","required":true,"in":"path","description":"","schema":{"type":"string"},"index$":1}]},"DELETE /network-token-bundle/{networkTokenBundleId}":{"protocol":"http","parameters":[{"name":"scx-client-reference","in":"header","required":true,"description":"","schema":{"type":"string","minLength":2,"maxLength":255},"index$":0},{"name":"networkTokenBundleId","in":"path","required":true,"description":"","schema":{"type":"string"},"index$":1}]}})
    }
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

  const live = 'TRUE' === env.BLUEFIN_NETWORK_TOKEN_TEST_LIVE
  const transport = createLiveTransport()
  if (live) {
    const rawIds = process.env['BLUEFIN_NETWORK_TOKEN_TEST_NETWORK_TOKEN_BUNDLE_ENTID']
    idmap = rawIds && rawIds.trim() ? JSON.parse(rawIds) : {}
    if (!idmap || Array.isArray(idmap) || typeof idmap !== 'object') {
      throw new Error('Live ENTID must be a JSON object')
    }
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
      extra || {},
      { system: { fetch: transport.fetch } }
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
    live,
    transport,
    now: Date.now(),
  }

  return setup
}
  
