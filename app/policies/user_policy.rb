class UserPolicy < ApplicationPolicy
  class Scope < Scope
    # NOTE: Be explicit about which records you allow access to!
    # def resolve
    #   scope.all
    # end
  end
  def index?
    @user.admin?
  end
  def show?
    @user.admin? || @user == current_user
  end
  def update?
    @user.admin?
  end
  def destroy?
    # retrun false if @user == current_user
    @user.admin?
  end
end
