class ItemsController < ApplicationController
  before_action :signed_in, only: [:new]
  before_action :set_item, only: [:edit, :show]

  def index
    @items = Item.all.order("created_at DESC")
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

  def show
    
  end

  def edit
    
  end

  private

  def item_params
    params.require(:item).permit(:name,:text,:price,:category_id,:condition_id,:shipping_id,:ship_pla_id,:ship_day_id,:content,:image).merge(user_id: current_user.id)
  end

  def set_item
    @tweet = Tweet.find(params[:id])
  end

  def signed_in
    unless user_signed_in?
      redirect_to  '/users/sign_in'
    end
  end
end
