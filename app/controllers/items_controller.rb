class ItemsController < ApplicationController
  before_action :set_item, only: [:edit, :show]

  def index
    @items = Item.all
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def destroy
    @item = Item.find(params[:id])
    @item.destroy
  end

  def edit
  end

  def update
    @item = Item.find(params[:id])
    if @item.update(item_params)
      ridirect_to root_path
    else
      render :edit
    end
  end

  def show
    @items = Item.all
  end

  private

  def item_params
    params.require(:item).permit(:image, :name, :description, :category_id, :status_id, :cost_id, :prefecture_id, :day_id, :price).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end
end
