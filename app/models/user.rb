class User < ActiveRecord::Base
 validates :password, confirmation: true
 validates :password_confirmation, presence: true
 validates :full_name, :email, :image,presence: true
 validates :email, uniqueness: true
 has_many :orders,dependent: :destroy
end
