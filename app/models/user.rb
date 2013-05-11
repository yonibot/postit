class User < ActiveRecord::Base
	has_many :Post
end