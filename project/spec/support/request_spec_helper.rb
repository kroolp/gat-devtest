module RequestSpecsHelper
  def response_json
    @response_json ||= response ? JSON.parse(response.body, symbolize_names: true) : nil
  end
end
