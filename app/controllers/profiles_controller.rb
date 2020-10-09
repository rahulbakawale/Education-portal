class ProfilesController < ApplicationController
	skip_before_action :require_submit_profile	
		#def index
		#	@profiles  = Profile.all
		#end
	def create
   #	debugger
	 	profile = current_user.build_profile(profile_params)
	 	if (profile.save)
	 	redirect_to profile_path(profile.id)
	 	flash[:notice]= "Profile has Successfuly create"
	 	else
	 	@profile = current_user.build_profile
		flash[:alert]=profile.errors.full_messages
	    render :new
	 end
	end	
	def new
		@profile = current_user.build_profile
	end

	def edit
	  @profile = Profile.find(params[:id])
	end

	def show
	  @profile = Profile.find(params[:id])
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

    	def  profile_params
    		params.require(:profile).permit(:first_name, :last_name, :contact_num, :address, :city, :pin_code, :image)
    	end

end
