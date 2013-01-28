# encoding: utf-8

class User < ActiveRecord::Base
  include Concerns::HasScope

  EMAIL_REGEX = /\A[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]+\z/
  attr_accessor :skip_password, :password, :password_confirmation
  attr_accessible :name, :email, :remember_created_at, :password, :skip_password, :password_confirmation, 
                  :last_sign_in_at, :last_sign_in_ip, :current_sign_in_at, :current_sign_in_ip, :sign_in_count, 
                  :birthday, :gender, :status, :biography, :blood, :is_hidden, :avatar, 
                  :birthplace_province_id, :birthplace_city_id, :birthplace_district_id,
                  :residence_province_id, :residence_city_id, :residence_district_id

  mount_uploader :avatar, UserAvatarUploader

  validates :name,  presence: true, uniqueness:  true, length: { in: 5..20 }
  validates :password, presence: true, confirmation: true, length: { in: 6..20 }, on: :create
  validates :email, presence: true, uniqueness:  true, format: EMAIL_REGEX
  
  has_many :details, class_name: 'UserDetail'
  has_many :educationals, class_name: 'UserEducational'
  has_many :hobbies, class_name: 'UserHobby'
  has_many :works, class_name: 'UserWork'

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

end
