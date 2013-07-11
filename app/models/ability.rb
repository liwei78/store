class Ability
  include CanCan::Ability

  def initialize(user)
    # Define abilities for the passed in user here. For example:
    #
    #   user ||= User.new # guest user (not logged in)
    if user.owner?
      can :manage, Store, blocked: false, user_id: user.id
      can :manage, [User, Order, Cart, Payment, Shippment, Product], store_id: user.store_id

    # when register done and not own a store
    # TODO: /users/new
    # will be ok?
    elsif !user.owner? and user.store_id.nil?
      can [:new, :create, :index, :read], Store
      can [:edit, :update, :read], User, user_id: user.id

    # TODO: a user, own a store, and become a user in other-store
    elsif !user.owner? and !user.store_id.nil?
      can :manage, [Order, Cart, Payment, Shippment], user_id: user.id, store_id: user.store_id
      can [:edit, :update, :read], User, user_id: user.id, store_id: user.store_id
    end
    #
    # The first argument to `can` is the action you are giving the user permission to do.
    # If you pass :manage it will apply to every action. Other common actions here are
    # :read, :create, :update and :destroy.
    #
    # The second argument is the resource the user can perform the action on. If you pass
    # :all it will apply to every resource. Otherwise pass a Ruby class of the resource.
    #
    # The third argument is an optional hash of conditions to further filter the objects.
    # For example, here the user can only update published articles.
    #
    #   can :update, Article, :published => true
    #
    # See the wiki for details: https://github.com/ryanb/cancan/wiki/Defining-Abilities
  end
end
