defmodule BluefinNetworkToken.MixProject do
  use Mix.Project

  def project do
    [
      app: :bluefin_network_token,
      version: "0.1.1",
      elixir: "~> 1.14",
      description: "Unofficial generated elixir SDK for the Network Token Bundle public API. Not affiliated with or endorsed by the upstream API provider.",
      elixirc_paths: elixirc_paths(Mix.env()),
      start_permanent: Mix.env() == :prod,
      deps: deps(),
      package: package()
    ]
  end

  def application, do: [extra_applications: [:inets, :ssl]]

  defp deps, do: []

  defp elixirc_paths(:test), do: ["lib", "test/support"]
  defp elixirc_paths(_), do: ["lib"]

  defp package do
    [
      licenses: ["MIT"],
      links: %{"Homepage" => "https://github.com/voxgig-sdk/bluefin-network-token-sdk"}
    ]
  end
end
