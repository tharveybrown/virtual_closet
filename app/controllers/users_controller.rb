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
      flash[:success] = "Success."
      redirect_to controller: 'welcome', action: 'home'
    else
      flash[:warning] = @user.errors.full_messages
      
      render :new
    end
   
  end

  def show
    @weather = Weather.new(lon: @user.longitude, lat: @user.latitude)
  end

  def update
    if @user.update(user_params)
      flash[:success] = "Success."
      redirect_to user_path(@user.id)
    else
      flash[:warning] = @user.errors.full_messages
      render :edit
    end
  end

  def outfits
    @outfits = current_user.closet.outfits
  end
  
  def destroy
    # byebug
    @user.closet.clothes.each do |clothe|
      clothe.clothing_pic.detach
      clothe.destroy 
    end
    @user.closet.outfits.each do |outfit|
      outfit.destroy
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
