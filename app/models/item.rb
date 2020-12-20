class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category

  with_options presence: true do
    validates :image
    validates :name
    validates :description
    validates :category_id
    validates :condition_id
    validates :cost_id
    validates :prefecture_id
    #validates :date_id
    validates :delivery_day_id
    validates :price
    #validates :genre_id, numericality: { other_than: 1 }
  end

  belongs_to :user
  has_one    :deal
  has_one_attached :image
end