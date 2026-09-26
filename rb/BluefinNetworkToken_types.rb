# frozen_string_literal: true

# Typed models for the BluefinNetworkToken SDK.
#
# GENERATED from the API model: main.kit.entity.<e>.fields{} and per-op
# params (op.<name>.points[].g.params[]). Member types come from the
# canonical type sentinels via @voxgig/sdkgen canonToType (source of truth:
# @voxgig/apidef VALID_CANON). Ruby types are unenforced; these YARD
# annotations document the shapes. Do not edit by hand.

# NetworkTokenBundle entity data model.
#
# @!attribute [rw] card
#   @return [Hash, nil]
#
# @!attribute [rw] cardNumber
#   @return [String, nil]
#
# @!attribute [rw] expirationMonth
#   @return [String, nil]
#
# @!attribute [rw] expirationYear
#   @return [String, nil]
#
# @!attribute [rw] id
#   @return [String, nil]
#
# @!attribute [rw] issuer
#   @return [Hash, nil]
#
# @!attribute [rw] metadata
#   @return [Hash, nil]
#
# @!attribute [rw] networkToken
#   @return [Hash, nil]
#
# @!attribute [rw] networkTokenBundleId
#   @return [String, nil]
#
# @!attribute [rw] networkTokenBundleState
#   @return [String, nil]
#
# @!attribute [rw] securityCode
#   @return [String, nil]
NetworkTokenBundle = Struct.new(
  :card,
  :cardNumber,
  :expirationMonth,
  :expirationYear,
  :id,
  :issuer,
  :metadata,
  :networkToken,
  :networkTokenBundleId,
  :networkTokenBundleState,
  :securityCode,
  keyword_init: true
)

# Request payload for NetworkTokenBundle#load.
#
# @!attribute [rw] id
#   @return [String]
NetworkTokenBundleLoadMatch = Struct.new(
  :id,
  keyword_init: true
)

# Request payload for NetworkTokenBundle#create.
#
# @!attribute [rw] card
#   @return [Hash, nil]
#
# @!attribute [rw] cardNumber
#   @return [String, nil]
#
# @!attribute [rw] expirationMonth
#   @return [String, nil]
#
# @!attribute [rw] expirationYear
#   @return [String, nil]
#
# @!attribute [rw] id
#   @return [String, nil]
#
# @!attribute [rw] issuer
#   @return [Hash, nil]
#
# @!attribute [rw] metadata
#   @return [Hash, nil]
#
# @!attribute [rw] networkToken
#   @return [Hash, nil]
#
# @!attribute [rw] networkTokenBundleId
#   @return [String, nil]
#
# @!attribute [rw] networkTokenBundleState
#   @return [String, nil]
#
# @!attribute [rw] securityCode
#   @return [String, nil]
NetworkTokenBundleCreateData = Struct.new(
  :card,
  :cardNumber,
  :expirationMonth,
  :expirationYear,
  :id,
  :issuer,
  :metadata,
  :networkToken,
  :networkTokenBundleId,
  :networkTokenBundleState,
  :securityCode,
  keyword_init: true
)

# Request payload for NetworkTokenBundle#remove.
#
# @!attribute [rw] id
#   @return [String]
NetworkTokenBundleRemoveMatch = Struct.new(
  :id,
  keyword_init: true
)

