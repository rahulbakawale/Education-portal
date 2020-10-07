class ProfilesController < ApplicationController
	
	
	def index
		@profiles  = Profile.all
	end


	def new
		#debugger
		@profile = current_user.build_profile
	end

	def create
    	#debugger
	 	profile = current_user.build_profile(profile_params)
	 	if (profile.save)
	 		redirect_to profiles_path
	 		flash[:notice]= "Profile has Successfuly create"
	 	else
	 		render :new
	 end
	end

	def edit
	  @profile = Profile.find(params[:id])
	end

	def show
	  @profile = Profile.find(params[:id])
	end

	 def update
    	#debugger
	 	if current_user.profile.update(profile_params)
	 		redirect_to profiles_path
	 	flash[:notice]= "Profile has Successfuly update"
		else
	 		render :new
	 end
	end

	private

    	def  profile_params
    		params.require(:profile).permit(:first_name, :last_name, :contact_num, :address, :city, :pin_code, :image)
    	end

end
