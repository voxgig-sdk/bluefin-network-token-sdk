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
    note('live direct-load needs real ID - set *_ENTID env var with real IDs to run');
    pass('direct-load-network_token_bundle: skipped (live)');
    last DIRECT_LOAD;
  }
  my $client = $setup->{client};

  my $params = {};
  my $query = {};
  unless ($setup->{live}) {
    $params->{'id'} = 'direct01';
  }

  my $result = $client->direct({
    'path' => 'network-token-bundle/{id}',
    'method' => 'GET',
    'params' => $params,
    'query' => $query,
  });
  if ($setup->{live}) {
    # Live mode is lenient: synthetic IDs frequently 4xx. Skip rather
    # than fail when the load endpoint isn't reachable with the IDs
    # we can construct from setup idmap.
    if (defined $result->{err}) {
      note("load call failed (likely synthetic IDs against live API): $result->{err}");
      pass('direct-load-network_token_bundle: skipped (live)');
      last DIRECT_LOAD;
    }
    unless ($result->{ok}) {
      note('load call not ok (likely synthetic IDs against live API)');
      pass('direct-load-network_token_bundle: skipped (live)');
      last DIRECT_LOAD;
    }
    my $status = BluefinNetworkTokenHelpers::to_int($result->{status});
    if ($status < 200 || $status >= 300) {
      note("expected 2xx status, got $status");
      pass('direct-load-network_token_bundle: skipped (live)');
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
    'BLUEFIN_NETWORK_TOKEN_APIKEY' => 'NONE',
  });

  my $live = ((($env->{'BLUEFIN_NETWORK_TOKEN_TEST_LIVE'}) || '') eq 'TRUE') ? 1 : 0;

  if ($live) {
    my $client = BluefinNetworkTokenSDK->new({
      'apikey' => $env->{'BLUEFIN_NETWORK_TOKEN_APIKEY'},
    });
    return {
      'client' => $client,
      'calls' => $calls,
      'live' => 1,
      'idmap' => {},
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
