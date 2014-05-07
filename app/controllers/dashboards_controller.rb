class DashboardsController < ApplicationController
  before_action :authenticate_user!  
  
  def index
  	@all_my_adverts = current_user.adverts
  end
end

