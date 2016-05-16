class AddAttachmentImageToDogs < ActiveRecord::Migration
  def self.up
    change_table :dogs do |t|
      t.attachment :image
      t.attachment :image_file_name
      t.attachment :image_content_type
    end
  end

  def self.down
    remove_attachment :dogs, :image
  end
end
