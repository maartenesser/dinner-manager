class GroupPolicy < ApplicationPolicy
  attr_reader :group

  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def new?
    true
  end

  def create?
    true
  end

  def show?
    # true
    @member_of_group = Group.joins(:memberships).where(id: record.id).where(memberships: { user_id: user.id })
    @member_of_group.exists?
  end

  def update?

  end

  def edit?
    true
  end

  def destroy?
    user.id == record.user_id
  end
end
