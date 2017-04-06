class CreateOrders < ActiveRecord::Migration[5.0]
  def change
    create_table :orders do |t|
      t.string :meal
      t.string :rest_name
      t.string :menu_img
      t.boolean :status, :default => true
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
