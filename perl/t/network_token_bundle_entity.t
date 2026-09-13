#!perl
# NetworkTokenBundle entity test

use strict;
use warnings;
use Test::More;
use FindBin;
use lib "$FindBin::Bin/../lib";
use Cwd ();

use BluefinNetworkTokenSDK;
require(Cwd::abs_path("$FindBin::Bin/runner.pm"));

{
  my $testsdk = BluefinNetworkTokenSDK->test(undef, undef);
  my $ent = $testsdk->NetworkTokenBundle(undef);
  ok(defined $ent, 'network_token_bundle: create instance');
}

BASIC_FLOW: {
  my $setup = network_token_bundle_basic_setup(undef);
  my $_live = $setup->{live} ? 1 : 0;
  # Per-op sdk-test-control.json skip.
  for my $_op (('create', 'load', 'remove')) {
    my ($_should_skip, $_reason) = BluefinNetworkTokenTestRunner::is_control_skipped(
      'entityOp', "network_token_bundle." . $_op, $_live ? 'live' : 'unit');
    if ($_should_skip) {
      note($_reason || 'skipped via sdk-test-control.json');
      pass('network_token_bundle: basic flow skipped via sdk-test-control.json');
      last BASIC_FLOW;
    }
  }
  # The basic flow consumes synthetic IDs from the fixture. In live mode
  # without an *_ENTID env override, those IDs hit the live API and 4xx.
  if ($setup->{synthetic_only}) {
    note('live entity test uses synthetic IDs from fixture - set BLUEFIN_NETWORK_TOKEN_TEST_NETWORK_TOKEN_BUNDLE_ENTID JSON to run live');
    pass('network_token_bundle: basic flow skipped (synthetic IDs only)');
    last BASIC_FLOW;
  }
  my $client = $setup->{client};
  my %V;

  # CREATE
  $V{network_token_bundle_ref01_ent} = $client->NetworkTokenBundle(undef);
  $V{network_token_bundle_ref01_data} = BluefinNetworkTokenHelpers::to_map(BluefinNetworkTokenHelpers::gp(
    BluefinNetworkTokenHelpers::gpath($setup->{data}, 'new.network_token_bundle'), 'network_token_bundle_ref01'));

  $V{network_token_bundle_ref01_data_result} = $V{network_token_bundle_ref01_ent}->create($V{network_token_bundle_ref01_data}, undef);
  $V{network_token_bundle_ref01_data} = BluefinNetworkTokenHelpers::to_map(ref($V{network_token_bundle_ref01_data_result}) && $V{network_token_bundle_ref01_data_result}->can('data_get') ? $V{network_token_bundle_ref01_data_result}->data_get : $V{network_token_bundle_ref01_data_result});
  ok(defined $V{network_token_bundle_ref01_data}, 'network_token_bundle create: data');
  ok(defined $V{network_token_bundle_ref01_data}{id}, 'network_token_bundle create: id');

  # LOAD
  $V{network_token_bundle_ref01_match_dt0} = {
    'id' => $V{network_token_bundle_ref01_data}{id},
  };
  $V{network_token_bundle_ref01_data_dt0_loaded} = $V{network_token_bundle_ref01_ent}->load($V{network_token_bundle_ref01_match_dt0}, undef);
  $V{network_token_bundle_ref01_data_dt0_load_result} = BluefinNetworkTokenHelpers::to_map(ref($V{network_token_bundle_ref01_data_dt0_loaded}) && $V{network_token_bundle_ref01_data_dt0_loaded}->can('data_get') ? $V{network_token_bundle_ref01_data_dt0_loaded}->data_get : $V{network_token_bundle_ref01_data_dt0_loaded});
  ok(defined $V{network_token_bundle_ref01_data_dt0_load_result}, 'network_token_bundle load: data');
  is($V{network_token_bundle_ref01_data_dt0_load_result}{id}, $V{network_token_bundle_ref01_data}{id}, 'network_token_bundle load: id');

  # REMOVE
  $V{network_token_bundle_ref01_match_rm0} = {
    'id' => $V{network_token_bundle_ref01_data}{id},
  };
  $V{network_token_bundle_ref01_ent}->remove($V{network_token_bundle_ref01_match_rm0}, undef);
  pass('network_token_bundle remove: completed');

}

