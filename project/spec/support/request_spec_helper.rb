module RequestSpecsHelper
  def self.included(base)
    base.before(:each) do
      @set_headers = {}
    end
  end

  def response_json
    @response_json ||= response ? JSON.parse(response.body, symbolize_names: true) : nil
  end

  def authenticate_user(user)
    token = JWT.encode({ user_id: user.id }, Settings.auth_secret, 'HS256')

    header_value = %Q(Token token="#{token}")
    @set_headers['Authorization'] = header_value
  end

  %i[get post put patch delete].each do |name|
    define_method name do |path, params: nil, headers: {}|
      @response_json = nil
      super(path, params: params, headers: merged_headers(headers))
    end
  end

  private

  def merged_headers(headers)
    @set_headers.merge headers
  end
end
