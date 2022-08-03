# frozen_string_literal: true

class Ability
  include CanCan::Ability

  attr_reader :user

  def initialize(user)
    @user = user

    if user.admin?
      admin_abilities
    else
      user_abilities
    end
  end

  def user_abilities
    can :read, :all
    can :start, Test
    can :update, TestPassage
    can :result, TestPassage
    can :gist, TestPassage
  end

  def admin_abilities
    can :manage, :all
  end
end
