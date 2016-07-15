class Ability
  include CanCan::Ability

  def initialize(user)
    # Define abilities for the passed in user here. For example:
    #
    user ||= User.new # guest user (not logged in)
      if user.admin?
        can :manage, :all
      else
        can :read, :all
        cannot :read, User
        can :create, Comment, :moderated => FALSE
        can :create, Comment, :moderated => nil
        cannot :create, Comment, :moderated => TRUE
      end
  end
end
