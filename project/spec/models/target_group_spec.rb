require "rails_helper"

RSpec.describe TargetGroup, type: :model do
  subject { Fabricate.build(:target_group) }

  describe 'associations' do
    it { is_expected.to belong_to(:parent).class_name('TargetGroup') }
    it { is_expected.to belong_to(:panel_provider) }
    it { is_expected.to have_many(:children).class_name('TargetGroup').with_foreign_key(:parent_id) }
    it { is_expected.to have_many(:countries_target_groups) }
    it { is_expected.to have_many(:countries).through(:countries_target_groups) }
  end

  describe 'validations' do
    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_presence_of(:external_id) }
    it { is_expected.to validate_uniqueness_of(:external_id) }
    it { is_expected.to validate_presence_of(:secret_code) }
    it { is_expected.to validate_presence_of(:panel_provider) }

    describe 'parent' do
      context 'when is assigned to itself' do
        before do
          subject.parent = subject
        end

        it { is_expected.to_not be_valid }
      end
    end
  end

  describe '#root?' do
    subject { Fabricate.build(:target_group, parent: parent).root? }

    context "when target_group doesn't have parent" do
      let(:parent) { nil }

      it { is_expected.to be true }
    end

    context "when target_group has parent" do
      let(:parent) { Fabricate(:target_group) }

      it { is_expected.to be false }
    end
  end
end
