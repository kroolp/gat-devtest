RSpec.shared_context 'target_groups collection' do
  let(:panel_provider_1) { Fabricate.build(:panel_provider, code: 'times_a') }
  let(:panel_provider_2) { Fabricate.build(:panel_provider, code: '10_arrays') }
  let!(:panel_provider_3) { Fabricate(:panel_provider, code: 'times_html') }

  let(:country_1) { Fabricate.build(:country, panel_provider: panel_provider_1, code: 'PL') }
  let(:country_2) { Fabricate.build(:country, panel_provider: panel_provider_2, code: 'DE') }
  let(:country_3) { Fabricate.build(:country, panel_provider: panel_provider_2, code: 'RU') }

  let!(:target_group_1) { Fabricate(:target_group, countries: [country_1]) }
  let!(:target_group_2) { Fabricate(:target_group, countries: [country_2, country_3]) }
  let!(:target_group_3) { Fabricate(:target_group, countries: [country_1]) }
end
