class UsersController < ApplicationController
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

  private

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation)
  end
end
