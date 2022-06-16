class User < ApplicationRecord
  # devise setup
  devise :database_authenticatable, :registerable, :trackable,
         :recoverable, :rememberable, :validatable
  
         # Assosiations
  has_many :courses
  # rolify to give roles
  rolify 

  after_create :assign_default_role
  def assign_default_role
    if User.count ===1
      self.add_role(:admin) if self.roles.blank?
      self.add_role(:student) if self.roles.blank?
      self.add_role(:teacher) if self.roles.blank?
    else 
      self.add_role(:student) if self.roles.blank?
      self.add_role(:teacher) if self.roles.blank?
    end
    
  end


  def to_s
    email
  end

  def userName 
      self.email.split(/@/).first
  end


end
