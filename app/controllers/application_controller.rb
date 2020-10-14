class ApplicationController < ActionController::Base
	before_action :authenticate_user!
	before_action :require_submit_profile, :except => [:destroy]
  #before_action :require_submit_portfolio, except: [:destroy]

def require_submit_profile
  #debugger
    if user_signed_in? && current_user.profile.nil?
     flash[:alert]="Please First submit"
    redirect_to new_profile_path
     #redirect_to edit_profile_path(current_user.profile.id)
    end 
  end
  helper_method :require_submit_profile


def is_user?
     self.roles[0].name.downcase === 'user'
   end
   helper_method :is_user?



  #def get_profile
  #  @profile = current_user&.profile
  #end



#def requests(current_user)
#       #return self.frindlists.find_by(user_id: current_user.id)
#       return self.user.find_by(user_id: current_user.id)
#
#      end
#  
end
