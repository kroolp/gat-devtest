require 'rails_helper'

RSpec.describe TargetGroupsByCountryCodeQuery do
  include_context 'target_groups collection'

  describe '#all' do
    subject { described_class.new(country_code).all }

    context 'when there is no target_group from specified country' do
      let(:country_code) { 'UK' }

      it { is_expected.to be_empty }
    end

    context 'when there are target_groups with providers for specified country' do
      let(:country_code) { 'PL' }

      it { is_expected.to eq [target_group_3, target_group_1] }
    end
  end
end
