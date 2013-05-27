# == Schema Information
#
# Table name: votes
#
#  id            :integer          not null, primary key
#  vote          :boolean
#  voteable_id   :integer
#  voteable_type :string(255)
#  user_id       :integer
#

class Vote < ActiveRecord::Base

  belongs_to :user

  belongs_to :voteable, polymorphic: true


end
