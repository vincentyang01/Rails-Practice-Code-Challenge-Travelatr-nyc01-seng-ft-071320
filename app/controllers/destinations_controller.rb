class DestinationsController < ApplicationController

    def index
        @destinations = Destination.all
    end
    
    def show
        @destination = Destination.find_by(params[:id])
    end
    

end