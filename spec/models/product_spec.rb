require 'rails_helper'

RSpec.describe Product, type: :model do

	describe '#associations' do
		it { is_expected.to belong_to(:category) }
		it { is_expected.to have_one(:stock) }
	end

  describe '#validations' do
  	it { is_expected.to validate_presence_of(:name) }
  	it { is_expected.to validate_uniqueness_of(:name) }
  	it { is_expected.to validate_presence_of(:logo) }
  end
end
