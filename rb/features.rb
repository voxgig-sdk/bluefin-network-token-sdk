# BluefinNetworkToken SDK feature factory

require_relative 'feature/base_feature'
require_relative 'feature/test_feature'


module BluefinNetworkTokenFeatures
  def self.make_feature(name)
    case name
    when "base"
      BluefinNetworkTokenBaseFeature.new
    when "test"
      BluefinNetworkTokenTestFeature.new
    else
      BluefinNetworkTokenBaseFeature.new
    end
  end
end
