module Api
  module V1
    class SessionsController < BaseController
      def create
        user_authenticator = Security::UserAuthenticator.new(params[:email], params[:password])
        token = user_authenticator.call

        if token.present?
          render json: { auth_token: token }, status: :created
        else
          render json: { error: 'Invalid credentials' }, status: :unauthorized
        end
      end
    end
  end
end
