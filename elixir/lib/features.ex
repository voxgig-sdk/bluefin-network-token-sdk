# BluefinNetworkToken SDK feature factory

defmodule BluefinNetworkToken.Features do
  def make_feature(name) do
    case name do
      "test" -> BluefinNetworkToken.Feature.Test.new()
      _ -> BluefinNetworkToken.Feature.new()
    end
  end
end
