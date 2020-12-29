require 'rails_helper'

RSpec.describe Form, type: :model do
  before do
    @order = FactoryBot.build(:form)
  end
  
  context '購入できる時' do
    it "全ての必須項目が入力されていれば購入できる" do
      @order = FactoryBot(:form)
      expect(@order).to be_valid
    end 
  end

 context '購入できない時' do
  it "tokenがなければ保存できない" do
    @order.token = nil
    @order.valid?
    expect(@order.errors.full_messages).to include("Token can't be blank")
  end

  it "郵便番号がなければ購入できない" do
    @order.postcode = nil
    @order.valid?
    expect(@order.errors.full_messages).to include("Postcode can't be blank")
  end

  it "都道府県名がなければ購入できない" do
    @order.prefecture_id = nil
    @order.valid?
    expect(@order.errors.full_messages).to include("Prefecture can't be blank")
  end

  it "市町村名がなければ購入できない" do
    @order.city = nil
    @order.valid?
    expect(@order.errors.full_messages).to include("City can't be blank")
  end

  it "番地名がなければ購入できない" do
    @order.address = nil
    @order.valid?
    expect(@order.errors.full_messages).to include("Address can't be blank")
  end
  
  it "電話番号がなければ購入できない" do
    @order.phone_number = nil
    @order.valid?
    expect(@order.errors.full_messages).to include("Phone number can't be blank")
  end

 end
end
