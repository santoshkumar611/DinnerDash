class AddColumnsToOrder < ActiveRecord::Migration
  def change
    add_column :orders, :missed_order_id, :string
  end
end
