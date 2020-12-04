class OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :dateparams, only: [:index, :create]
  before_action :owner_kick
  before_action :direct_guard

  def index
    @order_address = OrderAddress.new
  end

  def create
    @order_address = OrderAddress.new(order_params)
    if @order_address.valid?
      pay_sys
      @order_address.save
      redirect_to root_path
    else
      render action: :index
    end
  end

  private

  def order_params
    params.require(:order_address).permit(:postal_code, :prefecture_id, :city, :house_number, :building_name, :phone_num, :order_id, :item_id).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
  end

  def pay_sys
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @order.price,
      card: order_params[:token],
      currency: 'jpy'
    )
  end

  def owner_kick
    dateparams
    if @order.user.id == current_user.id
      redirect_to root_path
    end
  end

  def direct_guard
    if @order.order.present?
      redirect_to root_path
    end
  end

  def dateparams
    @order = Item.find(params[:item_id])
  end

end