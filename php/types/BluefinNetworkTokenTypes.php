<?php
declare(strict_types=1);

// Typed models for the BluefinNetworkToken SDK.
//
// GENERATED from the API model: main.kit.entity.<e>.fields[] and per-op
// params (op.<name>.points[].args.params[]). Field/param types come from the
// canonical type sentinels via @voxgig/sdkgen canonToType (source of truth:
// @voxgig/apidef VALID_CANON). Do not edit by hand.
//
// These are documentation-grade value objects (PHP 8 typed properties),
// registered on the composer classmap autoload. The SDK boundary exchanges
// assoc-arrays; these classes name the shapes for tooling and typed callers.

/** NetworkTokenBundle entity data model. */
class NetworkTokenBundle
{
    public ?array $card = null;
    public ?string $card_number = null;
    public ?string $expiration_month = null;
    public ?string $expiration_year = null;
    public ?array $issuer = null;
    public ?array $metadata = null;
    public ?array $network_token = null;
    public ?string $network_token_bundle_id = null;
    public ?string $network_token_bundle_state = null;
    public ?string $security_code = null;
}

/** Request payload for NetworkTokenBundle#load. */
class NetworkTokenBundleLoadMatch
{
    public string $id;
}

/** Request payload for NetworkTokenBundle#create. */
class NetworkTokenBundleCreateData
{
    public ?array $card = null;
    public ?string $card_number = null;
    public ?string $expiration_month = null;
    public ?string $expiration_year = null;
    public ?array $issuer = null;
    public ?array $metadata = null;
    public ?array $network_token = null;
    public ?string $network_token_bundle_id = null;
    public ?string $network_token_bundle_state = null;
    public ?string $security_code = null;
}

/** Request payload for NetworkTokenBundle#remove. */
class NetworkTokenBundleRemoveMatch
{
    public string $id;
}

