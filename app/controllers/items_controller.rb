class ItemsController < ApplicationController
  
  def index
  end

  def new
    @Item = User.new
  end

  def create
    @Item = User.create(user_params)
  end

  def edit
    
  end

  def show
    
  end

  private

  def user_params
    params.require(:user).permit( :email, :password, :nickname, :birthday, :first_name, :last_name, :first_kana, :last_kana,)
  end
end
