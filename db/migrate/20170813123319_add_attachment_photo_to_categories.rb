class AddAttachmentPhotoToCategories < ActiveRecord::Migration
  def self.up
    change_table :categories do |t|
      t.attachment :photo
    end
  end

  def self.down
    remove_attachment :categories, :photo
  end
end
