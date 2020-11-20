class PostsController < ApplicationController
  def index
	@posts = Post.all
  end
  
  def new
	if session[:user_id].nil?
		flash[:notice] = "Sign in to leave a post."
		redirect_to login_path
	end
  end
  
  def create
	id = session[:user_id]
	writer = Member.find(id)
	firstname = writer.firstname
	lastname = writer.lastname
	Post.create(member_id:id, 
				member_name:firstname+lastname, 
				title:params[:title], 
				body:params[:body])
	redirect_to :root
  end
end
