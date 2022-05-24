class ToyPolicy < ApplicationPolicy
  class Scope < Scope

    def resolve
      scope.all
      # If users can see all restaurants
      # scope.where(user: user) # If users can only see their restaurants
      # scope.where("name LIKE 't%'") # If users can only see restaurants starting with `t`
      # ...
    end

    def show?
      true
    end

    def create?
      true
    end

    def update?
      record.user == user
      # record: the restaurant passed to the `authorize` method in controller
      # user: the `current_user` signed in with Devise
    end

    def destroy?
      record.user == user
    end
    # NOTE: Be explicit about which records you allow access to!
    # def resolve
    #   scope.all
    # end
  end
end
