class RemoveRecordingFromAssignment < ActiveRecord::Migration
  def change
    
    change_table :assignments do |t|
      t.remove :recording_file_name
      t.remove :recording_content_type
      t.remove :recording_file_size
      t.remove :recording_updated_at
    end
    
  end
end
