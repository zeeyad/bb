class ModulePostPolicy < ApplicationPolicy

  def new?
  	create?
  end

  def create?
  	false
  	return true if programmeleader_or_lecturer?  	
  end

end