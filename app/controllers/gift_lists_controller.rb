# frozen_string_literal: true

class GiftListsController < BaseController
  before_action :authenticate_user!
  before_action :set_gift_list, only: %i[show update destroy edit]

  def new
    @resource = GiftList.new
    respond_to do |format|
      format.html
      format.js
    end
  end

  def create
    @gift_list = GiftList.new(gift_list_params)
    @gift_list.user = current_user

    if @gift_list.save
      flash.now[:success] = t(:success_create)
    else
      flash.now[:error] = @gift_list.errors.full_messages.first
    end
    respond_to do |format|
      format.js
    end
  end

  def show
    @gift_list = GiftList.find session[:default_gift_list]
  end

  def destroy
    @gift_list.destroy
    render json: {}, status: :ok
  end

  def add_item
    @gift_list = GiftList.find session[:default_gift_list]
    stock = Stock.find params[:stock]

    gift_list_item = GiftListItem.find_or_create_by(product: stock.product, gift_list_id: @gift_list.id) do |item|
      item.quantity = 0 if item.new_record?
      item.price = stock.price
    end

    gift_list_item.quantity += params[:quantity].to_i
    @gift_list.items << gift_list_item

    stock.decrement!(:quantity, params[:quantity].to_i)
    flash.now[:notice] = t(:success_create)
    flash.keep(:notice)

    respond_to do |format|
      format.js
    end
  end

  private

  def gift_list_params
    params.require(:gift_list).permit(:name)
  end

  def set_gift_list
    @gift_list = GiftList.find params[:id]
  end
end
