class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :display_name
      t.string :email
      t.string :password
      t.string :full_name
      t.string :image
      t.boolean :is_admin , :default=>false

      t.timestamps null: false
    end
  end
end
