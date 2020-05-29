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
        @outfit = Outfit.new(closet_id: current_user.closet.id)

        flash[:errors] = @outfit.errors.full_messages

        @weather = Weather.new(lon: current_user.longitude, lat: current_user.latitude)
        @outfit.clothes_for_weather(@weather.temp) 
        
        if @outfit.random_pants
            @outfit.clothes << @outfit.random_pants if !@outfit.clothes.detect{|c| c.clothing_type == "short"}
        else
            flash[:errors] << "You should add some pants!"
        end
        
        @outfit.random_shirt ? @outfit.clothes << @outfit.random_shirt : flash[:errors] << "You should add a shirt!"
        
        if @outfit.save
            redirect_to @outfit
        else
            redirect_to @outfit.closet
        end
        
    end




end
