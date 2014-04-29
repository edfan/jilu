class Group < ActiveRecord::Base

  belongs_to :teacher
  has_many :students
  has_many :assignments

end
