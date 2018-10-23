RSpec.shared_context 'locations collection' do
  let(:panel_provider_1) { Fabricate.build(:panel_provider, code: 'times_a') }
  let(:panel_provider_2) { Fabricate.build(:panel_provider, code: 'times_html') }
  let!(:panel_provider_3) { Fabricate(:panel_provider, code: '10_arrays') }

  let(:country_1) { Fabricate.build(:country, panel_provider: panel_provider_1, code: 'PL') }
  let(:country_2) { Fabricate.build(:country, panel_provider: panel_provider_2, code: 'DE') }

  let(:location_1) { Fabricate.build(:location) }
  let(:location_2) { Fabricate.build(:location) }
  let(:location_3) { Fabricate.build(:location) }

  let!(:location_group_1) do
    Fabricate(:location_group, locations: [location_1, location_2], country: country_1)
  end

  let!(:location_group_2) do
    Fabricate(:location_group, locations: [location_3], country: country_2)
  end
end
