class Enrolment < ApplicationRecord
  belongs_to :course
  belongs_to :user

  validates :user, :course, presence: true
  validates_uniqueness_of :course_id, scope: :course_id #user cannot subscribe to the same course twice
  validates_uniqueness_of :user_id, scope: :user_id 
  validate :cannot_subscribe_to_own_course

  protected
  def cannot_subscribe_to_own_course
    if slef.new_record?
      if user_id === course.user_id
        errors.add(:base, "You cannot subscribe to your own course")
      end
    end
  end
end
