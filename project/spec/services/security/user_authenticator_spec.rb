require 'rails_helper'

RSpec.describe Security::UserAuthenticator do
  let(:user) { Fabricate(:user, email: 'email@example.com', password: '0ksymoroN') }

  let(:token_service) { double(:token_service) }
  let(:token) { 'test_token' }

  before do
    allow(token_service).to receive(:issue).with({ user_id: user.id }).and_return(token)
  end

  describe '#call' do
    subject { described_class.new(email, password, token_service).call }

    context 'when there is no user for set email' do
      let(:email) { 'wrong_email@example.com' }
      let(:password) { '0ksymoroN' }

      it { is_expected.to be nil}
    end

    context 'when password is wrong' do
      let(:email) { 'email@example.com' }
      let(:password) { 'wrong_password' }

      it { is_expected.to be nil}
    end

    context 'when credentials are correct' do
      let(:email) { 'email@example.com' }
      let(:password) { '0ksymoroN' }

      it 'returns token' do
        is_expected.to eq token
      end
    end
  end
end
