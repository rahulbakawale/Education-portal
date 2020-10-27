class ReviewsController < ApplicationController

	def index
		@reviews = Review.all
	end
	def new 
		@post = Post.find(params[:post_id])
		@reviews = Review.all
		@review = Review.new
	end

	def create
	#	debugger
        @post = Post.find(params[:post_id])
		@review = @post.reviews.new(review_params.merge(post_id: params[:post_id]))
		#@post = Post.find(params[:post_id])
		@review.save
		respond_to do |format|
		format.js
		 end
	end
	def review_params
		params.require(:review).permit(:review)
	end
end

