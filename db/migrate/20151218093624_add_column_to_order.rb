class AddColumnToOrder < ActiveRecord::Migration
  def change
    add_column :orders, :total_cost, :float,:default => 0.0
  end
end
