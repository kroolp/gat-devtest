module Api
  module V1
    module Private
      class BaseController < Api::V1::BaseController
        before_action :authorize_request

        attr_reader :current_user

        private

        def authorize_request
          @current_user = Security::UserAuthorizer.new(auth_token).call

          render json: { error: 'Not Authorized' }, status: :unauthorized unless @current_user
        end

        def auth_token
          ActionController::HttpAuthentication::Token.token_and_options(request)&.first
        end
      end
    end
  end
end
