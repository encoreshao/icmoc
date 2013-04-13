# encoding: utf-8

class User < ActiveRecord::Base
  include Concerns::HasScope

  EMAIL_REGEX = /\A[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]+\z/
  attr_accessor :skip_password, :password, :password_confirmation, :terms, :admin
  attr_accessible :name, :email, :remember_created_at, :password, :skip_password, :password_confirmation, 
                  :last_sign_in_at, :last_sign_in_ip, :current_sign_in_at, :current_sign_in_ip, :sign_in_count, 
                  :birthday, :gender, :status, :biography, :blood, :is_active, :avatar, 
                  :birthplace_province_id, :birthplace_city_id, :birthplace_district_id,
                  :residence_province_id, :residence_city_id, :residence_district_id, 
                  :detail_attributes, :hobby_attributes, :works_attributes, :educationals_attributes, :problems_attributes,
                  :agree_terms, :terms

  mount_uploader :avatar, UserAvatarUploader

  validates :name, presence: false, uniqueness: { case_sensitive: false }, length: { in: 5..20 }, :if => Proc.new { |c| not c.name.blank? }
  validates :password, presence: true, confirmation: true, length: { in: 6..20 }, on: :create
  validates :email, presence: true, uniqueness: { case_sensitive: false }, format: EMAIL_REGEX
  
  has_one :detail, class_name: 'UserDetail'
  has_one :hobby, class_name: 'UserHobby'
  has_many :educationals, class_name: 'UserEducational'
  has_many :works, class_name: 'UserWork'
  has_many :problems, class_name: 'UserPromptProblem'
  
  accepts_nested_attributes_for :detail, reject_if: :all_blank, allow_destroy: true
  accepts_nested_attributes_for :hobby, reject_if: :all_blank, allow_destroy: true
  accepts_nested_attributes_for :educationals, reject_if: :all_blank, allow_destroy: true
  accepts_nested_attributes_for :works, reject_if: :all_blank, allow_destroy: true
  accepts_nested_attributes_for :problems, reject_if: :all_blank, allow_destroy: true

  symbolize :blood, in: [:type_a, :type_b, :type_ab, :type_o], scopes: true, methods: true, allow_blank: true
  
  scope :admin, where(is_admin: true)
  scope :without_admin, where(is_admin: false)
  scope :with_email, ->(email) { where(email: email) }

  before_create do |record|
    record.encrypted_password = Digest::MD5.hexdigest(record.password) if record.password.present?
  end

  def super_admin?
    self.is_admin? && self.email == 'admin@icmoc.com'
  end

  def mark_as_admin!
    update_attribute(:is_admin, true)
  end
  
  def mark_as_user!
    update_attribute(:is_admin, false)
  end

  def reset_login_infomations(ip)
    update_attributes({
        last_sign_in_at: self.current_sign_in_at,
        last_sign_in_ip: self.current_sign_in_ip,
        current_sign_in_ip: ip,
        current_sign_in_at: Time.now,
        sign_in_count: self.sign_in_count+1
      })
  end

  def self.login_in_with_email_and_password(email, password)
    _user = scoped.with_email(email).first
    (_user && _user.encrypted_password == Digest::MD5.hexdigest(password)) ? _user : nil
  end

  def admin
    is_admin? ? '是' : '否'
  end

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

