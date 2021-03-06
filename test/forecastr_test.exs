defmodule ForecastrTest do
  use ExUnit.Case
  doctest Forecastr

  @response_today %{
    "base" => "stations",
    "clouds" => %{"all" => 40},
    "cod" => 200,
    "coord" => %{"lat" => 52.52, "lon" => 13.39},
    "dt" => 1522081200,
    "id" => 2950159,
    "main" => %{"humidity" => 65, "pressure" => 1014, "temp" => 280.15, "temp_max" => 280.15, "temp_min" => 280.15},
    "name" => "Berlin",
    "sys" => %{"country" => "DE", "id" => 4892, "message" => 0.004, "sunrise" => 1522040019, "sunset" => 1522085472, "type" => 1},
    "visibility" => 10000,
    "weather" => [%{"description" => "scattered clouds", "icon" => "03d", "id" => 802, "main" => "Clouds"}],
    "wind" => %{"deg" => 320, "speed" => 4.6}
  }

  @cache_key "foo_bar_baz"

  test "caching works" do
    assert :ok == Forecastr.cache_response(@cache_key, @response_today)
    assert Forecastr.fetch_from_cache(@cache_key) == {:ok, @response_today}
  end

end
