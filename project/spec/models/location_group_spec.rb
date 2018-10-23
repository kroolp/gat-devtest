require 'rails_helper'

RSpec.describe LocationGroup, type: :model do
  subject { Fabricate.build(:location_group) }

  describe 'associations' do
    it { is_expected.to have_many(:locations) }
  end

  describe 'validations' do
    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_presence_of(:country) }
    it { is_expected.to validate_presence_of(:panel_provider) }
  end
end
