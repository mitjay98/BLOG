class UserPolicy < ApplicationPolicy
  def create?
    user.guest?
  end

  def update?
    record == user
  end

  def index?
    false
  end

  def destroy?
    false
  end

  def oauth?
    user.guest?
  end

  def oauth_user_registration?
    user.guest?
  end  
end
