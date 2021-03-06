# == Schema Information
#
# Table name: posts
#
#  id          :integer          not null, primary key
#  url         :string(255)
#  title       :string(255)
#  description :text
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  user_id     :integer
#

class Post < ActiveRecord::Base
	has_many :post_categories
	has_many :categories, through: :post_categories
  has_many :comments
  belongs_to :user
  has_many :votes, as: :voteable


  validates :title, presence: true
  validates :url, presence: true


  def total_votes
    self.votes.where(vote: true).size - self.votes.where(vote: false).size
  end



end
