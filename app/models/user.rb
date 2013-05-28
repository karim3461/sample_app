# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  name            :string(255)
#  email           :string(255)
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  password_digest :string(255)
#

class User < ActiveRecord::Base
	before_save { self.email = email.downcase }
  attr_accessible :email, :name, :password, :password_confirmation

  validates :name,  presence: true, length: { maximum: 50 }
  VALID_EMAIL_REGEX = /^[\w+\-.]+@[a-z\d\-.]+\.[a-z]+$/i
  validates :email, presence: true, format: { with: VALID_EMAIL_REGEX }, 
  																	uniqueness: { case_sensitive: false }
	has_secure_password
	validates :password_confirmation, presence: true
	validates :password, length: { minimum: 6 }
end
