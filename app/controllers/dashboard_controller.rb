# frozen_string_literal: true

class DashboardController < BaseController
  include Pagy::Backend
  before_action :authenticate_user!

  def index
    @gift_lists = GiftList.by_user(current_user.id)
    search = params[:search] || ''

    if params[:category_id].nil?
      @categories = Category.roots
      @parent = nil
      @stocks = Stock.quantity_exists.includes(:product).by_search(search)
    else
      @parent = Category.find params[:category_id]
      @categories = @parent.descendants
      @stocks = Stock.quantity_exists.joins(:product).by_category(params[:category_id]).by_search(search)
    end

    session[:category_id] = params[:category_id]
    @pagy, @records = pagy(@stocks, items: 8)
    default_gift_list
  end

  def change_default_gift_list
    session[:default_gift_list] = params[:id]
    redirect_to action: 'index'
  end

  private

  def default_gift_list
    @default_gift_list = if session[:default_gift_list]
                           GiftList.find session[:default_gift_list]
                         end
  rescue StandardError
    @default_gift_list = nil
  end
end
