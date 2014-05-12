class AddAttachmentRecordingToSubmissions < ActiveRecord::Migration
  def self.up
    change_table :submissions do |t|
      t.attachment :recording
    end
  end

  def self.down
    drop_attached_file :submissions, :recording
  end
end
