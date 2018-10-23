require 'rails_helper'

RSpec.describe '/api/v1/sessions', type: :request do
  let(:email) { 'tom@example.com' }
  let(:password) { 'test123456' }
  let!(:user) do
    Fabricate(:user, email: email, password: password)
  end

  describe "POST /api/v1/sessions" do
    before do
      Timecop.freeze(Time.new(2018, 1, 1))
    end

    after do
      Timecop.return
    end

    context 'when credentials are valid' do
      before do
        post "/api/v1/sessions", params: { email: email, password: password }
      end

      it 'responds with 201 Created' do
        expect(response).to have_http_status :created
      end

      it 'returns proper token' do
        expect(response_json[:auth_token]).to eq(
          'eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjoxLCJle'\
          'HAiOjE1MTQ4NDc2MDB9.py6seFf2hVGUwbhAWj9WTYcF6v24h1OXb4ODHSXMu0I'
        )
      end
    end

    context 'when credentials are invalid' do
      before do
        post "/api/v1/sessions", params: { email: email, password: 'wrong_password' }
      end

      it "responds with unauthorized status" do
        expect(response).to have_http_status :unauthorized
      end

      it 'returns body with error message' do
        expect(response_json[:error]).to eq 'Invalid credentials'
      end
    end
  end
end
