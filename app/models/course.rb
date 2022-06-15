class Course < ApplicationRecord
  # validations
  validates :title, :short_description, :language, :price, :level, presence: true
  validates :description, presence:  true, length: {minimum:5}
  # Assosiations
  belongs_to :user

  # Friendly id 
  extend FriendlyId
  friendly_id :title, use: :slugged

  # Rich text editor for new and edit
  has_rich_text :description

  def to_s
    title    
  end

end
