-- Typed models for the BluefinNetworkToken SDK (LuaLS annotations).
--
-- GENERATED from the API model: main.kit.entity.<e>.fields[] and per-op
-- params (op.<name>.points[].args.params[]). Field/param types come from the
-- canonical type sentinels via @voxgig/sdkgen canonToType (source of truth:
-- @voxgig/apidef VALID_CANON). Annotations only — no runtime effect. Do not
-- edit by hand.

---@class NetworkTokenBundle
---@field card? table
---@field card_number? string
---@field expiration_month? string
---@field expiration_year? string
---@field issuer? table
---@field metadata? table
---@field network_token? table
---@field network_token_bundle_id? string
---@field network_token_bundle_state? string
---@field security_code? string

---@class NetworkTokenBundleLoadMatch
---@field id string

---@class NetworkTokenBundleCreateData
---@field card? table
---@field card_number? string
---@field expiration_month? string
---@field expiration_year? string
---@field issuer? table
---@field metadata? table
---@field network_token? table
---@field network_token_bundle_id? string
---@field network_token_bundle_state? string
---@field security_code? string

---@class NetworkTokenBundleRemoveMatch
---@field id string

local M = {}

return M
