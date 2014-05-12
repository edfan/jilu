class Assignment < ActiveRecord::Base

  has_attached_file :recording
  validates_attachment_content_type :recording, :content_type => /\Aaudio\/.*\Z/

  has_many :submissions
  belongs_to :groups

end
