require 'rails_helper'

RSpec.describe Budget do
  describe 'associations' do
    it { is_expected.to belong_to(:user) }
  end

  describe 'monetize' do
    it { is_expected.to monetize(:balance) }
  end
end
