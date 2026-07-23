// Typed reference models for the BluefinNetworkToken SDK (C++).
//
// GENERATED from the API model: main.kit.entity.<e>.fields[] and per-op
// params. The C++ SDK runtime is Value-based, so these structs are
// DOCUMENTATION / convenience types only — the SDK neither includes nor
// requires this header. Array fields surface as std::vector<Value>, object
// fields as std::map<std::string, Value>, and any/null fields as sdk::Value.
// Optional (req:false) members are flagged with a trailing "// optional"
// comment. Do not edit by hand.

#ifndef SDK_BLUEFINNETWORKTOKEN_TYPES_HPP
#define SDK_BLUEFINNETWORKTOKEN_TYPES_HPP

#include <cstdint>
#include <map>
#include <string>
#include <vector>

#include "core/types.hpp"

namespace sdk {
namespace types {

struct NetworkTokenBundle {
  std::map<std::string, Value> card;  // optional
  std::string card_number;  // optional
  std::string expiration_month;  // optional
  std::string expiration_year;  // optional
  std::map<std::string, Value> issuer;  // optional
  std::map<std::string, Value> metadata;  // optional
  std::map<std::string, Value> network_token;  // optional
  std::string network_token_bundle_id;  // optional
  std::string network_token_bundle_state;  // optional
  std::string security_code;  // optional
};

struct NetworkTokenBundleLoadMatch {
  std::string id;
};

struct NetworkTokenBundleCreateData {
  std::map<std::string, Value> card;  // optional
  std::string card_number;  // optional
  std::string expiration_month;  // optional
  std::string expiration_year;  // optional
  std::map<std::string, Value> issuer;  // optional
  std::map<std::string, Value> metadata;  // optional
  std::map<std::string, Value> network_token;  // optional
  std::string network_token_bundle_id;  // optional
  std::string network_token_bundle_state;  // optional
  std::string security_code;  // optional
};

struct NetworkTokenBundleRemoveMatch {
  std::string id;
};

} // namespace types
} // namespace sdk

#endif // SDK_BLUEFINNETWORKTOKEN_TYPES_HPP
