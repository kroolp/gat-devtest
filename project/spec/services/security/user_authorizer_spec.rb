require 'rails_helper'

RSpec.describe Security::UserAuthorizer do
  let(:user) { Fabricate(:user, email: 'email@example.com', password: '0ksymoroN') }

  let(:token_service) { double(:token_service) }
  let(:token) { 'test_token' }

  describe '#call' do
    subject { described_class.new(token, token_service).call }

    context 'when token is correct' do
      before do
        allow(token_service).to receive(:decode).with(token).and_return(user_id: user.id)
      end

      it 'returns user' do
        is_expected.to eq user
      end
    end

    context 'when token is incorrect' do
      before do
        allow(token_service).to receive(:decode).with(token).and_return(nil)

        it { is_expected.to eq nil }
      end
    end
  end
end
