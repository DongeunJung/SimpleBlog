class CommentsController < ApplicationController
	def create
		if session[:user_id].nil?
			Comment.create(post_id:params[:post_id],
						   member_id:session[:user_id],
						   member_name:params[:writer],
						   comment:params[:comment])
			redirect_to post_path(params[:post_id])
		end
	end
	
	def destroy
		comment = Comment.find(params[:id])
		writer = comment.member_id
		if writer == session[:user_id]
			comment.destroy
		end
		redirect_to post_path(params[:post_id])
	end
end