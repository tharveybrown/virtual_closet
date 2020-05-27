class OutfitsController < ApplicationController
    before_action :require_logged_in

    def index
        @outfits = Outfit.all
    end

    def show
        @outfit = Outfit.find(params[:id])
    end

    def new
        @outfit = Outfit.new(closet_id: current_user.closet.id)
        @shirts = Clothe.select {|c| c.clothing_type == "shirt"}
        @pants = Clothe.select {|c| c.clothing_type == "pant"}
    end

    def create
        @closet = current_user.closet
        @outfit = Outfit.new(closet_id: current_user.closet.id)
        shirt = @closet.clothes.select {|c| c.clothing_type == "shirt"}.sample
        pants = @closet.clothes.select {|c| c.clothing_type == "pant"}.sample
        # byebug
        @outfit.clothes << shirt
        @outfit.clothes << pants
        if @outfit.save
            redirect_to @outfit
        else
            redirect_to new_outfit_path
        end
    end



end
