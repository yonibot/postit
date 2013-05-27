# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  username        :string(255)
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  password_digest :string(255)
#

class User < ActiveRecord::Base
	has_many :posts
  has_many :comments
  has_many :votes
  validates :username, presence: true

  has_secure_password  #automatically validates presence of password_digest



end
