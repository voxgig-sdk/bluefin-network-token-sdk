// BluefinNetworkToken SDK exists test.

using Xunit;

using BluefinNetworkTokenSdk;

namespace BluefinNetworkTokenSdk.Test;

public class ExistsTest
{
    [Fact]
    public void TestMode()
    {
        var testsdk = BluefinNetworkTokenSDK.TestSDK(null, null);
        Assert.NotNull(testsdk);
    }
}
