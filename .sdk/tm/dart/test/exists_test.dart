import 'harness.dart';

import '../lib/BluefinNetworkTokenSDK.dart';

void tests() {
  describe('exists', () {
    test('test-mode', (t) async {
      final testsdk = BluefinNetworkTokenSDK.test();
      equal(true, null != testsdk);
    });
  });
}
