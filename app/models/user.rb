class User < ApplicationRecord
  # devise setup
  devise :database_authenticatable, :registerable, :trackable,
         :recoverable, :rememberable, :validatable
  
         # Assosiations
  has_many :courses
  has_many :enrolments
  # rolify to give roles
  rolify 

  after_create :assign_default_role
  def assign_default_role
    if User.count ===1
      self.add_role(:admin) if self.roles.blank?
      self.add_role(:student) 
      self.add_role(:teacher) 
    else 
      self.add_role(:student) if self.roles.blank?
      self.add_role(:teacher) 
    end
  end

  # friendly id => pretty url
    extend FriendlyId
    friendly_id :email, use: :slugged
  # Class methods
  def to_s
    email
  end

  # check if user online updated_at defined in app controller
  def online?
    updated_at > 2.minutes.ago
  end

  def userName 
      self.email.split(/@/).first
  end


end
