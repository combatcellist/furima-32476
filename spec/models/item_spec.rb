require 'rails_helper'

describe Item do
  before do
    @item = FactoryBot.build(:item)
  end

  context '出品ができる時' do
    it "全ての情報が入力されていれば出品できる" do
      @item = FactoryBot.create(:item)
      expect(@item).to be_valid
     end
  end

  context '出品できない時' do
    it "商品名がないと出品できない" do
      @item.name = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Name can't be blank")
    end

    it "商品画像がないと出品できない" do
      @item.image = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Image can't be blank")
    end

    it "商品説明がないと出品できない" do
      @item.description = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Description can't be blank")
    end

    it "カテゴリーがないと出品できない" do
      @item.category_id = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Category can't be blank")
    end

    it "商品の状態がないと出品できない" do
      @item.condition_id = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Condition can't be blank")
    end

    it "配送料の負担がないと出品できない" do
      @item.cost_id = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Cost can't be blank")
    end

    it "発送元の地域についての情報がないと出品できない" do
      @item.prefecture_id = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Prefecture can't be blank")
    end

    it "発送までの日数についての情報がないと出品できない" do
      @item.delivery_day_id = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Delivery day can't be blank")
    end

    it "価格についての情報がないと出品できない" do
      @item.price = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Price can't be blank")
    end

    it "価格が299円以下だと出品できない" do
      @item.price = 299
      @item.valid?
      expect(@item.errors.full_messages).to include("Price is not included in the list")
    end

    it "価格が10,000,000円以上だと出品できない" do
      @item.price = 10000000
      @item.valid?
      expect(@item.errors.full_messages).to include("Price is not included in the list")
    end

    it "販売価格は半角数字のみ以外では出品できない" do
      @item.price = "３０００"
      @item.valid?
      expect(@item.errors.full_messages).to include("Price is not included in the list")
    end

  end


end