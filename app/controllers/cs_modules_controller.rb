class CsModulesController < ApplicationController

  def index
  	@cs_modules = CsModule.all
  end

end
