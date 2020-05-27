class ClosetsController < ApplicationController
  
  def show
    @closet = current_user.closet
  end

end
