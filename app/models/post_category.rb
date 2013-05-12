# == Schema Information
#
# Table name: post_categories
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class PostCategory < ActiveRecord::Base
  belongs_to :post
  belongs_to :category
end
