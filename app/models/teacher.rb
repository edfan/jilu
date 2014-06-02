class Teacher < ActiveRecord::Base

  has_many :groups

  attr_accessor :password
  before_save :encrypt_password
  
  validates_confirmation_of :password
  validates_presence_of :email
  validates_uniqueness_of :email
  
  def encrypt_password
    if password.present?
      self.password_salt = "etc"
      self.password_hash = BCrypt::Engine.hash_secret(password, password_salt)
    end
  end

  def self.authenticate(email, password)
    teacher = find_by_email(email)
    if teacher && teacher.password_hash == BCrypt::Engine.hash_secret(password, "etc")
      teacher
    else
      nil
    end
  end

end
