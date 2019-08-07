# frozen_string_literal: true

require 'rails_helper'

RSpec.describe DashboardHelper, type: :helper do
  describe '#category_tree' do
    let(:parent) { create(:category) }
    let(:category) { create(:category, parent: parent) }
    let(:html) { "<a href=\"/?category_id=#{parent.id}\">#{parent.name}</a> -> <a href=\"/?category_id=#{category.id}\">#{category.name}</a>" }

    it 'when access category' do
      html_helper = helper.category_tree(category)
      expect(html_helper).to eq html
    end
  end
end
