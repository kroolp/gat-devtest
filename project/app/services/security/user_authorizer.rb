module Security
  class UserAuthorizer
    attr_reader :token, :token_service

    def initialize(token, token_service = JsonWebTokenService)
      @token = token
      @token_service = token_service
    end

    def call
      User.find(decoded_auth_token[:user_id]) if decoded_auth_token
    end

    private

    def decoded_auth_token
      @decoded_auth_token ||= token_service.decode(token)&.symbolize_keys
    end
  end
end
