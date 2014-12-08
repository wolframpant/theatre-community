class CommentPolicy < ApplicationPolicy
  def new?
    user.present?
  end

  def create?
    user.present?
  end

  class Scope < Scope
    def resolve
      scope
    end
  end
end
