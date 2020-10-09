class ApplicationController < ActionController::Base
	before_action :authenticate_user!
	before_action :require_submit_profile, except: [:destroy]
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


#
  # def require_submit_portfolio
  # 	if user_signed_in? && current_user.portfolio.nil?
  # 		flash[:errors] = "Please First submit portfolio"
  # 		redirect_to new_portfolio_path
  # 	end
  # end
  # helper_method :require_submit_portfolio
 
end
