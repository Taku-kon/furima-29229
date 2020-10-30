class ItemsController < ApplicationController
  before_action :signed_in, except: [:index]
  def index
    @items = Item.all
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to controller: :items , action: :index
    else
      render :new
    end
  end

  private

  def item_params
    params.require(:item).permit(:name,:text,:price,:category_id,:condition_id,:shipping_id,:ship_pla_id,:ship_day_id,:content,:image)
  end

  def signed_in
    unless user_signed_in?
      redirect_to  '/users/sign_in'
    end
  end
end
