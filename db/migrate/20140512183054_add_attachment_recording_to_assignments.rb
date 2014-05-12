class AddAttachmentRecordingToAssignments < ActiveRecord::Migration
  def self.up
    change_table :assignments do |t|
      t.attachment :recording
    end
  end

  def self.down
    drop_attached_file :assignments, :recording
  end
end
