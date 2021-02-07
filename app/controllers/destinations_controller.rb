class DestinationsController < ApplicationController
    before_action :set_destination, only: [:show]

    def show
    end

    private

    def set_destination
        @destination = Destination.find(params[:id])
    end

    def destination_params
        params.require(:destination).permit(:name, :country)
    end

end