class OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_item
  before_action :correct_order, only: [:index]
  
  def correct_order
   if @item.user.id == current_user.id || @item.order.present?
      redirect_to root_path
   end
  end
  
  def index
    @order = Form.new
    if current_user == @item.user && @item.blank?
      redirect_to root_path
    end
  end

  def create
    @order = Form.new(order_params)
    if @order.valid?
      pay_item
      @order.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def order_params
    params.require(:form).permit(
      :postcode,
      :prefecture_id,
      :city,
      :address,
      :building_name,
      :phone_number,
      :token
    ).merge(token: params[:token], item_id: params[:item_id], user_id: current_user.id)
  end

  
  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
      Payjp::Charge.create(
        amount: @item.price,
        card: order_params[:token],
        currency: 'jpy'
      )
  end

  def set_item
    @item = Item.find(params[:item_id])
  end



end
