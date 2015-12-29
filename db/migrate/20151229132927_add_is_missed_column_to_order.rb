class AddIsMissedColumnToOrder < ActiveRecord::Migration
  def change
    add_column :orders, :is_missed, :boolean, :default => false
  end
end
