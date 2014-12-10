class ProductionPolicy < ApplicationPolicy

  def destroy?
    if record.impressions
      false
    else
      user.present? && (record.user_id == user.id || user.admin?)
    end
  end

  class Scope < Scope
    def resolve
      scope
    end
  end
end
