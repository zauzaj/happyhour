class Session::RegistrationsController < Devise::RegistrationsController
	def update
		params[:user].delete(:current_password)
		
		if current_user.update_attributes(user_params)
			redirect_to dashboard_path, notice: "Successfully updated"
		else
			redirect_to dashboard_path, notice: "Error"		
		end
	end

	def after_sign_in_path_for(resource)
  	dashboard_path
  end

	private
	def user_params
		devise_parameter_sanitizer.sanitize(:account_update).reject {|k,v| v.blank?}
	end
end