require 'rails_helper'

RSpec.describe TargetEvaluation::LocationParams do
  describe 'validations' do
    it { is_expected.to validate_presence_of(:id) }
    it { is_expected.to validate_presence_of(:panel_size) }
  end
end
