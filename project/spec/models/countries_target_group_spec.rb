require 'rails_helper'

RSpec.describe CountriesTargetGroup, type: :model do
  let(:target_group) { Fabricate.build(:target_group) }
  subject { Fabricate.build(:countries_target_group, target_group: target_group) }

  describe 'associations' do
    it { is_expected.to belong_to(:country) }
    it { is_expected.to belong_to(:target_group) }
  end

  describe 'validations' do
    it { is_expected.to validate_presence_of(:country) }

    describe 'target_group' do

      it { is_expected.to validate_presence_of(:target_group) }

      context 'when is root' do
        let(:target_group) { Fabricate(:target_group) }

        it { is_expected.to be_valid }
      end

      context 'when is not root' do
        let(:target_group) { Fabricate(:target_group_with_parent) }

        it { is_expected.to_not be_valid }
      end
    end
  end
end
