module Concerns::HasScope
  extend ActiveSupport::Concern

  included do
    scope :for_name, ->(name) { name.blank? ? nil : where("name LIKE ?", "%#{name}%") }
    scope :with_name, ->(name) { name.blank? ? nil : where("name LIKE ? OR name_en LIKE ?", "%#{name}%", "%#{name}%") }
  end

end
