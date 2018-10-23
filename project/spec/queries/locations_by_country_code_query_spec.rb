require 'rails_helper'

RSpec.describe LocationsByCountryCodeQuery do
  include_context 'locations collection'

  describe '#all' do
    subject { described_class.new(country_code).all }

    context 'when there is no location from specified country' do
      let(:country_code) { 'UK' }

      it { is_expected.to be_empty }
    end

    context 'when there are locations with providers for specified country' do
      let(:country_code) { 'PL' }

      it { is_expected.to eq [location_2, location_1] }
    end
  end
end
