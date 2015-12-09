class Order < ActiveRecord::Base
  has_many :item_orders,dependent: :destroy
  has_many :items,:through => :item_orders
  belongs_to :user
  belongs_to :status
end
