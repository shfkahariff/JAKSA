
class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new # guest user

    if user.admin?
      can [:create, :read], Borang
      can :manage, Borang # allows admin to update and destroy all Borang records
    else
      can :read, Borang, user_id: user.id
      can [ :create, :update, :destroy], Borang, user_id: user.id
    end
  end
end