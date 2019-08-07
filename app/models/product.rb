class Product < ApplicationRecord
	belongs_to :category
	has_one :stock

	validates :name, presence: true, uniqueness: true
	validates :logo, presence: true
end
