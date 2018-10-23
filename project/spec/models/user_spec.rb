require 'rails_helper'

RSpec.describe User, type: :model do
  subject { Fabricate.build(:user, password: nil) }

  describe 'validations' do
    it { is_expected.to validate_presence_of(:email) }
    it { is_expected.to allow_value('email@example.com').for(:email) }
    it { is_expected.to_not allow_value('email@com').for(:email) }
    it { is_expected.to_not allow_value('email@example.c').for(:email) }

    it { is_expected.to validate_presence_of(:password) }
    it { is_expected.to validate_length_of(:password).is_at_least(8) }
  end
end
