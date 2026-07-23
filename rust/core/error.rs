// BluefinNetworkTokenError: the SDK error type (mirrors go core/error.go). The
// pipeline error discipline is Result<T, BluefinNetworkTokenError> throughout.

use crate::utility::voxgigstruct::Value;

#[derive(Clone, Debug)]
pub struct BluefinNetworkTokenError {
    pub sdk: String,
    pub code: String,
    pub msg: String,
    // Cleaned snapshots attached by makeError (Noval until then).
    pub result: Value,
    pub spec: Value,
}

impl BluefinNetworkTokenError {
    pub fn new(code: &str, msg: &str) -> BluefinNetworkTokenError {
        BluefinNetworkTokenError {
            sdk: "BluefinNetworkToken".to_string(),
            code: code.to_string(),
            msg: msg.to_string(),
            result: Value::Noval,
            spec: Value::Noval,
        }
    }
}

impl std::fmt::Display for BluefinNetworkTokenError {
    fn fmt(&self, f: &mut std::fmt::Formatter<'_>) -> std::fmt::Result {
        f.write_str(&self.msg)
    }
}

impl std::error::Error for BluefinNetworkTokenError {}
