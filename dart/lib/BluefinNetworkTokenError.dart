class BluefinNetworkTokenError extends Error {
  final bool isBluefinNetworkTokenError = true;

  final String sdk = 'BluefinNetworkToken';

  String code;
  String message;
  dynamic ctx;

  // Populated by makeError with the (cleaned) result and spec.
  dynamic result;
  dynamic spec;

  BluefinNetworkTokenError(this.code, this.message, [this.ctx]);

  @override
  String toString() => 'BluefinNetworkTokenError: ' + code + ': ' + message;
}
