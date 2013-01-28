# encoding: utf-8

class Province < ActiveRecord::Base
  include Concerns::HasScope

  attr_accessible :name, :name_en, :name_abbr

  validates :name, :name_en, :name_abbr, presence: true, uniqueness: true
  
  has_many :cities, dependent: :destroy
  has_many :districts, through: :cities


  def self.options
    @options ||= scoped.select('id, name').map{ |p| [p.name, p.id] }
  end

end