sub network_token_bundle_basic_setup {
  my ($extra) = @_;
  BluefinNetworkTokenTestRunner::load_env_local();

  my $entity_data_file = Cwd::abs_path(
    "$FindBin::Bin/../../.sdk/test/entity/network_token_bundle/NetworkTokenBundleTestData.json");
  my $entity_data = do {
    open my $fh, '<:raw', $entity_data_file or die "Cannot open $entity_data_file: $!";
    local $/;
    Voxgig::Struct::parse_json(<$fh>);
  };

  my $options = {};
  $options->{entity} = $entity_data->{existing};

  my $client = BluefinNetworkTokenSDK->test($options, $extra);

  # Generate idmap via transform.
  my $idmap = Voxgig::Struct::transform(
    ['network_token_bundle01', 'network_token_bundle02', 'network_token_bundle03'],
    {
      '`$PACK`' => ['', {
        '`$KEY`' => '`$COPY`',
        '`$VAL`' => ['`$FORMAT`', 'upper', '`$COPY`'],
      }],
    }
  );

  # Detect ENTID env override before env_override consumes it. When live
  # mode is on without a real override, the basic test runs against
  # synthetic IDs from the fixture and 4xx's. Surface this so the test can
  # skip.
  my $entid_env_raw = $ENV{'BLUEFIN_NETWORK_TOKEN_TEST_NETWORK_TOKEN_BUNDLE_ENTID'};
  my $idmap_overridden = (defined $entid_env_raw && $entid_env_raw =~ /^\s*\{/) ? 1 : 0;

  my $env = BluefinNetworkTokenTestRunner::env_override({
    'BLUEFIN_NETWORK_TOKEN_TEST_NETWORK_TOKEN_BUNDLE_ENTID' => $idmap,
    'BLUEFIN_NETWORK_TOKEN_TEST_LIVE' => 'FALSE',
    'BLUEFIN_NETWORK_TOKEN_TEST_EXPLAIN' => 'FALSE',
    'BLUEFIN_NETWORK_TOKEN_APIKEY' => '',
  });

  my $idmap_resolved = BluefinNetworkTokenHelpers::to_map($env->{'BLUEFIN_NETWORK_TOKEN_TEST_NETWORK_TOKEN_BUNDLE_ENTID'});
  if (!defined $idmap_resolved) {
    $idmap_resolved = BluefinNetworkTokenHelpers::to_map($idmap);
  }

  if ((($env->{'BLUEFIN_NETWORK_TOKEN_TEST_LIVE'}) || '') eq 'TRUE') {
    my $merged_opts = Voxgig::Struct::merge([
      # FIRST, so the generated fields below win: sdk-test-control.json's
      # test.client.options adds to the live client, it does not redirect it.
      BluefinNetworkTokenTestRunner::live_client_options(),
      {
        'apikey' => $env->{'BLUEFIN_NETWORK_TOKEN_APIKEY'},
      },
      (Voxgig::Struct::ismap($extra) ? $extra : {}),
    ]);
    $client = BluefinNetworkTokenSDK->new(BluefinNetworkTokenHelpers::to_map($merged_opts));
  }

  my $live = ((($env->{'BLUEFIN_NETWORK_TOKEN_TEST_LIVE'}) || '') eq 'TRUE') ? 1 : 0;
  return {
    'client' => $client,
    'data' => $entity_data,
    'idmap' => $idmap_resolved,
    'env' => $env,
    'explain' => ((($env->{'BLUEFIN_NETWORK_TOKEN_TEST_EXPLAIN'}) || '') eq 'TRUE') ? 1 : 0,
    'live' => $live,
    'synthetic_only' => ($live && !$idmap_overridden) ? 1 : 0,
    'now' => BluefinNetworkTokenHelpers::now_ms(),
  };
}

done_testing();
