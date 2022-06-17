class LessonPolicy < ApplicationPolicy
  class Scope < Scope
    # NOTE: Be explicit about which records you allow access to!
    def resolve
      scope.all
    end
  end
  def show?
     @record.course.user_id == @user.id || @user.has_role?(:admin)
  end
  def create?
    @record.course.user_id == @user.id
  end
  # def new?
  #   @record.course.user_id == @user.id
  # end
  def destroy?
    @record.course.user_id == @user.id
  end

  def update?
    @record.course.user_id == @user.id
  end

  def edit?
    @record.course.user_id == @user.id
  end

end