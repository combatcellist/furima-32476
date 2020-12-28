class OrdersController < ApplicationController
  before_action :sold_out_item, only: [:index]

  def index
    @item = Item.find(params[:item_id])
    @order = Form.new
  end

  def create
    @item = Item.find(params[:item_id])
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
    Payjp.api_key = "sk_test_3accb06e91c3e18fefc237dc"
      Payjp::Charge.create(
        amount: @item.price,
        card: order_params[:token],
        currency: 'jpy'
      )
  end

  def sold_out_item
    redirect_to root_path if @item.order.present?
  end


end