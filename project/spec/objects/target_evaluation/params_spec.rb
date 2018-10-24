require 'rails_helper'

RSpec.describe TargetEvaluation::Params do
  describe 'validations' do
    let(:valid_locations) do
      [
        { id: 1, panel_size: 20 },
        { id: 3, panel_size: 14 }
      ]
    end

    let(:invalid_locations) do
      [
        { id: 1 },
        { id: 3, panel_size: 14 }
      ]
    end

    it { is_expected.to validate_presence_of(:country_code) }
    it { is_expected.to allow_value('PL').for(:country_code) }
    it { is_expected.to_not allow_value('pl').for(:country_code) }
    it { is_expected.to_not allow_value('P0').for(:country_code) }

    it { is_expected.to validate_presence_of(:target_group_id) }

    it { is_expected.to validate_presence_of(:locations) }
    it { is_expected.to allow_value(valid_locations).for(:locations) }
    it { is_expected.to_not allow_value(invalid_locations).for(:locations) }
  end
end
