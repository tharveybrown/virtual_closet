class Weather

  attr_reader :weather, :main, :description, :temp, :icon, :humidity
  def initialize(attributes)
    # byebug
    @weather = WEATHER.current(attributes)
  end

  def icon
    self.weather[:weather][0]["icon"]
  end

  def temp
    k = self.weather["main"]["temp"]
    c = k - 273.15
    temp = (c * 9 / 5 + 32).round(2)
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


end