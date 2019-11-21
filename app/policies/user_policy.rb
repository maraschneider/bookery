class UserPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.where(user: user)
    end
  end

  def show?
    true
  end

  def update?
    user
  end

  def dashboard?
    user
  end

  def list_readings?
    user
  end

  def list_hostings?
    user
  end

  def list_books?
    user
  end
end
