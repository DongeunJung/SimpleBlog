class MembersController < ApplicationController
	def index
		@members = Member.all
	end
	
	def show
		@member = Member.find(params[:id])
		@detail = Detail.find_by(member_id:@member.id)
	end
	
	def create
		Member.create(firstname:params[:firstname],
					  lastname:params[:lastname],
					  email:params[:email].downcase,
					  password:params[:password],
					  password_confirmation:params[:confirm])
		member=Member.find_by(email:params[:email].downcase)
		if member.nil?
			render 'new'
		else
			Detail.create(member_id:member.id,
						  gender:params[:gender],
						  phone:params[:phone],
						  address:params[:address])
			redirect_to members_path
		end
	end
	
	def edit
		@member = Member.find(params[:id])
		@detail = Detail.find_by(member_id:params[:id])
	end
	
	def update
		member = Member.find(params[:id])
		member.firstname = params[:firstname]
		member.lastname = params[:lastname]
		member.email = params[:email]
		member.save
		
		detail = Detail.find_by(member_id:params[:id])
		detail.gender = params[:gender]
		detail.phone = params[:phone]
		detail.address = params[:address]
		detail.save
		
		redirect_to members_path
	end
	
	def destroy
		member = Member.find(params[:id])
		detail = Detail.find_by(member_id:member.id)
		detail.destroy
		member.destroy
		redirect_to members_path
	end
end
