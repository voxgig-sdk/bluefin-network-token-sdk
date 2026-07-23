# Typed models for the BluefinNetworkToken SDK.
#
# GENERATED from the API model: main.kit.entity.<e>.fields[] and per-op
# params (op.<name>.points[].args.params[]). Member types come from the
# canonical type sentinels. The SDK carries data as string-keyed struct value
# nodes, so each alias is an open string-keyed map; the @typedoc member lists
# document the concrete shapes. Do not edit by hand.

defmodule BluefinNetworkToken.Types do
  @moduledoc """
  Documented shapes for the BluefinNetworkToken SDK entities and operation payloads.

  Every alias resolves to an open string-keyed map because the SDK carries
  data as string-keyed struct value nodes; consult each type's member list for
  the concrete field/param types.
  """

  @typedoc """
  NetworkTokenBundle entity data model.

  Members:
    * `"card"` — map() (optional)
    * `"card_number"` — String.t() (optional)
    * `"expiration_month"` — String.t() (optional)
    * `"expiration_year"` — String.t() (optional)
    * `"issuer"` — map() (optional)
    * `"metadata"` — map() (optional)
    * `"network_token"` — map() (optional)
    * `"network_token_bundle_id"` — String.t() (optional)
    * `"network_token_bundle_state"` — String.t() (optional)
    * `"security_code"` — String.t() (optional)
  """
  @type network_token_bundle :: %{optional(String.t()) => any()}

  @typedoc """
  Request payload for NetworkTokenBundle load.

  Members:
    * `"id"` — String.t() (required)
  """
  @type network_token_bundle_load_match :: %{optional(String.t()) => any()}

  @typedoc """
  Request payload for NetworkTokenBundle create.

  Members:
    * `"card"` — map() (optional)
    * `"card_number"` — String.t() (optional)
    * `"expiration_month"` — String.t() (optional)
    * `"expiration_year"` — String.t() (optional)
    * `"issuer"` — map() (optional)
    * `"metadata"` — map() (optional)
    * `"network_token"` — map() (optional)
    * `"network_token_bundle_id"` — String.t() (optional)
    * `"network_token_bundle_state"` — String.t() (optional)
    * `"security_code"` — String.t() (optional)
  """
  @type network_token_bundle_create_data :: %{optional(String.t()) => any()}

  @typedoc """
  Request payload for NetworkTokenBundle remove.

  Members:
    * `"id"` — String.t() (required)
  """
  @type network_token_bundle_remove_match :: %{optional(String.t()) => any()}

end
