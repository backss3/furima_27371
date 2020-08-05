class OrdersController < ApplicationController
  def index
  end

  def new
    @order = OrderAddress.new
    @item = Item.find(params[:item_id])
    @item.price
  end

  def create
    @order = OrderAddress.new(order_params)

    if @order.valid?
      pay_item
      @order.save
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def order_params
    params.permit(:postal_cord, :prefecture_id, :city, :house_number, :building_name, :phone_number, :item_id).merge(user_id: current_user.id)
  end

  def pay_item
    @item = Item.find(params[:item_id])
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    Payjp::Charge.create(
      amount: @item.price,
      card: params[:token],
      currency: 'jpy' # 通貨の種類
    )
  end
end
