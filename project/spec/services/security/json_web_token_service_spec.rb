require 'rails_helper'

RSpec.describe Security::JsonWebTokenService do
  describe '.issue' do
    before do
      Timecop.freeze(Time.new(2018, 1, 1))
    end

    after do
      Timecop.return
    end

    let(:expected_token) do
      'eyJhbGciOiJIUzI1NiJ9.eyJ0ZXN0IjoxMjMsImV4cCI6MTUxNDg0NzYwMH0.'\
      'owNycxxHJetXwu3ifMJs6DWtM6kxthf2YmyTYju5naw'
    end

    subject { described_class.issue(test: 123) }

    it 'returns proper token' do
      expect(subject).to eq(expected_token)
    end
  end

  describe '.decode' do
    subject { described_class.decode(token) }

    context 'when token is valid' do
      let(:token) do
        "eyJhbGciOiJIUzI1NiJ9.eyJ0ZXN0Ijoic3VjY2VzcyJ9.1hC7ohwsFAGxq3FE6hnTIo5gYn8soM-w1fqNDQuYLtE"
      end

      subject { described_class.decode(token) }

      it 'returns proper payload' do
        expect(subject).to eq({ 'test' => 'success' })
      end
    end

    context 'when token is invalid' do
      let(:token) do
        "invalid"
      end

      it { is_expected.to be nil }
    end
  end
end
