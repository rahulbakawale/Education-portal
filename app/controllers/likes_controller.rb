class LikesController < ApplicationController
      before_action :find_jobs,:only => [:create, :destroy]
  
      def create
      	#debugger
       @like = @job.likes.new(:user_id => current_user.id)
       if @like.save
           # redirect_to jobs_path
           # flash[:notice] = "Like has successfully"
           respond_to do |format|
              format.js
           end
        end 
      end

      def destroy
        like = @job.likes.find(params[:id])
        like.destroy
        # redirect_to jobs_path
        # flash[:notice] = "Dis-like!"
        respond_to do |format|
          format.js
        end

      end

      private 

      def find_jobs
         @job=Job.find(params[:job_id])
      end

  
end
