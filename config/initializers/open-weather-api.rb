OpenWeatherAPI.configure do |config|
  # API key
  config.api_key = "362323df5775cd0666c4472e7dc29143"

  # Optionals
  config.default_language = 'en'     # 'en' by default
  config.default_country_code = 'en' # nil by default (ISO 3166-1 alfa2)
  config.default_units = 'metric'    # 'metric' by default
end

WEATHER = Rails.configuration.open_weather_api