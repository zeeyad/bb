class UserImportPolicy < ApplicationPolicy
  def index?
  	return true if programmeleader?
  end
end