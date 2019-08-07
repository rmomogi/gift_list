# frozen_string_literal: true

class Category < ApplicationRecord
  has_ancestry
  has_many :products
  has_many :children, class_name: 'Category', foreign_key: 'parent_id'

  belongs_to :parent, class_name: 'Category', optional: true
  validates :name, presence: true, uniqueness: true

  scope :is_parent, -> { where('parent_id is null') }
  scope :children, ->(parent_id) { where('parent_id = ?', parent_id) }
end
