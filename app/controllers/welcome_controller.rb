class WelcomeController < ApplicationController
  before_action :require_logged_in

  def home
    @weather = Weather.new(lon: current_user.longitude, lat: current_user.latitude)
  end
end
