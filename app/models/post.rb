class Post < ApplicationRecord
	belongs_to :member
	has_many :comments
	
	validates:title, presence:true, length:{minimum:5}, uniqueness:true
	validates:body, presence:true, length:{maximum:255}
end
