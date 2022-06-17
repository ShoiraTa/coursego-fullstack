class Lesson < ApplicationRecord
  belongs_to :course
  validates :title, :content, :course, presence: true

  extend FriendlyId
  friendly_id :title, use: :slugged

  # Public activity setup
  include PublicActivity::Model
  tracked owner: Proc.new{|controller, model| controller.current_user}

  # Rich text editor for new and edit
  has_rich_text :content

  # to see activity as a string not active record model
  def to_s
    title
  end
end
