require 'rails_helper'

RSpec.describe '/api/v1/target_groups', type: :request do
  include_context 'target_groups collection'

  describe 'GET /api/v1/target_groups/:country_code' do
    before do
      get "/api/v1/target_groups/PL"
    end

    it 'returns proper target_groups' do
      expect(response_json).to eq [{
        id: target_group_3.id, name: target_group_3.name, external_id: target_group_3.external_id,
        panel_provider_id: target_group_3.panel_provider_id, parent_id: nil
      },
      {
        id: target_group_1.id, name: target_group_1.name, external_id: target_group_1.external_id,
        panel_provider_id: target_group_1.panel_provider_id, parent_id: nil
      }]
    end

    it 'responds with 200 OK' do
      expect(response).to have_http_status :ok
    end
  end
end
