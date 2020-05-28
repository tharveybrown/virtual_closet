class UsersController < ApplicationController
  include UsersHelper
  def new
  end

  def create
    @user = User.create(user_params)
    @closet = Closet.create 
    @user.closet = @closet
    return redirect_to controller: 'users', action: 'new' unless @user.save
    session[:user_id] = @user.id
    redirect_to controller: 'welcome', action: 'home'
  end

  def show
    @weather = Weather.new(lon: @user.longitude, lat: @user.latitude)
  end

  def outfits
    @outfits = current_user.closet.outfits
  end
  
    

  private

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation, :address, :longitude, :latitude)
  end
end
