class MissedOrder < ActiveRecord::Base
  has_one :order,dependent: :destroy
end
