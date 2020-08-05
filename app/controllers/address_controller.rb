class AddressController < ApplicationController
  def index
  end

  def new
    @address = OrderAdress.new
  end

  def create
    @address = OrderAdress.new(address_params)
  end

  private

  def address_params
    params.reuire(:order_address).permit(:postal_cord, :prefecture, :city, :house_number, :building_name)
  end
end
