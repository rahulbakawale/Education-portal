class AddAttachmentImageToJobs < ActiveRecord::Migration[6.0]
  def self.up
    change_table :jobs do |t|
      t.attachment :image
    end
  end

  def self.down
    remove_attachment :jobs, :image
  end
end
