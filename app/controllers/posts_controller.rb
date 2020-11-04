class PostsController < ApplicationController
	before_action :new ,only: [:index]
	def index
		@posts = Post.all.order(created_at: :desc)
	end

  	def new
	 @post = Post.new
	end

	def create
	  @post = current_user.posts.new(post_params)
	  @post.save
	  respond_to do |format|
	  	format.js
	 end
	
end

	private
	 def post_params
	     params.require(:post).permit(:post)
	 	end

end
