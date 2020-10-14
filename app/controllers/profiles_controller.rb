class ProfilesController < ApplicationController
	skip_before_action :require_submit_profile
	before_action :profile_find, :only => [:show, :edit, :update]
	before_action :get_profile, :only => [:show, :edit, :update]
	#before_action only: [:edit]


	def index
		@profiles  = Profile.all
		end

	def new
		@profile = current_user.build_profile
	  end

	def edit
		#@profile = Profile.find(params[:id])
		#unless(params[:id].to_i === current_user.profile.id)
		#   redirect_to profiles_path 
		#   flash[:alert] = "You are not authrized to edit"
		#end
	 	#@profile = current_user.profile	
   	end

	
	def show
	  	#@profile = Profile.find(params[:id])
		end


	def create
   		#debugger
	 	profile = current_user.build_profile(profile_params)
	 	if (profile.save)
	 	redirect_to profile_path(profile.id)
	 	flash[:notice]= "Profile has Successfuly create"
	 	else
	 	@profile = current_user.build_profile
		flash[:alert]=profile.errors.full_messages
		flash[:alert]="Some Errors"
	    render :new
	   end
	end

	 def update
    	#debugger
     	@profile = Profile.find(params[:id])
		if @profile.update(profile_params)
	 	redirect_to profile_path	
	 	flash[:notice]= "Profile has Successfuly update"
		else
		flash[:alert]="Some Errors"
		render :edit
	 end
	end

	
	private
		def profile_find
			@profile = Profile.find(params[:id])
		end

		def get_profile
			#debugger
			unless(params[:id].to_i === current_user.profile.id)
		   redirect_to profiles_path 
		   flash[:alert] = "You are not authrized to edit"
			end
	 		@profile = current_user.profile

		  end
		def 
		 profile_params
			params.require(:profile).permit(:first_name, :last_name, :contact_num, :address, :city, :pin_code, :image)
		end

end