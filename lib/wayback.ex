defmodule Wayback do
  @moduledoc """
  Request moments in history for a URL with the [Wayback Machine](https://archive.org/web/).
  """

  import HTTPoison, only: [get!: 1]

  @doc """
  Get the history timeline for a URL.
  Returns a list of tuples; `{datestring, url}`.
  """
  @spec timeline(String.t) :: [tuple()]
  def timeline(url) do
    get!(wrap(url))
    |> Map.get(:body)
    |> String.split("\n")
    |> Enum.filter_map(&String.match?(&1, ~r/datetime/),
      fn row ->
        Regex.named_captures(~r/<(?<url>[^>]+)>.*datetime="(?<date>[^"]+)"/, row)
        |> Map.values
        |> List.to_tuple
      end)
  end

  @doc """
  Return only the url links from a history timeline.
  """
  @spec links(String.t) :: [String.t]
  def links(url), do: timeline(url) |> Enum.map(fn {_, a} -> a end)

  @doc """
  Return the most recent entry from a url's timeline.
  """
  @spec newest(String.t) :: {:datestring, :url}
  def newest(url), do: timeline(url) |> List.last

  @doc """
  Return the oldest entry from a url's timeline.
  """
  @spec oldest(String.t) :: {:datestring, :url}
  def oldest(url), do: timeline(url) |> List.first

  defp wrap(url), do: "http://web.archive.org/web/timemap/link/#{url}"
end
