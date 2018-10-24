require 'rails_helper'

RSpec.describe TargetPrice::StrategyFinder do
  describe '#call' do
    subject { described_class.new(code).call }

    context 'when code is times_a' do
      let(:code) { 'times_a' }

      it { is_expected.to be_a TargetPrice::Strategy::TimesA }
    end

    context 'when code is 10_arrays' do
      let(:code) { '10_arrays' }

      it { is_expected.to be_a TargetPrice::Strategy::TenArrays }
    end

    context 'when code is times_html' do
      let(:code) { 'times_html' }

      it { is_expected.to be_a TargetPrice::Strategy::TimesHtml }
    end
  end
end
