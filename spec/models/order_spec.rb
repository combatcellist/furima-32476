require 'rails_helper'

RSpec.describe Form, type: :model do
  before do
    @order = FactoryBot.build(:form)
  end
  
  context '購入できる時' do
    it "全ての必須項目が入力されていれば購入できる" do
      expect(@order).to be_valid
    end 

    it "建物名がなくても購入できる" do
      @order.building_name = nil
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

  it "ハイフンがなければ購入できない" do
    @order.postcode = "1234567"
    @order.valid?
    expect(@order.errors.full_messages).to include("Postcode is invalid")
  end

  it "都道府県名がなければ購入できない" do
    @order.prefecture_id = nil
    @order.valid?
    expect(@order.errors.full_messages).to include("Prefecture can't be blank")
  end

  it "---が選ばれている場合は購入できない" do
    @order.prefecture_id = 1
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

  it "12桁以上では購入できない" do
    @order.phone_number = "090123456789"
    @order.valid?
    expect(@order.errors.full_messages).to include("Phone number is invalid")
  end

  it "英数混合では購入できない" do
    @order.phone_number = "0901234567a"
    @order.valid?
    expect(@order.errors.full_messages).to include("Phone number is invalid")
  end

  it "user_idが空だと購入できない" do
    @order.user_id = nil
    @order.valid?
    expect(@order.errors.full_messages).to include("User can't be blank")
  end

  it "item_idが空だと購入できない" do
    @order.item_id = nil
    @order.valid?
    expect(@order.errors.full_messages).to include("Item can't be blank")
  end

  

  

 end
end
