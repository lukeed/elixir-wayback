# Wayback

> Request moments in history for a web address with the [Wayback Machine](https://archive.org/web/).

## Installation

If [available in Hex](https://hex.pm/docs/publish), the package can be installed as:

  1. Add `wayback` to your list of dependencies in `mix.exs`:

    ```elixir
    def deps do
      [{:wayback, "~> 0.1.0"}]
    end
    ```

  2. Ensure `wayback` is started before your application:

    ```elixir
    def application do
      [applications: [:wayback]]
    end
    ```

