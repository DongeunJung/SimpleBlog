class SessionsController < ApplicationController
	def create
		member = Member.find_by(email:params[:email].downcase)
		if member
			if member.authenticate(params[:password])
				session[:user_id] = member.id
				redirect_to :root
			else
				flash[:notice] = "Password is Wrong."
				redirect_to login_path
			end
		else
			flash[:notice] = "Such user does not exist."
			redirect_to login_path
		end
	end
	
	def delete
		session.delete(:user_id)
		redirect_to login_path
	end
end
