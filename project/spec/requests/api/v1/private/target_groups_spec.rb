require 'rails_helper'

RSpec.describe '/api/v1/private/target_groups', type: :request do
  include_context 'target_groups collection'

  let(:user) { Fabricate(:user) }

  before do
    authenticate_user(user)
  end

  describe 'GET /api/v1/private/target_groups/:country_code' do
    it_behaves_like 'private request', :get, '/api/v1/private/target_groups/PL'

    before do
      get "/api/v1/private/target_groups/PL"
    end

    it 'returns proper target_groups with secret_codes' do
      expect(response_json).to eq [{
        id: target_group_3.id, name: target_group_3.name, external_id: target_group_3.external_id,
        secret_code: target_group_3.secret_code, panel_provider_id: target_group_3.panel_provider_id,
        parent_id: nil
      },
      {
        id: target_group_1.id, name: target_group_1.name, external_id: target_group_1.external_id,
        secret_code: target_group_3.secret_code, panel_provider_id: target_group_1.panel_provider_id,
        parent_id: nil
      }]
    end

    it 'responds with 200 OK' do
      expect(response).to have_http_status :ok
    end
  end

  describe 'POST /api/v1/private/evaluate_target', :vcr do
    it_behaves_like 'private request', :post, '/api/v1/private/evaluate_target'

    before do
      post "/api/v1/private/evaluate_target", params: params
    end

    let(:params) { {} }

    context 'when params are invalid' do
      let(:params) { { country_code: 'PL', target_group_id: 1, locations: [{ id: 1 }] } }

      it 'responds with 422 Unprocessable Entity' do
        expect(response).to have_http_status :unprocessable_entity
      end

      it 'returns body with errors' do
        expect(response_json[:errors]).to eq(locations: [{ panel_size: "can't be blank" }])
      end
    end

    context 'when params are valid' do
      let(:params) do
        { country_code: 'PL', target_group_id: 1, locations: [{ id: 1, panel_size: 200 }] }
      end

      it 'returns price' do
        expect(response_json[:price]).to eq 11
      end

      it 'responds with 200 OK' do
        expect(response).to have_http_status :ok
      end
    end
  end
end
