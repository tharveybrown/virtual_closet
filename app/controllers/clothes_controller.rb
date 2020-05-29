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
    
    if @clothe.save 
      flash[:success] = "Successfully created!"
      redirect_to clothe_path(@clothe)
    else
      flash[:warning] = @clothe.errors.full_messages
      render :new
    end

    # redirect_to :controller => 'closets', :action => 'show' 
  end

  def update
    @clothe = Clothe.find(params[:id])
    if params[:clothe][:clothing_pic]
      ActiveStorage::Attachment.find(@clothe.clothing_pic.id).purge
      @clothe.clothing_pic.attach(params[:clothe][:clothing_pic])
      params[:clothe].delete(:clothing_pic)
    end
    if @clothe = Clothe.update(clothe_params)
      flash[:success] = "Successfully edited!"
      redirect_to clothe_path(@clothe)
    else
      flash[:warning] = @clothe.errors.full_messages
      render :edit
    end
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
