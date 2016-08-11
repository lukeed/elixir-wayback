defmodule Wayback.Mixfile do
  use Mix.Project

  def project do
    [app: :wayback,
     version: "0.1.0",
     elixir: "~> 1.2",
     description: "Request moments in history for a web address with the Wayback Machine.",
     package: package,
     deps: deps]
  end

  # Configuration for the OTP application
  #
  # Type "mix help compile.app" for more information
  def application do
    [applications: [:httpoison]]
  end

  # Dependencies:
  defp deps do [
    {:httpoison, "~> 0.9.0"},
    {:ex_doc, "~> 0.13.0", only: :dev}
  ] end

  def package do [
    name: :wayback,
    maintainers: ["Luke Edwards"],
    licenses: ["MIT"],
    links: %{"Github" => "https://github.com/lukeed/elixir-wayback"}
  ] end
end
