#!perl
# NetworkTokenBundle direct test

use strict;
use warnings;
use Test::More;
use FindBin;
use lib "$FindBin::Bin/../lib";
use Cwd ();

use BluefinNetworkTokenSDK;
require(Cwd::abs_path("$FindBin::Bin/runner.pm"));

# main.kit.test.live.strict is true (the default is true): a live
# request that fails, or a live test missing an input it needs,
# fails the test.
# An account with no record for a test to read skips it either way.
use constant LIVE_STRICT => 1;

sub live_ok {
  my ($result) = @_;
  my $status = BluefinNetworkTokenHelpers::to_int($result->{status});
  return !defined $result->{err} && $result->{ok} && $status >= 200 && $status < 300;
}

DIRECT_LOAD: {
  my $setup = network_token_bundle_direct_setup({ 'id' => 'direct01' });
  my ($_should_skip, $_reason) = BluefinNetworkTokenTestRunner::is_control_skipped(
    'direct', 'direct-load-network_token_bundle', $setup->{live} ? 'live' : 'unit');
  if ($_should_skip) {
    note($_reason || 'skipped via sdk-test-control.json');
    pass('direct-load-network_token_bundle: skipped via sdk-test-control.json');
    last DIRECT_LOAD;
  }
  if ($setup->{live}) {
    my @missing = grep { !defined $setup->{idmap}{$_} } ('network_token_bundle01');
    if (@missing) {
      BluefinNetworkTokenTestRunner::live_miss(LIVE_STRICT, 'direct-load-network_token_bundle', 'Live test blocked: needs ' . join(', ', @missing) . ' via BLUEFIN_NETWORK_TOKEN_TEST_NETWORK_TOKEN_BUNDLE_ENTID');
      last DIRECT_LOAD;
    }
  }
  my $client = $setup->{client};

  my $params = {};
  my $query = {};
  if ($setup->{live}) {
    $params->{'id'} = $setup->{idmap}{'network_token_bundle01'};
  }
  else {
    $params->{'id'} = 'direct01';
  }

  my $result = $client->direct({
    'path' => 'network-token-bundle/{id}',
    'method' => 'GET',
    'params' => $params,
    'query' => $query,
  });
  if ($setup->{live}) {
    if (!live_ok($result)) {
      BluefinNetworkTokenTestRunner::live_miss(LIVE_STRICT, 'direct-load-network_token_bundle', 'Live load failed: ' . BluefinNetworkTokenTestRunner::live_describe($result));
      last DIRECT_LOAD;
    }
    if (!defined $result->{data}) {
      BluefinNetworkTokenTestRunner::live_miss(LIVE_STRICT, 'direct-load-network_token_bundle', 'Live load returned no data: ' . BluefinNetworkTokenTestRunner::live_describe($result));
      last DIRECT_LOAD;
    }
    pass('direct-load-network_token_bundle: live ok');
  }
  else {
    ok(!defined $result->{err}, 'direct-load-network_token_bundle: no error');
    ok($result->{ok}, 'direct-load-network_token_bundle: ok');
    is(BluefinNetworkTokenHelpers::to_int($result->{status}), 200, 'direct-load-network_token_bundle: status');
    ok(defined $result->{data}, 'direct-load-network_token_bundle: data');
    if (Voxgig::Struct::ismap($result->{data})) {
      is($result->{data}{id}, 'direct01', 'direct-load-network_token_bundle: id');
    }
    is(scalar @{ $setup->{calls} }, 1, 'direct-load-network_token_bundle: 1 call');
  }
}


sub network_token_bundle_direct_setup {
  my ($mockres) = @_;
  BluefinNetworkTokenTestRunner::load_env_local();

  my $calls = [];

  my $env = BluefinNetworkTokenTestRunner::env_override({
    'BLUEFIN_NETWORK_TOKEN_TEST_NETWORK_TOKEN_BUNDLE_ENTID' => {},
    'BLUEFIN_NETWORK_TOKEN_TEST_LIVE' => 'FALSE',
    'BLUEFIN_NETWORK_TOKEN_APIKEY' => '',
  });

  my $live = ((($env->{'BLUEFIN_NETWORK_TOKEN_TEST_LIVE'}) || '') eq 'TRUE') ? 1 : 0;

  if ($live) {
    # live_client_options() FIRST so the generated fields below win:
    # sdk-test-control.json's test.client.options adds to the live client,
    # it does not redirect it (a later key wins in a Perl hash literal).
    my $client = BluefinNetworkTokenSDK->new({
      %{ BluefinNetworkTokenTestRunner::live_client_options() },
      'apikey' => $env->{'BLUEFIN_NETWORK_TOKEN_APIKEY'},
    });
    my $idmap = $env->{'BLUEFIN_NETWORK_TOKEN_TEST_NETWORK_TOKEN_BUNDLE_ENTID'};
    return {
      'client' => $client,
      'calls' => $calls,
      'live' => 1,
      'idmap' => ref $idmap eq 'HASH' ? $idmap : {},
    };
  }

  my $mock_fetch = sub {
    my ($url, $init) = @_;
    push @$calls, { 'url' => $url, 'init' => $init };
    return ({
      'status' => 200,
      'statusText' => 'OK',
      'headers' => {},
      'json' => sub {
        return defined $mockres ? $mockres : { 'id' => 'direct01' };
      },
      'body' => 'mock',
    }, undef);
  };

  my $client = BluefinNetworkTokenSDK->new({
    'base' => 'http://localhost:8080',
    'system' => {
      'fetch' => $mock_fetch,
    },
  });

  return {
    'client' => $client,
    'calls' => $calls,
    'live' => 0,
    'idmap' => {},
  };
}

done_testing();
