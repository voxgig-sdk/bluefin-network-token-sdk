<?php
declare(strict_types=1);

// BluefinNetworkToken SDK base feature

class BluefinNetworkTokenBaseFeature
{
    public string $version;
    public string $name;
    public bool $active;

    // Positions this feature when added via the client `extend` option:
    // "__before__" / "__after__" / "__replace__" name an already-added
    // feature (mirrors the ts feature `_options`). Declared so setting it
    // on an extension instance avoids the dynamic-property deprecation.
    public ?array $_options = null;

    public function __construct()
    {
        $this->version = '0.0.1';
        $this->name = 'base';
        $this->active = true;
    }

    public function get_version(): string { return $this->version; }
    public function get_name(): string { return $this->name; }
    public function get_active(): bool { return $this->active; }

    public function init(BluefinNetworkTokenContext $ctx, array $options): void {}
    public function PostConstruct(BluefinNetworkTokenContext $ctx): void {}
    public function PostConstructEntity(BluefinNetworkTokenContext $ctx): void {}
    public function SetData(BluefinNetworkTokenContext $ctx): void {}
    public function GetData(BluefinNetworkTokenContext $ctx): void {}
    public function GetMatch(BluefinNetworkTokenContext $ctx): void {}
    public function SetMatch(BluefinNetworkTokenContext $ctx): void {}
    public function PrePoint(BluefinNetworkTokenContext $ctx): void {}
    public function PreSpec(BluefinNetworkTokenContext $ctx): void {}
    public function PreRequest(BluefinNetworkTokenContext $ctx): void {}
    public function PreResponse(BluefinNetworkTokenContext $ctx): void {}
    public function PreResult(BluefinNetworkTokenContext $ctx): void {}
    public function PreDone(BluefinNetworkTokenContext $ctx): void {}
    public function PreUnexpected(BluefinNetworkTokenContext $ctx): void {}
}
