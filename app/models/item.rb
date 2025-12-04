class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :prefecture
  belongs_to :category
  belongs_to :condition
  belongs_to :shipping_fee_payer
  belongs_to :schedule_delivery

  #belongs_to :user
  #has_one :order

  has_one_attached :image

  validates :name, presence: true
  validates :content, presence: true
  validates :price, presence: true

  validates :prefecture_id, numericality: { other_than: 1 , message: "can't be blank"} 
  validates :category_id, numericality: { other_than: 1 , message: "can't be blank"}
  validates :condition_id, numericality: { other_than: 1 , message: "can't be blank"}
  validates :shipping_fee_payer_id, numericality: { other_than: 1 , message: "can't be blank"}
  validates :schedule_delivery_id, numericality: { other_than: 1 , message: "can't be blank"}
  

end
