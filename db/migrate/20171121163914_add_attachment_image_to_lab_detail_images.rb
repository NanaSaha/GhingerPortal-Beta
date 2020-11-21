class AddAttachmentImageToLabDetailImages < ActiveRecord::Migration
  def self.up
    change_table :lab_detail_images do |t|
      t.attachment :image
    end
  end

  def self.down
    remove_attachment :lab_detail_images, :image
  end
end
