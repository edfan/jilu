class Assignment < ActiveRecord::Base

  has_attached_file :recording
  validates_attachment :recording, content_type: { content_type: ["audio/mp3", "audio/mpeg"] }

  has_many :submissions
  belongs_to :groups

end
