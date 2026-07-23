package voxgigbluefinnetworktokensdk

import (
	"github.com/voxgig-sdk/bluefin-network-token-sdk/go/core"
	"github.com/voxgig-sdk/bluefin-network-token-sdk/go/entity"
	"github.com/voxgig-sdk/bluefin-network-token-sdk/go/feature"
	_ "github.com/voxgig-sdk/bluefin-network-token-sdk/go/utility"
)

// Type aliases preserve external API.
type BluefinNetworkTokenSDK = core.BluefinNetworkTokenSDK
type Context = core.Context
type Utility = core.Utility
type Feature = core.Feature
type Entity = core.Entity
type BluefinNetworkTokenEntity = core.BluefinNetworkTokenEntity
type FetcherFunc = core.FetcherFunc
type Spec = core.Spec
type Result = core.Result
type Response = core.Response
type Operation = core.Operation
type Control = core.Control
type BluefinNetworkTokenError = core.BluefinNetworkTokenError

// BaseFeature from feature package.
type BaseFeature = feature.BaseFeature

func init() {
	core.NewBaseFeatureFunc = func() core.Feature {
		return feature.NewBaseFeature()
	}
	core.NewTestFeatureFunc = func() core.Feature {
		return feature.NewTestFeature()
	}
	core.NewNetworkTokenBundleEntityFunc = func(client *core.BluefinNetworkTokenSDK, entopts map[string]any) core.BluefinNetworkTokenEntity {
		return entity.NewNetworkTokenBundleEntity(client, entopts)
	}
}

// Constructor re-exports.
var NewBluefinNetworkTokenSDK = core.NewBluefinNetworkTokenSDK
var TestSDK = core.TestSDK
var NewContext = core.NewContext
var NewSpec = core.NewSpec
var NewResult = core.NewResult
var NewResponse = core.NewResponse
var NewOperation = core.NewOperation
var MakeConfig = core.MakeConfig

// No-arg convenience constructors. Go has no default-argument syntax,
// so these aliases let callers write `sdk.New()` / `sdk.Test()`
// instead of `sdk.NewBluefinNetworkTokenSDK(nil)` / `sdk.TestSDK(nil, nil)`
// for the common no-options case.
func New() *BluefinNetworkTokenSDK  { return NewBluefinNetworkTokenSDK(nil) }
func Test() *BluefinNetworkTokenSDK { return TestSDK(nil, nil) }
var NewBaseFeature = feature.NewBaseFeature
var NewTestFeature = feature.NewTestFeature
