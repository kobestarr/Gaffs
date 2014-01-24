class AddAttachmentImageToGaffs < ActiveRecord::Migration
  def self.up
    change_table :gaffs do |t|
      t.attachment :image
    end
  end

  def self.down
    drop_attached_file :gaffs, :image
  end
end
