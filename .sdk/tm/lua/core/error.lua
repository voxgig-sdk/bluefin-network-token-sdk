-- BluefinNetworkToken SDK error

local BluefinNetworkTokenError = {}
BluefinNetworkTokenError.__index = BluefinNetworkTokenError


function BluefinNetworkTokenError.new(code, msg, ctx)
  local self = setmetatable({}, BluefinNetworkTokenError)
  self.is_sdk_error = true
  self.sdk = "BluefinNetworkToken"
  self.code = code or ""
  self.msg = msg or ""
  self.ctx = ctx
  self.result = nil
  self.spec = nil
  return self
end


function BluefinNetworkTokenError:error()
  return self.msg
end


function BluefinNetworkTokenError:__tostring()
  return self.msg
end


return BluefinNetworkTokenError
