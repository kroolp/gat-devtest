require 'rails_helper'

RSpec.describe Country, type: :model do
  subject { Fabricate.build(:country) }

  describe 'associations' do
    it { is_expected.to belong_to(:panel_provider) }
    it { is_expected.to have_many(:location_groups) }
  end

  describe 'validations' do
    it { is_expected.to validate_presence_of(:code) }
    it { is_expected.to validate_uniqueness_of(:code) }
    it { is_expected.to validate_presence_of(:panel_provider) }
  end
end
