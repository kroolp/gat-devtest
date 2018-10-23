module Api
  module V1
    module Private
      class TargetGroupsController < ApplicationController
        def index
          target_groups = TargetGroupsByCountryCodeQuery.new(params[:country_code]).all

          render json: target_groups, secret_attributes: true, status: :ok
        end
      end
    end
  end
end
