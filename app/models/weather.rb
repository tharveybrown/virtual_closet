class Weather

  attr_reader :weather, :main, :description, :temp, :icon, :humidity, :forecast
  def initialize(attributes)
    # byebug
    @weather = WEATHER.current(attributes)
    @forecast = WEATHER.forecast(:daily, attributes)
  end

  def icon
    self.weather[:weather][0]["icon"]
  end

  def temp
    to_farenheit(self.weather["main"]["temp"])
  end

  def description
    self.weather[:weather][0]["description"].camelize
  end

  def humidity
    self.weather["main"]["humidity"]
  end

  def main
    self.weather[:weather][0]["main"]
  end

  def wind
    self.weather["wind"]["speed"]
  end

  def next_five_days
    days = []
    count = 6
    today = Date.today
    day = today.wday
    5.times do 
      date = self.forecast[:list][count]["dt_txt"].split(" ").first
      max_temp = self.forecast[:list][count]["main"]["temp_max"]
      min_temp = self.forecast[:list][count]["main"]["temp_min"]
      weather = { 
        "date" => date, 
        "max_temp" => to_farenheit(max_temp), 
        "min_temp" => to_farenheit(min_temp)
      }
      days << weather 
      day += 1
      count += 8
    end
    days
  end

  def to_farenheit(kelvin)
    c = kelvin - 273.15
    temp = (c * 9 / 5 + 32).round(2)
  end

  def get_day(date, day_of_week)
      date + ((day_of_week - date.day) % 7)
  end
end
