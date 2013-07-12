class Ability
  include CanCan::Ability

  def initialize(user)
    # Define abilities for the passed in user here. For example:
    #
    #   user ||= User.new # guest user (not logged in)
    # 2013-7-11 liwei
    # if is_owner?(user)
    #   can :manage, Store, blocked: false, user_id: user.id
    #   can :manage, [User, Order, Cart, Payment, Shippment, Product], store_id: user.store_id

    # # when register done and not own a store
    # # TODO: /users/new
    # # will be ok?
    # elsif is_store_user?(user)
    #   can [:new, :create, :index, :read], Store
    #   can [:edit, :update, :read], User, user_id: user.id

    # # TODO: a user, own a store, and become a user in other-store
    # # store user
    # elsif is_other_store_owner?(user)
    #   can :manage, [Order, Cart, Payment, Shippment], user_id: user.id, store_id: user.store_id
    #   can :read, Store, store_id: user.store_id
    #   can [:edit, :update, :read], User, user_id: user.id, store_id: user.store_id
    # end


    # 2013-7-12 liwei, define new ability
    user ||= User.new

    # what owner can do
    can [:new, :create], Store do |store|
      user.store_id.zero? and user.owner == false
    end

    can [:edit, :update], Store do |store|
      store.user_id = user.id and user.owner == true and store.blocked == false
    end

    can :manage, [User, Product] do |resource|
      resource.store_id = user.store_id and user.owner == true
    end

    # what store user can do
    can :manage, [Order, Cart, Payment, Shippment] do |resource|
      resource.store_id = user.store_id
    end

    can [:index, :read], Store

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


  private

  def is_owner?(user)
    user.owner?
  end

  def is_store_user?(user)
    !user.owner? and user.store_id.nil?
  end

  # TODO: should remove this .....
  # but test should no remove this.
  # it's trick and may cause attack
  def is_other_store_user?(user)
    !user.owner? and !user.store_id.nil?
  end

  def is_other_store_owner?(user)
    !user.owner? and !user.store_id.nil?
  end

end
