class CommentsController < ApplicationController
	
	def create
		@advert = Advert.find(params[:advert_id])
		@advert.comments.create(comment_params)
		redirect_to @advert	
	end

	private
	def comment_params
		params[:comment].permit(:owner, :content)
	end
end