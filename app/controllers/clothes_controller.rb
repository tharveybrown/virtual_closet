class ClothesController < ApplicationController
  before_action :require_logged_in
  
  def show
    @clothe = Clothe.find(params[:id])
  end

  def new
    @clothe = Clothe.new(closet_id: current_user.closet.id)
    
  end


  def edit
    @clothe = Clothe.find(params[:id])
  end

  def create
    # byebug
    @clothe = Clothe.create(clothe_params)
    @user.closet.clothes << @clothe
    redirect_to clothe_path(@clothe)

    # redirect_to :controller => 'closets', :action => 'show' 
  end

  def clothe_params
    params.require(:clothe).permit(
      :closet_id,
      :clothing_type,
      :size,
      :season,
      :color,
      :pattern,
      :style,
      :clothing_pic)
  end 

end
