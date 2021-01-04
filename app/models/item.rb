class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :cost
  belongs_to :condition
  belongs_to :delivery_day
  belongs_to :prefecture
  
  with_options presence: true do
    validates :image
    validates :name
    validates :description
    validates :category_id, numericality: { other_than: 1, message: "can't be blank" }
    validates :condition_id, numericality: { other_than: 1, message: "can't be blank" }
    validates :cost_id, numericality: { other_than: 1, message: "can't be blank" }
    validates :prefecture_id, numericality: { other_than: 1, message: "can't be blank" }
    validates :delivery_day_id, numericality: { other_than: 1, message: "can't be blank" }

    VALID＿PRICE_LEGEX = /\A[0-9]+\z/
    validates :price, inclusion: { in: (300..9999999)}, format: {with: VALID＿PRICE_LEGEX}

  end

  belongs_to       :user
  has_one_attached :image
  has_one          :order
end