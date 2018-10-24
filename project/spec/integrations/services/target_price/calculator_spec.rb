require 'rails_helper'

RSpec.describe TargetPrice::Calculator do
  let(:panel_provider) { Fabricate.build(:panel_provider, code: code) }

  describe '#call', :vcr do
    subject { described_class.new(panel_provider).call }

    context 'when panel_provider code is 10_arrays' do
      let(:code) { '10_arrays' }

      it { is_expected.to eq 1 }
    end

    context 'when panel_provider code is times_html' do
      let(:code) { 'times_html' }

      it { is_expected.to eq 0 }
    end

    context 'when panel_provider code is times_a' do
      let(:code) { 'times_a' }

      it { is_expected.to eq 11 }
    end
  end
end
