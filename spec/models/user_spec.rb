require 'spec_helper'

describe User do
  pending "add some examples to (or delete) #{__FILE__}"
end
# == Schema Information
#
# Table name: users
#
#  id                     :integer(4)      not null, primary key
#  name                   :string(255)
#  email                  :string(255)     default(""), not null
#  encrypted_password     :string(255)     default(""), not null
#  is_admin               :boolean(1)      default(FALSE)
#  remember_created_at    :datetime
#  sign_in_count          :integer(4)      default(0)
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :string(255)
#  last_sign_in_ip        :string(255)
#  avatar                 :string(255)
#  birthday               :datetime
#  gender                 :boolean(1)      default(TRUE)
#  blood                  :string(255)
#  status                 :string(255)
#  is_active              :boolean(1)      default(FALSE)
#  biography              :string(255)
#  birthplace_province_id :integer(4)
#  birthplace_city_id     :integer(4)
#  birthplace_district_id :integer(4)
#  residence_province_id  :integer(4)
#  residence_city_id      :integer(4)
#  residence_district_id  :integer(4)
#  agree_terms            :boolean(1)      default(FALSE)
#  created_at             :datetime        not null
#  updated_at             :datetime        not null
#

