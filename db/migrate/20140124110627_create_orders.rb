class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.integer :gaff_id
      t.integer :user_id
      t.string :stripe_token

      t.timestamps
    end
  end
end
