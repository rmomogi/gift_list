# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Stock, type: :model do
  describe '#associations' do
    it { is_expected.to belong_to(:product) }
  end

  describe '#validations' do
    it { is_expected.to validate_presence_of(:quantity) }
    it { is_expected.to monetize(:price) }
  end
end
