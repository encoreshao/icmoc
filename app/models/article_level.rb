class ArticleLevel < ActiveRecord::Base
  include Concerns::HasScope
  attr_accessible :code, :name

  has_many :article
end
# == Schema Information
#
# Table name: article_levels
#
#  id         :integer(4)      not null, primary key
#  name       :string(255)
#  code       :string(255)
#  created_at :datetime        not null
#  updated_at :datetime        not null
#

