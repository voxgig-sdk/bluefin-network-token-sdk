-- Typed models for the BluefinNetworkToken SDK (LuaLS annotations).
--
-- GENERATED from the API model: main.kit.entity.<e>.fields{} and per-op
-- params (op.<name>.points[].g.params[]). Field/param types come from the
-- canonical type sentinels via @voxgig/sdkgen canonToType (source of truth:
-- @voxgig/apidef VALID_CANON). Annotations only — no runtime effect. Do not
-- edit by hand.

---@class NetworkTokenBundle
---@field card? table
---@field cardNumber? string
---@field expirationMonth? string
---@field expirationYear? string
---@field id? string
---@field issuer? table
---@field metadata? table
---@field networkToken? table
---@field networkTokenBundleId? string
---@field networkTokenBundleState? string
---@field securityCode? string

---@class NetworkTokenBundleLoadMatch
---@field id string

---@class NetworkTokenBundleCreateData
---@field card? table
---@field cardNumber? string
---@field expirationMonth? string
---@field expirationYear? string
---@field id? string
---@field issuer? table
---@field metadata? table
---@field networkToken? table
---@field networkTokenBundleId? string
---@field networkTokenBundleState? string
---@field securityCode? string

---@class NetworkTokenBundleRemoveMatch
---@field id string

local M = {}

return M
