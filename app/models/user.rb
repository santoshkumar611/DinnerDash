class User < ActiveRecord::Base
 has_secure_password
 validates :password, confirmation: true
 validates :password_confirmation, presence: true
 validates :full_name, :email,presence: true
 validates :email, uniqueness: true
 has_many :orders,dependent: :destroy
 def has_payment_info?
  self.braintree_customer_id
 end
end
