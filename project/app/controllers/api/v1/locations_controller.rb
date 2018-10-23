module Api
  module V1
    class LocationsController < ApplicationController
      def index
        locations = LocationsByCountryCodeQuery.new(params[:country_code]).all

        render json: locations, status: :ok
      end
    end
  end
end
