# frozen_string_literal: true

require 'rails_helper'

RSpec.describe GiftListItem, type: :model do
  describe '#associations' do
    it { is_expected.to belong_to(:gift_list) }
  end

  describe '#validations' do
    it { is_expected.to monetize(:price) }
  end
end
