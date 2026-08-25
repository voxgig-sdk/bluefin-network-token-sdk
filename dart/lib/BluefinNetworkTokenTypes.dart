// Typed models for the BluefinNetworkToken SDK.
//
// GENERATED from the API model: main.kit.entity.<e>.fields[] and per-op
// params (op.<name>.points[].args.params[]). Field/param types come from the
// canonical type sentinels (source of truth: @voxgig/apidef VALID_CANON).
// Do not edit by hand.
//
// The operation pipeline passes plain maps; these classes are the typed,
// convertible view: `BluefinNetworkToken.fromMap(ent.data())` / `model.toMap()`.

class NetworkTokenBundle {
  /// OBJECT
  Map<String, dynamic>? card;
  /// STRING
  String? cardNumber;
  /// STRING
  String? expirationMonth;
  /// STRING
  String? expirationYear;
  /// STRING
  String? id;
  /// OBJECT
  Map<String, dynamic>? issuer;
  /// OBJECT
  Map<String, dynamic>? metadata;
  /// OBJECT
  Map<String, dynamic>? networkToken;
  /// STRING
  String? networkTokenBundleId;
  /// STRING
  String? networkTokenBundleState;
  /// STRING
  String? securityCode;

  NetworkTokenBundle({
    this.card,
    this.cardNumber,
    this.expirationMonth,
    this.expirationYear,
    this.id,
    this.issuer,
    this.metadata,
    this.networkToken,
    this.networkTokenBundleId,
    this.networkTokenBundleState,
    this.securityCode,
  });

  factory NetworkTokenBundle.fromMap(Map<String, dynamic> m) => NetworkTokenBundle(
        card: m['card'] is Map<String, dynamic> ? m['card'] : null,
        cardNumber: m['cardNumber'] is String ? m['cardNumber'] : null,
        expirationMonth: m['expirationMonth'] is String ? m['expirationMonth'] : null,
        expirationYear: m['expirationYear'] is String ? m['expirationYear'] : null,
        id: m['id'] is String ? m['id'] : null,
        issuer: m['issuer'] is Map<String, dynamic> ? m['issuer'] : null,
        metadata: m['metadata'] is Map<String, dynamic> ? m['metadata'] : null,
        networkToken: m['networkToken'] is Map<String, dynamic> ? m['networkToken'] : null,
        networkTokenBundleId: m['networkTokenBundleId'] is String ? m['networkTokenBundleId'] : null,
        networkTokenBundleState: m['networkTokenBundleState'] is String ? m['networkTokenBundleState'] : null,
        securityCode: m['securityCode'] is String ? m['securityCode'] : null,
      );

  Map<String, dynamic> toMap() {
    final m = <String, dynamic>{};
    if (null != card) {
      m['card'] = card;
    }
    if (null != cardNumber) {
      m['cardNumber'] = cardNumber;
    }
    if (null != expirationMonth) {
      m['expirationMonth'] = expirationMonth;
    }
    if (null != expirationYear) {
      m['expirationYear'] = expirationYear;
    }
    if (null != id) {
      m['id'] = id;
    }
    if (null != issuer) {
      m['issuer'] = issuer;
    }
    if (null != metadata) {
      m['metadata'] = metadata;
    }
    if (null != networkToken) {
      m['networkToken'] = networkToken;
    }
    if (null != networkTokenBundleId) {
      m['networkTokenBundleId'] = networkTokenBundleId;
    }
    if (null != networkTokenBundleState) {
      m['networkTokenBundleState'] = networkTokenBundleState;
    }
    if (null != securityCode) {
      m['securityCode'] = securityCode;
    }
    return m;
  }
}

class NetworkTokenBundleLoadMatch {
  /// STRING (required at the API)
  String? id;

  NetworkTokenBundleLoadMatch({
    this.id,
  });

