# frozen_string_literal: true

require 'rails_helper'

RSpec.describe GiftList, type: :model do
  describe '#associations' do
    it { is_expected.to belong_to(:user) }
    it { is_expected.to have_many(:items).class_name('GiftListItem') }
  end
end
