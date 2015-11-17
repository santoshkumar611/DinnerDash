class AddColumnToUser < ActiveRecord::Migration
  def change
    add_column :users, :set, :boolean, :default=>1
  end
end
