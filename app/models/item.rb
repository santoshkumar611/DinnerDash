class Item < ActiveRecord::Base
  validates :name, :description, :price, :image, :category_id ,presence: true
  has_many :item_orders,dependent: :destroy
  has_many :orders,:through => :Item,dependent: :destroy
  belongs_to :category
end
