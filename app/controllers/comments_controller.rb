class CommentsController < ApplicationController
	before_action :job_find

	def index
	    #@job=Job.find(params[:job_id]) 
		@comments = @job.comments
	end

	def new
		#@job=Job.find(params[:job_id])
		@comments = @job.comments
		@comment = @job.comments.new
	end	

	def show
		#@job = Job.find(params[:job_id])
	end

	def create
		#@job = Job.find(params[:job_id])
		#debugger
		@comment = current_user.comments.new(job_params.merge(job_id: params[:job_id]))
		@comment.user_id = current_user.id
		if @comment.save
			respond_to do |format|
			format.js
		     end
	   end
    end
#flash[:notice] = " Your Comment successfully Insert "
#redirect_to job_comments_path(@job)
#redirect_to new_job_comment_path
    private

     def job_params
     	params.require(:comment).permit(:comment)
     end

     def job_find
       @job = Job.find(params[:job_id]) 

     end

end


