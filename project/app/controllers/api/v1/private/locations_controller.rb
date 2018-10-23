module Api
  module V1
    module Private
      class LocationsController < ApplicationController
        def index
          locations = LocationsByCountryCodeQuery.new(params[:country_code]).all

          render json: locations, secret_attributes: true, status: :ok
        end
      end
    end
  end
end
