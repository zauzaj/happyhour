class SubscribesController < ApplicationController

	def create
		@subscribe = Subscribe.new(subscribe_params)
		if @subscribe.save
			redirect_to root_path, notice: "Prijava je uspesno poslata. Hvala na interesovanju ."
		else
			redirect_to root_path, notice: "Prijava nije uspesno prosla. Molimo pokusajte ponovo"
		end
	end

	private
	def subscribe_params
		params[:subscribe].permit(:email, :settlement_id)
	end
	
end