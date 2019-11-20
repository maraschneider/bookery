class BookPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def show?
    true
  end

  def search?
    true
  end

  def update?
    is_owner?
  end

  def create?
    user
  end

  def destroy?
    is_owner?
  end

  private

  def is_owner?
    record.user == user
  end
end
