defmodule WaybackHistory do
	import HTTPoison, only: [get!: 1]

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

	def links(url), do: timeline(url) |> Enum.map(fn {_, a} -> a end)

	def newest(url), do: timeline(url) |> List.last
	def oldest(url), do: timeline(url) |> List.first

	defp wrap(url), do: "http://web.archive.org/web/timemap/link/#{url}"
end
