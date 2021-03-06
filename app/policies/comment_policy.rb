class CommentPolicy < ApplicationPolicy
  def new?
    user.present?
  end

  def create?
    user.present?
  end

  def destroy?
    user.present? && (record.user_id == user.id || user.admin?)
  end

  class Scope < Scope
    def resolve
      scope
    end
  end
end
