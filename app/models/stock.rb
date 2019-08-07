class Stock < ApplicationRecord
	belongs_to :product

	validates :quantity, presence: true
	monetize :price_cents

	scope :quantity_exists, -> { where('quantity > 0').order('products.name') }
	scope :by_category, ->(category) { where('products.category_id = ?', category) }
	scope :by_search, ->(name) { where('products.name like ?', "%" << name << "%") }
end
