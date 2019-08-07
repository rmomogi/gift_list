# frozen_string_literal: true

class GiftList < ApplicationRecord
  belongs_to :user
  has_many :items, class_name: 'GiftListItem'

  scope :by_user, ->(user_id) { where('user_id = ?', user_id) }
end
