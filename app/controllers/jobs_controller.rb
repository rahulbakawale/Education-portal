class JobsController < ApplicationController
	def index
		@comment = current_user.comments.new
		   #@comment.toggle!(:active)
		@jobs = Job.all
	end
	 def usermailer
		 debugger
         UserMailer.welcome_email(user).deliver_now
       end

	 def new
	 	@job = Job.new
	 end

	 def edit
	 	@job = Job.find(params[:id])
	 end
	 def create
	 	
	 	@job = current_user.jobs.new(job_params)
	 	if (@job.save)
	 		redirect_to jobs_path
	 		flash[:notice]= "Job has successfully create"
	 		else
	 		render :new
	 	end
	 end

	 def update
	 	@job = Job.find(params[:id])
	 	if @job.update(job_params)
	 		redirect_to jobs_path
	 		flash[:notice] = "Job has successfully Update"
	 		else
	 			render :new
	 		end
	 	 end

     

	 private
		 def job_params
		 	params.require(:job).permit( :description, :image)
		 end


end
