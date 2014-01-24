class AddUserIdToRooms < ActiveRecord::Migration
  def change

  	#add column to a table, what it is and what type

  	add_column :gaffs, :user_id, :integer
  end
end
