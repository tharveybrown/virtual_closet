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

    def look
        @look = Mtl.get_data(params[:mtl][:image_url], params[:mtl][:gender])
        # byebug
    end

    def create
        @closet = current_user.closet
        @outfit = Outfit.new(closet_id: current_user.closet.id)
        shirt = @closet.clothes.select {|c| c.clothing_type == "shirt"}.sample
        pants = @closet.clothes.select {|c| c.clothing_type == "pant"}.sample
        if shirt == nil || pants == nil
            flash[:errors] = "Not enough clothes for a random outfit"
            return redirect_to @closet
        end
        # byebug
        @outfit.clothes << shirt unless shirt == nil
        @outfit.clothes << pants unless pants == nil
        if @outfit.save
            redirect_to @outfit
        else
            redirect_to new_outfit_path
        end
    end





end
