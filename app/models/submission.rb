class Submission < ActiveRecord::Base
  
  has_attached_file :recording
  validates_attachment :recording, content_type: { content_type: ["audio/mp3", "audio/mpeg"] }

  belongs_to :student
  belongs_to :assignment

end
