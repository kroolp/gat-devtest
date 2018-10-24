module Api
  module V1
    module Private
      class TargetGroupsController < BaseController
        def index
          target_groups = TargetGroupsByCountryCodeQuery.new(params[:country_code]).all

          render json: target_groups, secret_attributes: true, status: :ok
        end

        def evaluate
          if target_evaluation_params.valid?
            target_price_calculator = TargetPrice::Calculator.new(panel_provider)

            render json: { price: target_price_calculator.call }, status: :ok
          else
            render json: { errors: target_evaluation_params.errors }, status: :unprocessable_entity
          end
        end

        private

        def panel_provider
          @panel_provider ||= Country.find_by!(code: params[:country_code]).panel_provider
        end

        def target_evaluation_params
          @target_evaluation_params ||= TargetEvaluation::Params.new(
            params.permit(:country_code, :target_group_id, locations: [:id, :panel_size])
          )
        end
      end
    end
  end
end
