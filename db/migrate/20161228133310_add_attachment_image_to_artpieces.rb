class AddAttachmentImageToArtpieces < ActiveRecord::Migration
  def self.up
    change_table :artpieces do |t|
      t.attachment :image
    end
  end

  def self.down
    remove_attachment :artpieces, :image
  end
end
