module Security
  class UserAuthenticator
    attr_reader :email, :password, :token_service

    def initialize(email, password, token_service = JsonWebTokenService)
      @email = email
      @password = password
      @token_service = token_service
    end

    def call
      @token_service.issue(user_id: user.id) if user
    end

    private

    def user
      user = User.find_by(email: email)
      return user if user && user.authenticate(password)

      nil
    end
  end
end
