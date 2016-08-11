defmodule WaybackHistory do
	import HTTPoison, only: [get!: 1]

	def timeline(url) do
		%{body: data} = wrap(url) |> get!
		String.split(data, "\n")
		|> Enum.filter_map(&String.match?(&1, ~r/datetime/),
			fn row ->
				Regex.named_captures(~r/<(?<url>[^>]+)>.*datetime="(?<date>[^"]+)"/, row)
				|> Map.values
				|> List.to_tuple
			end)
	end

	def links(url), do: timeline(url) |> Enum.map(fn {_, a} -> a end)

	defp wrap(url), do: "http://web.archive.org/web/timemap/link/#{url}"
end