  factory NetworkTokenBundleLoadMatch.fromMap(Map<String, dynamic> m) => NetworkTokenBundleLoadMatch(
        id: m['id'] is String ? m['id'] : null,
      );

  Map<String, dynamic> toMap() {
    final m = <String, dynamic>{};
    if (null != id) {
      m['id'] = id;
    }
    return m;
  }
}

class NetworkTokenBundleCreateData {
  /// OBJECT
  Map<String, dynamic>? card;
  /// STRING
  String? cardNumber;
  /// STRING
  String? expirationMonth;
  /// STRING
  String? expirationYear;
  /// STRING
  String? id;
  /// OBJECT
  Map<String, dynamic>? issuer;
  /// OBJECT
  Map<String, dynamic>? metadata;
  /// OBJECT
  Map<String, dynamic>? networkToken;
  /// STRING
  String? networkTokenBundleId;
  /// STRING
  String? networkTokenBundleState;
  /// STRING
  String? securityCode;

  NetworkTokenBundleCreateData({
    this.card,
    this.cardNumber,
    this.expirationMonth,
    this.expirationYear,
    this.id,
    this.issuer,
    this.metadata,
    this.networkToken,
    this.networkTokenBundleId,
    this.networkTokenBundleState,
    this.securityCode,
  });

  factory NetworkTokenBundleCreateData.fromMap(Map<String, dynamic> m) => NetworkTokenBundleCreateData(
        card: m['card'] is Map<String, dynamic> ? m['card'] : null,
        cardNumber: m['cardNumber'] is String ? m['cardNumber'] : null,
        expirationMonth: m['expirationMonth'] is String ? m['expirationMonth'] : null,
        expirationYear: m['expirationYear'] is String ? m['expirationYear'] : null,
        id: m['id'] is String ? m['id'] : null,
        issuer: m['issuer'] is Map<String, dynamic> ? m['issuer'] : null,
        metadata: m['metadata'] is Map<String, dynamic> ? m['metadata'] : null,
        networkToken: m['networkToken'] is Map<String, dynamic> ? m['networkToken'] : null,
        networkTokenBundleId: m['networkTokenBundleId'] is String ? m['networkTokenBundleId'] : null,
        networkTokenBundleState: m['networkTokenBundleState'] is String ? m['networkTokenBundleState'] : null,
        securityCode: m['securityCode'] is String ? m['securityCode'] : null,
      );

  Map<String, dynamic> toMap() {
    final m = <String, dynamic>{};
    if (null != card) {
      m['card'] = card;
    }
    if (null != cardNumber) {
      m['cardNumber'] = cardNumber;
    }
    if (null != expirationMonth) {
      m['expirationMonth'] = expirationMonth;
    }
    if (null != expirationYear) {
      m['expirationYear'] = expirationYear;
    }
    if (null != id) {
      m['id'] = id;
    }
    if (null != issuer) {
      m['issuer'] = issuer;
    }
    if (null != metadata) {
      m['metadata'] = metadata;
    }
    if (null != networkToken) {
      m['networkToken'] = networkToken;
    }
    if (null != networkTokenBundleId) {
      m['networkTokenBundleId'] = networkTokenBundleId;
    }
    if (null != networkTokenBundleState) {
      m['networkTokenBundleState'] = networkTokenBundleState;
    }
    if (null != securityCode) {
      m['securityCode'] = securityCode;
    }
    return m;
  }
}

class NetworkTokenBundleRemoveMatch {
  /// STRING (required at the API)
  String? id;

  NetworkTokenBundleRemoveMatch({
    this.id,
  });

  factory NetworkTokenBundleRemoveMatch.fromMap(Map<String, dynamic> m) => NetworkTokenBundleRemoveMatch(
        id: m['id'] is String ? m['id'] : null,
      );

  Map<String, dynamic> toMap() {
    final m = <String, dynamic>{};
    if (null != id) {
      m['id'] = id;
    }
    return m;
  }
}

