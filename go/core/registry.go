package core

var UtilityRegistrar func(u *Utility)

var NewBaseFeatureFunc func() Feature

var NewTestFeatureFunc func() Feature

var NewNetworkTokenBundleEntityFunc func(client *BluefinNetworkTokenSDK, entopts map[string]any) BluefinNetworkTokenEntity

