class Item < ApplicationRecord

  with_options presence: true do
    validates :image
    validates :name
    validates :description
    validates :category_id
    validates :condition_id
    validates :cost_id
    validates :prefecture_id
    validates :date_id
    validates :price
  end

  belongs_to :user
  has_one    :deal
  has_one_attached :image
end