# frozen_string_literal: true

require 'rails_helper'

RSpec.describe DashboardController, type: :controller do
  let(:user) { create(:user) }
  let(:gift_list_1) { create(:gift_list, user: user) }
  let(:gift_list_2) { create(:gift_list, user: user) }

  before { login_user }

  describe 'POST #change_default_gift_list' do
    it 'change default list' do
      post :change_default_gift_list, params: { id: gift_list_2.id }
      expect(session[:default_gift_list].to_i).to eq gift_list_2.id
    end
  end
end
