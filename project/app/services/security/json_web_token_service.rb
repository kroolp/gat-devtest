module Security
  class JsonWebTokenService < BaseTokenService
    ALGORITHM = 'HS256'

    def self.issue(payload, exp = 24.hours.from_now)
      payload[:exp] = exp.to_i

      JWT.encode(payload, auth_secret, ALGORITHM)
    end

    def self.decode(token)
      JWT.decode(token, auth_secret, true, { algorithm: ALGORITHM }).first
    rescue JWT::DecodeError
     nil
    end

    private

    def self.auth_secret
      Settings.auth_secret
    end
  end
end
