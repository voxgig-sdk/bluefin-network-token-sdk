# frozen_string_literal: true

# Typed models for the BluefinNetworkToken SDK.
#
# GENERATED from the API model: main.kit.entity.<e>.fields[] and per-op
# params (op.<name>.points[].args.params[]). Member types come from the
# canonical type sentinels via @voxgig/sdkgen canonToType (source of truth:
# @voxgig/apidef VALID_CANON). Ruby types are unenforced; these YARD
# annotations document the shapes. Do not edit by hand.

# NetworkTokenBundle entity data model.
#
# @!attribute [rw] card
#   @return [Hash, nil]
#
# @!attribute [rw] card_number
#   @return [String, nil]
#
# @!attribute [rw] expiration_month
#   @return [String, nil]
#
# @!attribute [rw] expiration_year
#   @return [String, nil]
#
# @!attribute [rw] issuer
#   @return [Hash, nil]
#
# @!attribute [rw] metadata
#   @return [Hash, nil]
#
# @!attribute [rw] network_token
#   @return [Hash, nil]
#
# @!attribute [rw] network_token_bundle_id
#   @return [String, nil]
#
# @!attribute [rw] network_token_bundle_state
#   @return [String, nil]
#
# @!attribute [rw] security_code
#   @return [String, nil]
NetworkTokenBundle = Struct.new(
  :card,
  :card_number,
  :expiration_month,
  :expiration_year,
  :issuer,
  :metadata,
  :network_token,
  :network_token_bundle_id,
  :network_token_bundle_state,
  :security_code,
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
# @!attribute [rw] card_number
#   @return [String, nil]
#
# @!attribute [rw] expiration_month
#   @return [String, nil]
#
# @!attribute [rw] expiration_year
#   @return [String, nil]
#
# @!attribute [rw] issuer
#   @return [Hash, nil]
#
# @!attribute [rw] metadata
#   @return [Hash, nil]
#
# @!attribute [rw] network_token
#   @return [Hash, nil]
#
# @!attribute [rw] network_token_bundle_id
#   @return [String, nil]
#
# @!attribute [rw] network_token_bundle_state
#   @return [String, nil]
#
# @!attribute [rw] security_code
#   @return [String, nil]
NetworkTokenBundleCreateData = Struct.new(
  :card,
  :card_number,
  :expiration_month,
  :expiration_year,
  :issuer,
  :metadata,
  :network_token,
  :network_token_bundle_id,
  :network_token_bundle_state,
  :security_code,
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

