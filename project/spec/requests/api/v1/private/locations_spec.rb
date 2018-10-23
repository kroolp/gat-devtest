require 'rails_helper'

RSpec.describe '/api/v1/private/locations', type: :request do
  include_context 'locations collection'

  let(:user) { Fabricate(:user) }

  before do
    authenticate_user(user)
  end

  describe 'GET /api/v1/private/locations/:country_code' do
    it_behaves_like 'private request', :get, '/api/v1/private/locations/PL'

    before do
      get "/api/v1/private/locations/PL"
    end

    it 'returns proper locations with secret_codes' do
      expect(response_json).to eq [{
        id: location_2.id, name: location_2.name, external_id: location_2.external_id,
        secret_code: location_2.secret_code, location_group_id: location_group_1.id
      },
      {
        id: location_1.id, name: location_1.name, external_id: location_1.external_id,
        secret_code: location_1.secret_code,location_group_id: location_group_1.id
      }]
    end

    it 'responds with 200 OK' do
      expect(response).to have_http_status :ok
    end
  end
end
