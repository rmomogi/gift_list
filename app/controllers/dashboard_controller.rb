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
      session[:category_id] = params[:category_id]
    else
      @parent = Category.find params[:category_id]
      @categories = @parent.descendants
      @stocks = Stock.quantity_exists.joins(:product).by_category(params[:category_id]).by_search(search)
      session[:category_id] = params[:category_id]
    end

    @pagy, @records = pagy(@stocks, items: 8)
    default_gift_list
  end

  def change_default_gift_list
    session[:default_gift_list] = params[:id]
    redirect_to action: 'index'
  end

  private
  def default_gift_list
    begin
      if session[:default_gift_list]
        @default_gift_list = GiftList.find session[:default_gift_list]
      else
        @default_gift_list = nil
      end
    rescue
      @default_gift_list = nil
    end
  end
end
