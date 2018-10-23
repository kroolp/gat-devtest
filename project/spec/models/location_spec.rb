require 'rails_helper'

RSpec.describe Location, type: :model do
  subject { Fabricate.build(:location) }

  describe 'associations' do
    it { is_expected.to belong_to(:location_group) }
  end

  describe 'validations' do
    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_presence_of(:external_id) }
    it { is_expected.to validate_uniqueness_of(:external_id) }
    it { is_expected.to validate_presence_of(:secret_code) }
  end
end
