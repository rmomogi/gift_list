class GiftListItem < ApplicationRecord
	belongs_to :gift_list
	belongs_to :product

	monetize :price_cents
end
