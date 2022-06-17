class CoursePolicy < ApplicationPolicy
  class Scope < Scope
    # NOTE: Be explicit about which records you allow access to!
    def resolve
      scope.all
    end
  end
  def new?
    @user.has_role?(:teacher)
  end
  def create?
    @user.has_role?(:teacher)
  end
  def destroy?
    @record.user_id == @user.id ||  @user.has_role?(:admin)
  end

  def update?
    @user.has_role?(:admin) || @record.user_id == @user.id
  end

  def edit?
      @record.user == @user || @user.has_role?(:admin)
  end

end
