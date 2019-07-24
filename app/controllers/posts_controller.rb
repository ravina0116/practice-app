class PostsController < ApplicationController
	before_action :find_post, only: [:show,:edit,:update,:destroy]

	def index
		@posts = current_user.posts
	end 

	def show
		
	end

	def new
		@post = current_user.posts.new
	end

	def create
		@post = current_user.posts.new(post_params)
		if @post.save
			flash[:message] = "post created successfully"
		else
			render 'new'
		end
		redirect_to root_path
	end

	def edit;	end

	def update
		@post.update(post_params)
		redirect_to root_path
	end

	def destroy
		@post.destroy
		redirect_to root_path
	end

	private

	def find_post
		@post = Post.find(params[:id])
	end

	def post_params
		params.require(:post).permit(:post_name)
	end
end
