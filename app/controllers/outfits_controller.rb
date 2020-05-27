class OutfitsController < ApplicationController

    def index
        @outfits = Outfit.all
    end

    def new
        @outfit = Outfit.new
    end

    def create
    end

    def show
        @outfit = Outfit.find(params[:id])
    end


end
