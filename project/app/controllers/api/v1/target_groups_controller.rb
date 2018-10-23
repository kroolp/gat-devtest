module Api
  module V1
    class TargetGroupsController < BaseController
      def index
        target_groups = TargetGroupsByCountryCodeQuery.new(params[:country_code]).all

        render json: target_groups, status: :ok
      end
    end
  end
end
