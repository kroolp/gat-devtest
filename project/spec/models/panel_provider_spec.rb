require 'rails_helper'

RSpec.describe PanelProvider, type: :model do
  subject { Fabricate.build(:panel_provider) }

  describe 'validations' do
    it { is_expected.to validate_presence_of(:code) }
    it { is_expected.to validate_uniqueness_of(:code) }
  end
end
