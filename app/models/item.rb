class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :cost

  

  with_options presence: true do
    validates :image
    validates :name
    validates :description
    validates :category_id
    validates :condition_id
    validates :cost_id
    validates :prefecture_id
    validates :delivery_day_id

    VALID＿PRICE_LEGEX = /\A[0-9]+\z/
    validates :price, inclusion: { in: (300..9999999)}, format: {with: VALID＿PRICE_LEGEX}

  end

  belongs_to :user
  has_one    :deal
  has_one_attached :image
end