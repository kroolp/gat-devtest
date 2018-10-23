require 'rails_helper'

RSpec.describe '/api/v1/locations', type: :request do
  include_context 'locations collection'

  describe 'GET /api/v1/locations/:country_code' do
    before do
      get "/api/v1/locations/PL"
    end

    it 'returns proper locations' do
      expect(response_json).to eq [{
        id: location_2.id, name: location_2.name, external_id: location_2.external_id,
        location_group_id: location_group_1.id
      },
      {
        id: location_1.id, name: location_1.name, external_id: location_1.external_id,
        location_group_id: location_group_1.id
      }]
    end

    it 'responds with 200 OK' do
      expect(response).to have_http_status :ok
    end
  end
end
