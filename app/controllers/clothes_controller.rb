class ClothesController < ApplicationController
  before_action :require_logged_in
  
  def show
    @clothe = Clothe.find(params[:id])
  end

  def new
    @clothe = Clothe.new
  end


  def edit
    @clothe = Clothe.find(params[:id])
  end

  def create
    @clothe = Clothe.create(clothe_params)
    redirect_to clothe_path(@clothe)
  end

  def clothe_params
    params.require(:clothe).permit(:clothing_pic)
  end 

end
