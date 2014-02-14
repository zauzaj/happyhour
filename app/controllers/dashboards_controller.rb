class DashboardsController < ApplicationController

	before_filter :require_login
	layout 'dashboard_layout'
  
  def index
  	
  end

private 

	def require_login
		if current_user.nil?
	  	flash[:notice] = "Please sign in !" 
	  	redirect_to root_path
	  end
	end

end

