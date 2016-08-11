defmodule WaybackTest do
  use ExUnit.Case
  doctest Wayback

  @url "https://www.nasa.gov"

  def is_url(str), do: String.contains?(str, "http")

  test "timeline" do
	res = Wayback.timeline(@url)
  	assert is_list(res)
  	assert is_tuple(List.first(res))
  end

  test "links" do
	res = Wayback.links(@url)
	url = List.first(res)

	assert is_list(res)
	assert is_binary(url)
	assert is_url(url)
  end

  test "oldest" do
  	res = {_, url} = Wayback.oldest(@url)
	assert is_tuple(res)
	assert is_url(url)
  end

  test "newest" do
  	res = {_, url} = Wayback.newest(@url)
	assert is_tuple(res)
	assert is_url(url)
  end
end
