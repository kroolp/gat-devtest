module Security
  class BaseTokenService
    def self.issue(payload)
      raise NoMethodError
    end

    def self.decode(token)
      raise NoMethodError
    end
  end
end
