class AddAttachmentBackgroundToHackers < ActiveRecord::Migration
  def self.up
    remove_column :hackers, :background_img
    change_table :hackers do |t|
      t.attachment :background
    end
  end

  def self.down
    remove_column :hackers, :background_img
    drop_attached_file :hackers, :background
  end
end
