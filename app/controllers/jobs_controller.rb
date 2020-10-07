class JobsController < ApplicationController
	def index
		@jobs = Job.all
	end

	 def new
	 	#debugger
	 	@job = Job.new
	 end

	 def edit
	 	@job = Job.find(params[:id])
	 end
	 def create
	 	#debugger
	 	@job = Job.new(job_params)
	 	if (@job.save)
	 		redirect_to jobs_path
	 		flash[:notice]= "Job has successfully cerate"
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
