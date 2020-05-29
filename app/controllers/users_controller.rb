class UsersController < ApplicationController
  include UsersHelper
  def new
  end

  def create
    @user = User.create(user_params)
    @closet = Closet.create 
    @user.closet = @closet

    if @user.save 
      session[:user_id] = @user.id
      flash[:alert] = "Success."
      redirect_to controller: 'welcome', action: 'home'
    else
      flash[:error] = @user.errors.full_messages
      flash[:alert] = "Failed."
      render :new
    end
   
  end

  def show
    @weather = Weather.new(lon: @user.longitude, lat: @user.latitude)
  end

  def update
    if @user.update(user_params)
      flash[:alert] = "Success."
      redirect_to user_path(@user.id)
    else
      flash[:error] = @user.errors.full_messages
      flash[:alert] = "Failed."
      render :edit
    end
  end

  def outfits
    @outfits = current_user.closet.outfits
  end
  
  def destroy
    @user.closet.clothes.each do |clothe|
      clothe.destroy 
    end
    @user.closet.destroy 
    @user.destroy 
    redirect_to new_user_path
  end


  private

  def user_params
    params.require(:user).permit(
      :first_name,
      :last_name,
      :email, 
      :password, 
      :password_confirmation, 
      :address, 
      :longitude, 
      :latitude)
  end
end
