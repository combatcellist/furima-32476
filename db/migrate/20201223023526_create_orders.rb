class CreateOrders < ActiveRecord::Migration[6.0]
  def change
    create_table :orders do |t|
      t.string     :user,         null: false
      t.string     :item,         null: false
      t.timestamps
    end
  end
end
