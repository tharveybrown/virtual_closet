class UsersController < ApplicationController
  # before_action :require_logged_in, only: :show

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
    @closet = current_user.closet
    @outfits = @closet.outfits
  end

  private

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation)
  end
end
