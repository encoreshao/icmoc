class Personality < ActiveRecord::Base
  include Concerns::HasScope
  attr_accessible :code, :name
end
# == Schema Information
#
# Table name: personalities
#
#  id         :integer(4)      not null, primary key
#  name       :string(255)
#  code       :string(255)
#  created_at :datetime        not null
#  updated_at :datetime        not null
#

