class MissedOrder < ActiveRecord::Base
  has_one :order
end
