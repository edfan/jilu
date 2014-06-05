class Assignment < ActiveRecord::Base

  has_many :submissions
  belongs_to :groups

end
