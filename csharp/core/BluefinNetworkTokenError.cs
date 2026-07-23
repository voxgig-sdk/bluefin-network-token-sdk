// BluefinNetworkTokenError - the SDK error type. Carries the pipeline error code,
// the originating context and cleaned result/spec snapshots.

namespace BluefinNetworkTokenSdk;

public class BluefinNetworkTokenError : Exception
{
    public bool IsBluefinNetworkTokenError = true;
    public string Sdk = "BluefinNetworkToken";
    public string Code;
    public Context? Ctx;
    public object? ResultVal;
    public object? SpecVal;

    public BluefinNetworkTokenError(string code, string msg, Context? ctx)
        : base(msg)
    {
        Code = code;
        Ctx = ctx;
    }
}
