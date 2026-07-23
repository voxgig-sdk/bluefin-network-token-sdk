<?php
declare(strict_types=1);

// BluefinNetworkToken SDK exists test

require_once __DIR__ . '/../bluefinnetworktoken_sdk.php';

use PHPUnit\Framework\TestCase;

class ExistsTest extends TestCase
{
    public function test_create_test_sdk(): void
    {
        $testsdk = BluefinNetworkTokenSDK::test(null, null);
        $this->assertNotNull($testsdk);
    }
}
