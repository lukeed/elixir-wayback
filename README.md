# Wayback [![Build Status](https://travis-ci.org/lukeed/elixir-wayback.svg?branch=master)](https://travis-ci.org/lukeed/elixir-wayback) [![Hex pm](http://img.shields.io/hexpm/v/wayback.svg?style=flat)](https://hex.pm/packages/wayback)

> Request moments in history for a web address with the [Wayback Machine](https://archive.org/web/). ([View Docs](https://hexdocs.pm/wayback/))

## Install

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

## Usage

View the [online documentation](https://hexdocs.pm/wayback/) for more information.

```elixir
url = "http://example.com"

Wayback.timeline(url)
#=> [tuple(date_string, url_string)]

Wayback.links(url)
#=> [String.t]

Wayback.oldest(url)
#=> String.t

Wayback.newest(url)
#=> String.t
```

## License

MIT © [Luke Edwards](https://lukeed.com)
