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
  String? card_number;
  /// STRING
  String? expiration_month;
  /// STRING
  String? expiration_year;
  /// OBJECT
  Map<String, dynamic>? issuer;
  /// OBJECT
  Map<String, dynamic>? metadata;
  /// OBJECT
  Map<String, dynamic>? network_token;
  /// STRING
  String? network_token_bundle_id;
  /// STRING
  String? network_token_bundle_state;
  /// STRING
  String? security_code;

  NetworkTokenBundle({
    this.card,
    this.card_number,
    this.expiration_month,
    this.expiration_year,
    this.issuer,
    this.metadata,
    this.network_token,
    this.network_token_bundle_id,
    this.network_token_bundle_state,
    this.security_code,
  });

  factory NetworkTokenBundle.fromMap(Map<String, dynamic> m) => NetworkTokenBundle(
        card: m['card'] is Map<String, dynamic> ? m['card'] : null,
        card_number: m['card_number'] is String ? m['card_number'] : null,
        expiration_month: m['expiration_month'] is String ? m['expiration_month'] : null,
        expiration_year: m['expiration_year'] is String ? m['expiration_year'] : null,
        issuer: m['issuer'] is Map<String, dynamic> ? m['issuer'] : null,
        metadata: m['metadata'] is Map<String, dynamic> ? m['metadata'] : null,
        network_token: m['network_token'] is Map<String, dynamic> ? m['network_token'] : null,
        network_token_bundle_id: m['network_token_bundle_id'] is String ? m['network_token_bundle_id'] : null,
        network_token_bundle_state: m['network_token_bundle_state'] is String ? m['network_token_bundle_state'] : null,
        security_code: m['security_code'] is String ? m['security_code'] : null,
      );

  Map<String, dynamic> toMap() {
    final m = <String, dynamic>{};
    if (null != card) {
      m['card'] = card;
    }
    if (null != card_number) {
      m['card_number'] = card_number;
    }
    if (null != expiration_month) {
      m['expiration_month'] = expiration_month;
    }
    if (null != expiration_year) {
      m['expiration_year'] = expiration_year;
    }
    if (null != issuer) {
      m['issuer'] = issuer;
    }
    if (null != metadata) {
      m['metadata'] = metadata;
    }
    if (null != network_token) {
      m['network_token'] = network_token;
    }
    if (null != network_token_bundle_id) {
      m['network_token_bundle_id'] = network_token_bundle_id;
    }
    if (null != network_token_bundle_state) {
      m['network_token_bundle_state'] = network_token_bundle_state;
    }
    if (null != security_code) {
      m['security_code'] = security_code;
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
  String? card_number;
  /// STRING
  String? expiration_month;
  /// STRING
  String? expiration_year;
  /// OBJECT
  Map<String, dynamic>? issuer;
  /// OBJECT
  Map<String, dynamic>? metadata;
  /// OBJECT
  Map<String, dynamic>? network_token;
  /// STRING
  String? network_token_bundle_id;
  /// STRING
  String? network_token_bundle_state;
  /// STRING
  String? security_code;

  NetworkTokenBundleCreateData({
    this.card,
    this.card_number,
    this.expiration_month,
    this.expiration_year,
    this.issuer,
    this.metadata,
    this.network_token,
    this.network_token_bundle_id,
    this.network_token_bundle_state,
    this.security_code,
  });

  factory NetworkTokenBundleCreateData.fromMap(Map<String, dynamic> m) => NetworkTokenBundleCreateData(
        card: m['card'] is Map<String, dynamic> ? m['card'] : null,
        card_number: m['card_number'] is String ? m['card_number'] : null,
        expiration_month: m['expiration_month'] is String ? m['expiration_month'] : null,
        expiration_year: m['expiration_year'] is String ? m['expiration_year'] : null,
        issuer: m['issuer'] is Map<String, dynamic> ? m['issuer'] : null,
        metadata: m['metadata'] is Map<String, dynamic> ? m['metadata'] : null,
        network_token: m['network_token'] is Map<String, dynamic> ? m['network_token'] : null,
        network_token_bundle_id: m['network_token_bundle_id'] is String ? m['network_token_bundle_id'] : null,
        network_token_bundle_state: m['network_token_bundle_state'] is String ? m['network_token_bundle_state'] : null,
        security_code: m['security_code'] is String ? m['security_code'] : null,
      );

  Map<String, dynamic> toMap() {
    final m = <String, dynamic>{};
    if (null != card) {
      m['card'] = card;
    }
    if (null != card_number) {
      m['card_number'] = card_number;
    }
    if (null != expiration_month) {
      m['expiration_month'] = expiration_month;
    }
    if (null != expiration_year) {
      m['expiration_year'] = expiration_year;
    }
    if (null != issuer) {
      m['issuer'] = issuer;
    }
    if (null != metadata) {
      m['metadata'] = metadata;
    }
    if (null != network_token) {
      m['network_token'] = network_token;
    }
    if (null != network_token_bundle_id) {
      m['network_token_bundle_id'] = network_token_bundle_id;
    }
    if (null != network_token_bundle_state) {
      m['network_token_bundle_state'] = network_token_bundle_state;
    }
    if (null != security_code) {
      m['security_code'] = security_code;
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

