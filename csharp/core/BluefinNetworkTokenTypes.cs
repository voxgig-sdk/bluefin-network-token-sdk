// Typed reference models for the BluefinNetworkToken SDK.
//
// GENERATED from the API model: main.kit.entity.<e>.fields[] and per-op
// params (op.<name>.points[].args.params[]). Field/param types come from the
// canonical type sentinels (source of truth: @voxgig/apidef VALID_CANON). Do
// not edit by hand.
//
// These records are documentation/DX reference shapes ONLY. The SDK ops take
// and return the loose object model (Dictionary<string, object?> / object?) at
// runtime, so these types are not wired into the op signatures — use them to
// describe a payload before converting it to a dictionary. Optional (req:false)
// keys are modelled as nullable properties.

namespace BluefinNetworkTokenSdk.Types;

public record NetworkTokenBundle
{
    public Dictionary<string, object?>? card { get; init; }
    public string? cardNumber { get; init; }
    public string? expirationMonth { get; init; }
    public string? expirationYear { get; init; }
    public Dictionary<string, object?>? issuer { get; init; }
    public Dictionary<string, object?>? metadata { get; init; }
    public Dictionary<string, object?>? networkToken { get; init; }
    public string? networkTokenBundleId { get; init; }
    public string? networkTokenBundleState { get; init; }
    public string? securityCode { get; init; }
}

public record NetworkTokenBundleLoadMatch
{
    public string id { get; init; }
}

public record NetworkTokenBundleCreateData
{
    public Dictionary<string, object?>? card { get; init; }
    public string? cardNumber { get; init; }
    public string? expirationMonth { get; init; }
    public string? expirationYear { get; init; }
    public Dictionary<string, object?>? issuer { get; init; }
    public Dictionary<string, object?>? metadata { get; init; }
    public Dictionary<string, object?>? networkToken { get; init; }
    public string? networkTokenBundleId { get; init; }
    public string? networkTokenBundleState { get; init; }
    public string? securityCode { get; init; }
}

public record NetworkTokenBundleRemoveMatch
{
    public string id { get; init; }
}

