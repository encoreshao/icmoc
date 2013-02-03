require 'spec_helper'

describe Category do
  pending "add some examples to (or delete) #{__FILE__}"
end
# == Schema Information
#
# Table name: categories
#
#  id         :integer(4)      not null, primary key
#  name       :string(255)
#  name_en    :string(255)
#  level      :integer(4)
#  parent_id  :integer(4)
#  promotion  :boolean(1)      default(FALSE)
#  is_active  :boolean(1)      default(TRUE)
#  code       :string(255)
#  slug       :string(255)
#  created_at :datetime        not null
#  updated_at :datetime        not null
#

