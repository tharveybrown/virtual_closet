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
    end

    def create
    end
    
    def random
        @closet = current_user.closet
        @outfit = Outfit.new(closet_id: current_user.closet.id)
        shirt = @closet.clothes.select {|c| c.clothing_type == "shirt"}.sample
        pants = @closet.clothes.select {|c| c.clothing_type == "pant"}.sample

        @weather = Weather.new(lon: current_user.longitude, lat: current_user.latitude)
        if @weather.temp < 60 && @weather.temp > 50
            sweatshirt = @closet.clothes.select {|c| c.clothing_type == "sweatshirt"}.sample
            @outfit.clothes << sweatshirt
        elsif @weather.temp < 50
            jacket = @closet.clothes.select {|c| c.clothing_type == "jacket"}.sample
            @outfit.clothes << jacket
        elsif @weather.temp > 80
            shorts = @closet.clothes.select {|c| c.clothing_type == "short"}.sample
            @outfit.clothes << shorts
        end
        # byebug

        if shirt == nil || pants == nil
            flash[:errors] = "Not enough clothes for a random outfit"
            return redirect_to @closet
        end
        
        @outfit.clothes << shirt
        @outfit.clothes << pants unless @outfit.clothes.detect{|c| c.clothing_type == "short"}

        if @outfit.save
            redirect_to @outfit
        else
            redirect_to new_outfit_path
        end
    end




end
