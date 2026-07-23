// BluefinNetworkToken SDK utility: makeContext.

namespace BluefinNetworkTokenSdk.Util;

public static partial class SdkUtility
{
    internal static Context MakeContextUtil(Dictionary<string, object?>? ctxmap, Context? basectx)
    {
        return new Context(ctxmap, basectx);
    }
}
